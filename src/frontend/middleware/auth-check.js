export default function ({ $auth, route, redirect, store }) {
    if (!$auth.loggedIn) {
        const REDIRECT_URL = '/signin?redirect=' + route.path
        store.commit('notifier/showMessage', {
            color: 'error',
            text: 'You must be logged in to view that page.',
        })
        redirect(REDIRECT_URL)
    }
}
