export default ({ app, store, auth }, inject) => {
    inject('notifier', {
        showMessage({ content = '', color = '' }) {
            store.commit('snackbar/showMessage', { content, color })
        },
    })
}
