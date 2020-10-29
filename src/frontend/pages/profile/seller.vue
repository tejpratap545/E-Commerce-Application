<template>
  <div>
    <div style="display: flex; justify-content: space-between">
      <v-dialog v-model="dialog" persistent max-width="600px">
        <template v-slot:activator="{ on, attrs }">
          <v-btn elevation="0" v-bind="attrs" v-on="on"
            ><v-icon>mdi-plus</v-icon></v-btn
          >
        </template>
        <v-card>
          <v-card-title>
            <span class="headline">Add new product</span>
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>
                <v-col cols="12">
                  <v-text-field
                    v-model="product.name"
                    label="Name*"
                    required
                  ></v-text-field>
                </v-col>
                <v-col cols="12">
                  <v-textarea
                    v-model="product.description"
                    label="Decription*"
                    required
                  ></v-textarea>
                </v-col>
                <v-col cols="12" sm="6">
                  <v-select
                    v-model="product.category"
                    :items="categories"
                    label="Category*"
                    required
                  ></v-select>
                </v-col>
                <v-col cols="12" sm="6">
                  <v-select
                    v-model="product.brand"
                    :items="brands"
                    label="Brand*"
                    required
                  ></v-select>
                </v-col>
              </v-row>
            </v-container>
            <small>*indicates required field</small>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="blue darken-1" text @click="dialog = false">
              Close
            </v-btn>
            <v-btn color="blue darken-1" text @click="addProduct"> Save </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>

      <v-btn elevation="0" @click="refreshProducts"
        ><v-icon>mdi-refresh</v-icon></v-btn
      >
    </div>

    <v-data-table
      :items="rows"
      :headers="headers"
      :loading="loading"
      loading-text="Loading... Please wait"
    ></v-data-table>
  </div>
</template>

<script>
export default {
  data: () => ({
    headers: [
      { text: 'Id', value: 'id' },
      { text: 'Brand', value: 'brand' },
      { text: 'Name', value: 'name' },
      { text: 'Category', value: 'category' },
      { text: 'Stock', value: 'stock' },
    ],
    rows: [],
    loading: true,
    dialog: false,
    categories: [],
    brands: [],

    product: {
      name: '',
      description: '',
      category: 0,
      brand: 0,
    },
  }),

  mounted() {
    this.retrieveProducts()
  },

  methods: {
    retrieveProducts() {
      this.loading = true
      this.$axios.$get('seller/product').then((response) => {
        this.rows = response.map(this.formatProducts)
        this.loading = false
      })

      this.$axios.$get('category').then((response) => {
        this.categories = response.map(this.formatSingleList)
      })

      this.$axios.$get('brand').then((response) => {
        this.brands = response.map(this.formatSingleList)
      })
    },

    addProduct() {
      this.dialog = false

      this.$axios
        .$post('product/info/', {
          category: this.product.category,
          brand: this.product.brand,
          name: this.product.name,
          description: this.product.description,
          product_detail: {
            property1: null,
            property2: null,
          },
        })
        .then((response) => {
          this.retrieveProducts()
          this.$notifier.showMessage({
            content: 'New product successfully added',
            color: 'success',
          })
        })
        .catch((err) => {
          this.$notifier.showMessage({
            content: 'Sorry something went wrong',
            color: '#f55d42',
          })
        })
    },

    refreshProducts() {
      this.retrieveProducts()
    },

    formatProducts(row) {
      return {
        id: row.id,
        brand:
          row.brand.name.length > 50
            ? row.brand.name.substr(0, 50) + '...'
            : row.brand.name,
        name: row.name.length > 50 ? row.name.substr(0, 50) + '...' : row.name,
        category: row.category.name,
        stock: row.stock,
      }
    },

    formatSingleList(row) {
      return {
        text: row.name,
        value: row.id,
      }
    },
  },
}
</script>
