<template>
  <div>
    <v-container>
      <v-row>
        <v-col class="col-md-4">
          <h2>My Profile</h2>

          <v-card>
            <v-img
              class="profile-picture"
              :src="`https://avatars.dicebear.com/api/avataaars/${$auth.user.user.md5_hash}.svg`"
              rounded
            ></v-img>

            <v-card-title>
              <span>
                {{ $auth.user.user.first_name }}
                {{ $auth.user.user.last_name }}
              </span>

              <v-chip
                v-if="$auth.user.user.is_admin"
                class="ml-2"
                style="color: #fff; background: #27d"
                >admin</v-chip
              >

              <v-chip
                v-if="$auth.user.user.is_seller"
                class="ml-2"
                style="color: #fff; background: #27d"
                >seller</v-chip
              >

              <v-chip v-else class="ml-2">common</v-chip>
            </v-card-title>

            <v-divider></v-divider>
            <div class="pa-5 pl-2">
              <v-btn elevation="0"> Change Profile </v-btn>
            </div>
          </v-card>

          <v-card
            v-if="$auth.user.user.is_email_verified"
            class="mt-5 mt-5 pa-5"
          >
            <v-card-title> Please verify your email </v-card-title>

            <div class="pa-5">
              <NLink to="/profile">
                <v-btn color="primary" dark> Resent Verification Email </v-btn>
              </NLink>
            </div>
          </v-card>

          <v-card class="mt-5 mt-5 pa-5">
            <v-textarea
              clearable
              clear-icon="mdi-close-circle"
              label="Billing Address"
              :value="$auth.user.user.billing_address"
            ></v-textarea>

            <v-textarea
              clearable
              clear-icon="mdi-close-circle"
              label="Shiping Address"
              :value="$auth.user.user.shipping_address"
            ></v-textarea>

            <v-divider></v-divider>
            <div class="pa-5 pl-2">
              <v-btn elevation="0"> Save Address</v-btn>
            </div>
          </v-card>
        </v-col>
        <v-col class="col-md-8">
          <h2>My Orders</h2>

          <div>
            <v-list></v-list>
            <v-list-item v-for="order in orders" :key="order.title">
              <v-sheet width="100%" class="mt-3 mb-3 pa-2" color="#eee" rounded>
                <div style="display: flex; justify-content: space-between">
                  <h4>{{ order.title }}</h4>
                  <p>{{ order.date }}</p>
                </div>
              </v-sheet>
            </v-list-item>
          </div>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
export default {
  data: () => ({
    orders: [
      { title: 'Order-1', date: '23-01-20' },
      { title: 'Order-2', date: '25-01-20' },
      { title: 'Order-3', date: '26-01-20' },
    ],
  }),
  head: {
    title: 'Profile',
  },
  middleware: 'auth-check',
}
</script>
