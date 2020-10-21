<template>
      <v-row class="justify-center">
    <v-col cols="10" md="4">
      <v-card>
        <v-card-title class="">Reset password</v-card-title>
        <v-card-text class="my-0 py-o">
            <v-form class="pa-3" lazy-validationm>
            <v-row class="pa-0 ma-0 justify-center">
              <v-col class="ma-0 pa-0">
                <v-text-field
                    v-model="password"
                    class="pa-0 ma-0"
                    hint="password must have min 6 character with at at least one uppercase, one lowercase ,one digit and one symbol"
                    label="Enter Your Password"
                    required
                    dense
                ></v-text-field>

                <v-text-field
                    v-model="password1"
                    class="pa-0 ma-0"
                    hint="verify your Password"
                    label="Reenter Your Password"
                    required
                    dense
                ></v-text-field>
              </v-col>
            </v-row>

            <v-row>
              <v-col>
                <v-btn block color="success" @click="passowrdReset"> Password Reset</v-btn>
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
  methods: {
    async passowrdReset() {
        await this.$axios
        .$post('password/reset/send/', {
          username: this.email,
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
    }
  },
  data: () => ({
    password: '',
    password1: '',
  }),
  head: {
    title: 'Password reset',
  },
}
</script>