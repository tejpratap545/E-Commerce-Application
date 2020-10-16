import { Date } from 'core-js'
import { differenceInSeconds, parseISO } from 'date-fns'
const strategy = 'local'
const FALLBACK_INTERVAL = 36000

async function refreshTokenF($auth, $axios, $config, token, refreshToken) {
    if (token && refreshToken) {
        try {
            const response = await $axios.post('auth/token', {
                grant_type: 'refresh_token',
                refresh_token: refreshToken,
                client_id: $config.djangoClientId,
                client_secret: $config.djangoClientSecret,
            })

            token = 'Bearer password ' + response.data.access_token
            refreshToken = response.data.refresh_token

            $auth.setToken(strategy, token)
            $auth.setRefreshToken(strategy, refreshToken)
            $axios.setToken(token)
        } catch (error) {
            $auth.logout()
            throw new Error('Error while refreshing token')
        }
    }
}
export default async function ({ $axios, $auth, $config }) {
    if ($auth.loggedIn) {
        let token = $auth.getToken(strategy)
        let refreshToken = $auth.getRefreshToken(strategy)
        const logInDate = $auth.$storage.getCookie('logInDate')

        const diff = differenceInSeconds(new Date(), parseISO(logInDate))
        const refreshInterval = (FALLBACK_INTERVAL - diff) * 0.75
        if (token && refreshToken) {
            await $axios
                .get('/user/me')
                .then((resp) => {
                    $auth.setUser(resp.data)
                })
                .catch((err) => {
                    console.log(err)
                    $auth.logout()
                })
        }
        setInterval(async function () {
            token = $auth.getToken(strategy)
            refreshToken = $auth.getRefreshToken(strategy)
            await refreshTokenF($auth, $axios, $config, token, refreshToken)
        }, refreshInterval)
    }
}
