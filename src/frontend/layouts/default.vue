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
export default {
  components: {},
}
</script>
