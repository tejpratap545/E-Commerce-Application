<template>
  <v-row class="justify-center">
    <v-col cols="10" md="4">
      <v-card>
        <v-card-title class=""> Login to shopIt </v-card-title>
        <v-card-text class="my-0 py-o">
          <v-form lass="pa-3" lazy-validationm>
            <v-row class="pa-0 ma-0 justify-center">
              <v-col class="ma-0 pa-0">
                <v-text-field
                  v-model="username"
                  class="pa-0 ma-0"
                  label="Enter your email or contact number"
                  required
                  dense
                ></v-text-field>
              </v-col>
            </v-row>

            <v-row>
              <v-col>
                <v-text-field
                  v-model="password"
                  :append-icon="show_password ? 'mdi-eye' : 'mdi-eye-off'"
                  :type="show_password ? 'text' : 'password'"
                  name="input-10-2"
                  dense
                  label="Enter your password"
                  class="input-group--focused"
                  @click:append="show_password = !show_password"
                ></v-text-field>
              </v-col>

              <v-btn block color="success" @click="logIn"> logIn </v-btn>
            </v-row>
          </v-form>
        </v-card-text>
      </v-card>
    </v-col>
  </v-row>
</template>
<script>
import { logout, signIn } from '~/plugins/auth'
export default {
  middleware: 'auth-true',
  data() {
    return { username: '', show_password: false, password: '' }
  },
  methods: {
    logIn() {
      logout(this.$auth, this.$axios)
      signIn(this.$axios, this.$auth, this.$store, {
        username: this.username,
        password: this.password,
        client_id: this.$config.djangoClientId,
        client_secret: this.$config.djangoClientSecret,
        grant_type: 'password',
      })
    },
  },
  head: {
    title: 'Sign In',
  },
}
</script>
