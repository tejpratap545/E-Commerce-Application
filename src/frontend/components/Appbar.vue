<template>
  <div>
    <v-navigation-drawer v-model="drawer" fixed bottom temporary app>
      <v-card-title>Categories</v-card-title>

      <v-list v-for="(item, index) in categories" :key="index" dense>
        <NLink :to="`/category/${item.title}`">
        <v-list-item link>
          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        </NLink>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar app color="#77D1EC" class="appbar">
      <v-app-bar-nav-icon
        dark
        @click.stop="drawer = !drawer"
      ></v-app-bar-nav-icon>

      <NLink to="/">
        <v-toolbar-title class="brand">ShopIt</v-toolbar-title>
      </NLink>
      <v-spacer />
      <div class="search-container">
        <v-text-field
          append-icon="mdi-close"
          prepend-icon="mdi-magnify"
          filled
          dense
          flat
          solo
        />
      </div>
      <v-spacer />

      <v-menu transition="slide-y-transition" offset-y>
        <template v-slot:activator="{ on, attrs }">
          <v-btn color="primary" dark v-bind="attrs" v-on="on">
            {{
              $auth.loggedIn
                ? `Welcome, ${$auth.user.user.first_name}`
                : 'MY ACCOUNT'
            }}
          </v-btn>
        </template>

        <v-list v-if="!$auth.loggedIn" class="account-menu">
          <v-list-item>
            <NLink to="/signin">
              <v-list-item-title>Sign In</v-list-item-title>
            </NLink>
          </v-list-item>
          <v-list-item>
            <NLink to="/signup">
              <v-list-item-title>Sign Up</v-list-item-title>
            </NLink>
          </v-list-item>
        </v-list>

        <v-list v-else class="account-menu">
          <v-list-item v-if="$auth.user.user.is_seller">
            <NLink to="/profile/seller">
              <v-list-item-title>My Products</v-list-item-title>
            </NLink>
          </v-list-item>

          <v-list-item>
            <NLink to="/profile">
              <v-list-item-title>My Profile</v-list-item-title>
            </NLink>
          </v-list-item>

          <v-divider></v-divider>

          <v-list-item>
            <NLink to="/">
              <v-list-item-title @click="logout">Sign Out</v-list-item-title>
            </NLink>
          </v-list-item>
        </v-list>
      </v-menu>
    </v-app-bar>
  </div>
</template>
<script>
import { logout } from '~/plugins/auth'
export default {
  props: {
    source: String,
  },
  data: () => ({
    drawer: false,
    categories: [],
  }),
  methods: {
    logout() {
      logout(this.$auth, this.$axios).then(() => {
        this.$notifier.showMessage({
          content: `You have successfully logout`,
          color: 'info',
        })
      })
    },

    formatSingleList(row) {return {title: row.name}},
  },
  
  mounted() {
    this
        .$axios.$get('category')
        .then(response => {
          this.categories = response.map(this.formatSingleList)
        })
  }
}
</script>

<style>
* {
  text-decoration: none;
}

.brand {
  color: #fff;
}

.search-container {
  background: #fff;
  padding: 0 8px;
  border-radius: 4px;
  height: 40px;
  width: 400px;
}

.account-menu {
  border-radius: 4px !important;
  margin-top: 10px;
}
</style>
