import https from 'https'
export default ({ $config: { apiBaseURL }, $axios }) => {
    $axios.defaults.baseURL = apiBaseURL
    $axios.defaults.httpsAgent = new https.Agent({ rejectUnauthorized: false })
}
