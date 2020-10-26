<template>
  <v-row class="justify-center">
    <v-col cols="10" md="4">
      <v-card>
        <v-card-title class="">Forgot password</v-card-title>
        <v-card-text class="my-0 py-o">
          <v-form class="pa-3" lazy-validationm>
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
                <v-btn block color="success" @click="passowrdLink">
                  Send Reset link
                </v-btn>
              </v-col>
            </v-row>
          </v-form>
        </v-card-text>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
export default {
  middleware: 'auth-true',
  data: () => ({
    username: '',
  }),
  methods: {
    async passowrdLink() {
      await this.$axios
        .$post('password/reset/send/', {
          username: this.username,
        })
        .then((res) => {
          this.$notifier.showMessage({
            content: `Email sent, check your inbox`,
            color: 'success',
          })
        })
        .catch((err) => {
          this.$notifier.showMessage({
            content: `Sorry something went wrong, Please check your email and contact number `,
            color: '#f55d42',
          })
        })
    },
  },
  head: {
    title: 'Forgot password',
  },
}
</script>
