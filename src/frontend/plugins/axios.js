export default ({ $config: { apiBaseURL }, $axios }) => {
    $axios.defaults.baseURL = apiBaseURL
}
