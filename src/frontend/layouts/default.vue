<template>
  <v-app dark>
    <Appbar />
    <v-main>
      <v-container>
        <nuxt />
      </v-container>
    </v-main>
    <Footer />
  </v-app>
</template>

<script>
import Appbar from '~/components/Appbar.vue'
import Footer from '~/components/Footer.vue'

export default {
  components: {
    Appbar,
    Footer,
  },
}
</script>
