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
              <v-btn block color="success" @click="signIn"> signin </v-btn>
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
    signIn() {
      this.$axios
        .$post('/auth/token', {
          username: this.username,
          password: this.password,
          client_id: 'zFCncJkZxUMOWSM50emq8AnQAG66VlXfe8vkJuV6',
          client_secret:
            '4BZit68P3ePBZBlIMLKrBV9w9FCwJcu7zHj6WHatmIDSF03LkiQ4IuRTgPrO8xtcjBPL1pVPlPee4Qz9YGgqxkv8YiUxycw1IdCef98OxjVW09KVs3fZQZIpM5MeqdYU',
          grant_type: 'password',
        })
        .then((res) => {
          console.log(res)
          this.$notifier.showMessage({
            content: `You have successfully login`,
            color: 'success',
          })
        })
    },
  },
}
</script>
