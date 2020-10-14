<template>
  <v-app dark>
    <v-main>
      <v-container>
        <Appbar />
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
export default {
  components: {
    Appbar,
  },
}
</script>
