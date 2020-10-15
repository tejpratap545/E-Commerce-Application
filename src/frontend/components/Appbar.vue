<template>
  <div>
    <v-navigation-drawer v-model="drawer"    
      absolute
      bottom
      temporary>
      <v-card-title>Categories</v-card-title>

      <v-list 
          v-for="(item, index) in categories"
          :key="index" dense>
        <v-list-item link>
          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>

    </v-navigation-drawer>

    <v-app-bar app color="#03045e" class="appbar" hide-on-scroll>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer" dark></v-app-bar-nav-icon>
      <v-toolbar-title class="brand">ShopIt</v-toolbar-title>

      <v-spacer />
      <div class="search-container">
        <v-text-field append-icon="mdi-close" prepend-icon="mdi-magnify" 
          filled 
          dense 
          flat
          solo />
      </div>
      <v-spacer />

      <v-menu transition="slide-y-transition" offset-y>
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            color="primary"
            dark
            v-bind="attrs"
            v-on="on"
          >
          My Account
        </v-btn>
        </template>

        <v-list class="account-menu">
          <v-list-item
            v-for="(item, index) in menu"
            :key="index"
          >
            <NLink :to="item.link">
              <v-list-item-title>{{ item.title }}</v-list-item-title>
            </NLink>
          </v-list-item>
        </v-list>
      </v-menu>
  </v-app-bar>
  </div>
</template>

<script>
export default {
  props: {
    source: String,
  },
  data: () => ({
    menu: [
        { title: 'Sign In', link: '/signin' },
        { title: 'Sign Up', link: '/signup' },
      ],
    drawer: false,
    categories: [
      { title: 'Computers' },
      { title: 'Grocery' },
      { title: 'Books' },
      { title: 'Home electronics' },
    ]
  }),
}
</script>

<style>
  *{
    text-decoration: none;
  }

 .brand {
    color: #fff;
  }

  .search-container {
    background: #fff;
    padding:0 8px;
    border-radius: 4px;
    height: 40px;
    width: 400px;
  }

  .account-menu{
    border-radius: 4px !important;
    margin-top: 10px;
  }
</style>