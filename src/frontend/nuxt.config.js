import path from 'path'
import fs from 'fs'
import colors from 'vuetify/es5/util/colors'
export default {
    server: {
        host: '0.0.0.0',
        port: 3030,
        https: {
            key: fs.readFileSync(path.resolve(__dirname, 'key.pem')),
            cert: fs.readFileSync(path.resolve(__dirname, 'crt.pem')),
        },
    },
    render: {
        // https://nuxtjs.org/api/configuration-render/#http2
        http2: {
            pushAssets: (req, res, publicPath, preloadFiles) =>
                preloadFiles
                    .filter((f) => f.asType === 'script' && f.file === 'runtime.js')
                    .map((f) => `<${publicPath}${f.file}>; rel=preload; as=${f.asType}`),
        },
    },
    // Global page headers (https://go.nuxtjs.dev/config-head)
    head: {
        titleTemplate: '%s - ShopIt',
        title: 'ShopIt',
        meta: [
            { charset: 'utf-8' },
            { name: 'viewport', content: 'width=device-width, initial-scale=1' },
            { hid: 'description', name: 'description', content: '' },
        ],
        link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }],
    },

    // Global CSS (https://go.nuxtjs.dev/config-css)
    css: [],

    // Plugins to run before rendering page (https://go.nuxtjs.dev/config-plugins)

    // Auto import components (https://go.nuxtjs.dev/config-components)
    components: true,

    // Modules for dev and build (recommended) (https://go.nuxtjs.dev/config-modules)
    buildModules: [
        // https://go.nuxtjs.dev/eslints
        // https://go.nuxtjs.dev/stylelint
        // '@nuxtjs/stylelint-module',
        // https://go.nuxtjs.dev/vuetify
        '@nuxtjs/vuetify',
    ],

    // Modules (https://go.nuxtjs.dev/config-modules)
    modules: [
        // https://go.nuxtjs.dev/axios
        '@nuxtjs/axios',
        // https://go.nuxtjs.dev/pwa
        '@nuxtjs/pwa',
        // https://github.com/nuxt-community/sentry-module
        '@nuxtjs/sentry',
        // https://auth.nuxtjs.org/
        '@nuxtjs/auth',
    ],

    plugins: ['@/plugins/countryCode', '~/plugins/notifier.js'],
    // Axios module configuration (https://go.nuxtjs.dev/config-axios)
    axios: {
        baseURL: process.env.API_BASE_URL || 'http://localhost:8000/api/',
    },

    // Vuetify module configuration (https://go.nuxtjs.dev/config-vuetify)
    vuetify: {
        customVariables: ['~/assets/variables.scss'],
        theme: {
            dark: false,
            themes: {
                dark: {
                    primary: colors.blue.darken2,
                    accent: colors.grey.darken3,
                    secondary: colors.amber.darken3,
                    info: colors.teal.lighten1,
                    warning: colors.amber.base,
                    error: colors.deepOrange.accent4,
                    success: colors.green.accent3,
                },
            },
        },
    },

    // Build Configuration (https://go.nuxtjs.dev/config-build)
    build: {},

    // env variable https://nuxtjs.org/blog/moving-from-nuxtjs-dotenv-to-runtime-config/
    publicRuntimeConfig: {
        apiBaseURL: process.env.API_BASE_URL || 'http://localhost:8000/api/',
        djangoClientId: process.env.DJANGO_CLIENT_ID || '',
        djangoClientSecret: process.env.DJANGO_CLIENT_SC || '',
    },
    privateRuntimeConfig: {},
    auth: {
        localStorage: false,
        cookie: {
            options: {
                expires: 7,
            },
        },
        strategies: {
            local: {
                endpoints: {
                    login: { url: '/auth/token/', method: 'post', propertyName: false },
                    logout: false,
                    user: false,
                },
                tokenType: 'Bearer password',
            },
        },
        plugins: ['~/plugins/axios.js', '~/plugins/auth.js'],
    },
}
