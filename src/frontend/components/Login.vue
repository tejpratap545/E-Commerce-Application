<template>
  <v-app>
    <v-row justify="center">
      <v-dialog v-model="dialog" persistent max-width="600px">
        <template v-slot:activator="{ on, attrs }">
          <v-btn color="primary" dark v-bind="attrs" v-on="on">Register</v-btn>
        </template>
        <v-card>
          <v-card-title>
            <v-spacer />
            <span class="text-center" color="blue">Register</span>
            <v-spacer />
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>
                <v-col cols="12">
                  <v-text-field label="First Name" required></v-text-field>
                </v-col>
                <v-col cols="12">
                  <v-text-field label=" Last Name" required></v-text-field>
                </v-col>
                <v-col cols="12">
                  <v-text-field label="Email Address" required></v-text-field>
                </v-col>
                <v-col cols="12">
                  <v-text-field label="Password" type="password" required></v-text-field>
                </v-col>
                <v-col cols="12" sm="4">
                  <v-select :items="['0-17', '18-29', '30-54', '54+']" label="Age" required></v-select>
                </v-col>
                <v-col cols="12" sm="4">
                  <v-autocomplete
                    :items="[ 'Reading', 'Writing', 'Coding', 'Basejump','Singing','Dancing','Puzzle Solving','Gardening','Shopping']"
                    label="Interests"
                    multiple
                  ></v-autocomplete>
                </v-col>
                <v-col cols="12" sm="4">
                  <v-select :items="['Male','Female','Other']" label="Gender" required ></v-select>
                </v-col>

              </v-row>
            </v-container>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="red darken-1" text @click="dialog = false">Close</v-btn>
            <v-btn color="green darken-1" text @click="dialog = false">Let's Go!</v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-row>
  </v-app>
</template>
<script>
export default {
  data: () => ({
    dialog: false,
  }),
}
</script>


