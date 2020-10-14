<template>
  <v-row class="justify-center">
    <v-col cols="10" md="6">
      <v-card class="mx-auto" elevation="2" max-width="">
        <v-card-title class="justify-center" primary-title>
          Create Account
        </v-card-title>
        <v-card-text class="my-0 py-0">
          <v-form ref="form" v-model="valid" class="pa-3" lazy-validation>
            <v-row class="pa-0 ma-0 justify-center">
              <v-col class="ma-0 pa-0">
                <v-text-field
                  v-model="firstName"
                  :rules="[rules.required]"
                  label="First Name"
                  required
                  class="pa-0 ma-0"
                ></v-text-field>
              </v-col>
            </v-row>
            <v-row class="pa-0 ma-0 justify-center">
              <v-col class="ma-0 pa-0">
                <v-text-field
                  v-model="lastName"
                  label="Last Name"
                  required
                  class="pa-0 ma-0"
                ></v-text-field>
              </v-col>
            </v-row>
            <v-row class="pa-0 ma-0 justify-center">
              <v-col class="ma-0 pa-0">
                <v-text-field
                  v-model="email"
                  :rules="[rules.required, rules.email]"
                  label="E-mail"
                  required
                  class="pa-0 ma-0"
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
              <v-col cols="8" sm="10" md="9" lg="10" class="ma-0 mt-2 pa-0">
                <v-text-field
                  v-model="cNumber"
                  label="Contact Number"
                  type="number"
                  required
                  :rules="[rules.required, rules.maxContactNumber]"
                  class="pa-0 ma-0"
                ></v-text-field>
              </v-col>
            </v-row>
            <v-row>
              <v-col>
                <v-text-field
                  v-model="password1"
                  class="pa-0 ma-0 justify-center"
                  type="password"
                  :rules="[rules.min, rules.required]"
                  label="Enter Your Password"
                  hint="password must have min 6 character with at at least one uppercase, one lowercase ,one digit and one symbol"
                ></v-text-field>
              </v-col>
            </v-row>
            <v-row>
              <v-col>
                <v-text-field
                  v-model="password"
                  class="pa-0 ma-0 justify-center"
                  :rules="[rules.passwordMatch]"
                  type="text"
                  label="Enter Your Password"
                  hint="varify your Password"
                  @click:append="show1 = !show1"
                ></v-text-field>
              </v-col>
            </v-row>
            <v-row>
              <v-col class="ma-0 pa-0">
                <v-btn class="ma-0 pa-0" block color="" @click="createAccount">
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
export default {
  data() {
    return {
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
          }
        },
      },
    }
  },
  computed: {
    contactNumber() {
      return `"+${this.dialCode}${this.cNumber}"`
    },
  },
  methods: {
    onSelect({ name, iso2, dialCode }) {
      this.dialCode = dialCode
    },
    createAccount() {
      this.$axios
        .$post('user/signup', {
          email: this.email,
          contact_number: this.contactNumber,
          first_name: this.first_name,
          last_name: this.last_name,
          password: this.password,
        })
        .then((res) => console.log(res))
    },
  },
}
</script>
