import { Date } from 'core-js'
import { differenceInSeconds, parseISO } from 'date-fns'
const strategy = 'local'
const FALLBACK_INTERVAL = 86400 * 1000

export function logout($auth, $axios) {
    $auth.logout()
    $auth.setToken(false)
    $auth.setRefreshToken(false)
    $axios.setHeader('Authorization', false)
}
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
            $auth.$storage.setUniversal('logInDate', new Date())
            $auth.setToken(strategy, token)
            $auth.setRefreshToken(strategy, refreshToken)
            $axios.setToken(token)
        } catch (error) {
            logout($auth, $axios)
            throw new Error('Error while refreshing token')
        }
    }
}

export async function signIn($axios, $auth, store, data) {
    await $axios.$post('auth/token', data).then((res) => {
        $auth.setToken('local', 'Bearer password ' + res.access_token)
        $auth.$storage.setUniversal('logInDate', new Date())
        $auth.setRefreshToken('local', res.refresh_token)
        $axios.setHeader('Authorization', 'Bearer password ' + res.access_token)
        $axios
            .get('/user/me/')
            .then((res) => {
                $auth.setUser(res.data[0])
            })
            .then((res) => {
                store.commit('snackbar/showMessage', {
                    content: `Welcome ${$auth.user.user.first_name} , You have successfully logIn`,
                    color: 'success',
                })
            })
    })
}

export default async function ({ $axios, $auth, $config, $store }) {
    if ($auth.loggedIn) {
        let token = $auth.getToken(strategy)
        let refreshToken = $auth.getRefreshToken(strategy)
        const logInDate = $auth.$storage.getCookie('logInDate')

        const diff = differenceInSeconds(new Date(), parseISO(logInDate))
        const refreshInterval = (FALLBACK_INTERVAL - diff) * 0.75
        if (token && refreshToken) {
            await $axios
                .get('/user/me/')
                .then((resp) => {
                    $auth.setUser(resp.data[0])
                })
                .catch(() => {
                    logout($auth, $axios)

                    $store.commit('snackbar/showMessage', {
                        content: `Your session has been expired . Please sign in again`,
                        color: 'info',
                    })
                })
        }
        setInterval(async function () {
            token = $auth.getToken(strategy)
            refreshToken = $auth.getRefreshToken(strategy)
            await refreshTokenF($auth, $axios, $config, token, refreshToken)
        }, refreshInterval)
    }
}
