<template>
  <v-row class="justify-center">
    <v-col cols="10" md="6">
      <v-card class="mx-auto" elevation="2" max-width="">
        <v-card-title class="justify-center" primary-title>
          Create Account
        </v-card-title>
        <v-card-text class="my-0 py-0">
          <v-form class="pa-3" lazy-validation>
            <v-row class="pa-0 ma-0 justify-center">
              <v-col class="ma-0 pa-0">
                <v-text-field
                  v-model="firstName"
                  :rules="[rules.required]"
                  class="pa-0 ma-0"
                  label="First Name"
                  required
                ></v-text-field>
              </v-col>
            </v-row>
            <v-row class="pa-0 ma-0 justify-center">
              <v-col class="ma-0 pa-0">
                <v-text-field
                  v-model="lastName"
                  class="pa-0 ma-0"
                  label="Last Name"
                ></v-text-field>
              </v-col>
            </v-row>
            <v-row class="pa-0 ma-0 justify-center">
              <v-col class="ma-0 pa-0">
                <v-text-field
                  v-model="email"
                  :rules="[rules.required, rules.email]"
                  class="pa-0 ma-0"
                  label="E-mail"
                  required
                ></v-text-field>
              </v-col>
            </v-row>
            <v-row class="pa-0 ma-0 justify-center">
              <v-col col="1">
                <vue-country-code
                  :preferred-countries="['in', 'vn', 'us', 'gb']"
                  @onSelect="onSelect"
                >
                </vue-country-code>
              </v-col>
              <v-col class="ma-0 mt-2 pa-0" cols="8" lg="10" md="9" sm="10">
                <v-text-field
                  v-model="cNumber"
                  :rules="[rules.required, rules.maxContactNumber]"
                  class="pa-0 ma-0"
                  label="Contact Number"
                  required
                  type="number"
                ></v-text-field>
              </v-col>
            </v-row>
            <v-row>
              <v-col>
                <v-text-field
                  v-model="password1"
                  :rules="[rules.min, rules.required]"
                  class="pa-0 ma-0 justify-center"
                  hint="password must have min 6 character with at at least one uppercase, one lowercase ,one digit and one symbol"
                  label="Enter Your Password"
                  type="password"
                ></v-text-field>
              </v-col>
            </v-row>
            <v-row>
              <v-col>
                <v-text-field
                  v-model="password"
                  :rules="[rules.passwordMatch]"
                  class="pa-0 ma-0 justify-center"
                  hint="verify your Password"
                  label="Enter Your Password"
                  :type="show1 ? 'text' : 'password'"
                  :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
                  @click:append="show1 = !show1"
                ></v-text-field>
              </v-col>
            </v-row>
            <v-row>
              <v-col class="ma-0 pa-0">
                <v-btn block class="ma-0 pa-0" color="" @click="createAccount">
                  Continue
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
import { signIn, logout } from '~/plugins/auth'
export default {
  middleware: 'auth-true',
  data() {
    return {
      show1: false,
      firstName: '',
      lastName: '',
      email: '',
      cNumber: '',
      password: '',
      password1: '',
      dialCode: '',
      rules: {
        required: (v) => !!v || 'Required.',
        min: (v) => v.length >= 6 || 'Min 6 characters',
        maxContactNumber: (v) =>
          v.length <= 15 || 'Must be less then 15 character',
        minContactNumber: (v) => v.length >= 10,
        passwordMatch: (v) =>
          this.password === this.password1 || 'Passwords must be same',
        email: (v) => {
          if (v.length > 0) {
            const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
            return pattern.test(v) || 'Invalid e-mail.'
          } else {
            return false
          }
        },
      },
    }
  },
  computed: {
    contactNumber() {
      return `+${this.dialCode}${this.cNumber}`
    },
  },
  methods: {
    onSelect({ name, iso2, dialCode }) {
      this.dialCode = dialCode
    },
    async createAccount() {
      logout(this.$auth, this.$axios)
      await this.$axios
        .$post('user/signup/', {
          email: this.email,
          contact_number: this.contactNumber,
          first_name: this.firstName,
          last_name: this.lastName,
          password: this.password,
        })
        .then((res) => {
          signIn(this.$axios, this.$auth, this.$store, {
            username: this.email,
            password: this.password,
            client_id: this.$config.djangoClientId,
            client_secret: this.$config.djangoClientSecret,
            grant_type: 'password',
          })
          this.$notifier.showMessage({
            content: `Welcome ${res.first_name} , Your account is successfully created  thanks to joining us`,
            color: 'success',
          })
        })
        .catch((err) => {
          this.$notifier.showMessage({
            content: `Sorry something went wrong Please check your email and contact number`,
            color: 'info',
          })
        })
    },
  },
  head: {
    title: 'Sign Up',
  },
}
</script>
