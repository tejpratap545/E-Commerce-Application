<template>
  <v-app dark>
    <v-main>
      <v-container>
        <Appbar />
        <Snackbar></Snackbar>
        <nuxt />
      </v-container>
    </v-main>
    <v-footer color="#1E88E5" class="text-center">
      <span class="text-center">&copy; {{ new Date().getFullYear() }}</span>
    </v-footer>
  </v-app>
</template>

<script>
import Appbar from '@/components/Appbar.vue'
import Snackbar from '~/components/utils/Snackbar.vue'
export default {
  components: {
    Appbar,
    Snackbar,
  },
}
</script>
