export default function ({ $auth, route, redirect, store }) {
    if ($auth.loggedIn) {
        const REDIRECT_URL = '/?redirect=' + route.path
        store.commit('notifier/showMessage', {
            color: 'info',
            text: 'You are already loggedIn',
        })
        redirect(REDIRECT_URL)
    }
}
