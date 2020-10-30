<template>
  <div>
    <v-carousel v-model="model">
      <v-carousel-item v-for="(color, i) in colors" :key="color">
        <v-sheet :color="color" height="100%" tile>
          <v-row class="fill-height" align="center" justify="center">
            <div class="display-3">Slide {{ i + 1 }}</div>
          </v-row>
        </v-sheet>
      </v-carousel-item>
    </v-carousel>

    <div class="text-h4 text-center ma-5">Top products</div>

    <v-container class="products-container" fluid>
      <v-row align="center" justify="center">
        <v-col v-for="product in products" :key="product.title" cols="3">
          <v-card>
            <NLink :to="`/product?id=${product.id}`">
              <v-img
                :src="product.src"
                class="white--text align-end"
                gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                height="200px"
              >
                <v-card-title v-text="product.title"></v-card-title>
              </v-img>
            </NLink>

            <v-card-actions>
              <v-btn icon>
                <v-icon>mdi-heart</v-icon>
              </v-btn>
              
              <v-spacer></v-spacer>

              <v-btn elevation="0">
                <small>{{product.price_options}}</small>
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
      <div v-show="loading" class="text-center">
        <v-progress-circular indeterminate color="primary"></v-progress-circular>
      </div>
    </v-container>
  </div>
</template>

<script>
export default {
  data: () => ({
    model: 0,
    colors: ['orange', 'secondary', 'yellow darken-2', 'red'],

    products: [],
    loading: true,
  }),
  head: {
    title: 'Home',
  },
  methods: {
      formatProducts(row) {
        var price_options = 'Not available'

        if(row.product_set.length > 0) {
          price_options = `Starting from ₹ ${row.product_set[0].current_price}`
        }

        return {
          id: row.id,
          title: (row.name) ?( row.name.length > 50 ? row.name.substr(0, 50) + "..." : row.name ) : '',
          src: row.media,

          price_options: price_options,
        }
      },
  },
  mounted() {
    this
      .$axios.$get('product/info/')
      .then(response => {
          this.products = response.map(this.formatProducts)
          this.loading = false
      })
  }
}
</script>
