export default async function ({ $auth, redirect, store }) {
    const user = $auth.user.user
    if (user && (user.is_seller || user.is_admin)) {
        // let the user in
    } else {
        store.dispatch('notifier/showMessage', {
            color: 'error',
            content: 'You must be an admin or seller to view that page.',
        })
        redirect('/')
    }
}
