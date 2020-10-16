<template>
  <v-app dark>
    <Appbar />
    <v-main>
      <v-container>
        <Snackbar />
        <nuxt />
      </v-container>
    </v-main>
    <Footer />
  </v-app>
</template>

<script>
import Appbar from '~/components/Appbar.vue'
import Footer from '~/components/Footer.vue'
import Snackbar from '~/components/Snackbar.vue'

export default {
  components: {
    Appbar,
    Footer,
    Snackbar,
  },
}
</script>
