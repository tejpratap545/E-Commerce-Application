<template>
  <v-row class="justify-center">
    <v-col cols="10" md="4">
      <v-card>
        <v-card-title class=""> Login to shopIt </v-card-title>
        <v-card-text class="my-0 py-o">
          <v-form ref="form" v-model="valid" class="pa-3" lazy-validationm>
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
export default {
  data() {
    return { username: '', show_password: false, password: '' }
  },
  methods: {
    logIn() {
      this.$auth.logout()
      this.$axios.setToken(false)
      this.$axios
        .$post('auth/token', {
          username: this.username,
          password: this.password,
          client_id: this.$config.djangoClientId,
          client_secret: this.$config.djangoClientSecret,
          grant_type: 'password',
        })
        .then((res) => {
          this.$auth.setToken('local', 'Bearer password ' + res.access_token)
          this.$auth.$storage.setUniversal('logInDate', new Date())
          this.$auth.setRefreshToken('local', res.refresh_token)
          this.$axios.setHeader(
            'Authorization',
            'Bearer password ' + res.access_token
          )

          this.$axios.get('/user/me').then((res) => {
            this.$auth.setUser(res.data)
            this.$notifier.showMessage({
              content: `welcome ${res.data.first_name} have successfully login`,
              color: 'success',
            })
          })
        })
    },
  },
  head: {
    title: 'Sign In',
  },
}
</script>
