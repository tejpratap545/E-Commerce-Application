<template>
  <v-row class="justify-center">
    <v-col cols="10" md="6">
      <v-card class="mx-auto" elevation="2" max-width="">
        <v-card-title class="text-center justify-center" primary-title>
          Create Account
        </v-card-title>
        <v-card-text>
          <v-form ref="form" v-model="valid" class="pa-3" lazy-validation>
            <v-row class="pa-0 ma-0 justify-center">
              <v-col class="ma-0 pa-0">
                <v-text-field
                  v-model="name"
                  :counter="10"
                  :rules="nameRules"
                  label="Name"
                  required
                  class="pa-0 ma-0"
                ></v-text-field>
              </v-col>
            </v-row>
            <v-row class="pa-0 ma-0 justify-center">
              <v-col class="ma-0 pa-0">
                <v-text-field
                  v-model="email"
                  :rules="emailRules"
                  label="E-mail"
                  required
                  class="pa-0 ma-0"
                ></v-text-field>
              </v-col>
            </v-row>
          </v-form>
        </v-card-text>
        <v-card-actions>
          <v-btn text color=""> </v-btn>
        </v-card-actions>
      </v-card>
    </v-col>
  </v-row>
</template>
