<template>
  <v-container>
    <v-row v-if="loading">
      <v-col>
        <v-skeleton-loader
          class="mx-auto" 
          type="image,  list-item-avatar, list-item, card-heading, divider, date-picker-options, actions"
        ></v-skeleton-loader>
      </v-col>
    </v-row>
    <v-row v-else>
      <v-col cols="4">
        <v-sheet elevation="1" class="pa-5" style="height:400px" rounded>
          <img :src="(product.image)? product.image : 'https://www.cureuppharma.in/wp-content/uploads/2018/06/dummy.jpg'" style="width: 100%; height:100%" />
        </v-sheet>
      </v-col>
      <v-col cols="8">
        <v-sheet elevation="1" class="pa-8 pl-15 pr-15"  rounded>
          <h2 class="text-center">{{product.name}}</h2>

          <div style="display: flex; justify-content: center" class="mt-5 mb-5" rounded>
            <v-chip>Product Details</v-chip>
          </div>

          <p>
            {{product.description}}
          </p>

          <div v-if="product.product_set" style="display: flex; justify-content: center" class="mt-5 mb-5">
            <v-chip>Buying Options</v-chip>
          </div>

          <div v-else style="display: flex; justify-content: center" class="mt-5 mb-5">
            <h6>No buying option available</h6>
          </div>

          <v-list v-for="(item, index) in product.product_set" :key="index">
            <v-list-item dense>
                <v-card  class="mx-auto" max-width="344"  outlined >
                  <v-list-item three-line>
                    <v-list-item-content>
                      <div class="overline mb-4">OVERLINE</div>
                      <v-list-item-title class="headline mb-1">
                      {{item}}
                      </v-list-item-title>
                      <v-list-item-subtitle>Greyhound divisely hello coldly fonwderfully</v-list-item-subtitle>
                      </v-list-item-content>

                      <v-list-item-avatar tile size="80" color="grey"></v-list-item-avatar>
                    </v-list-item>
                    <v-card-actions>
                      <v-btn outlined rounded text>Button</v-btn>
                    </v-card-actions>
                  </v-card>
              </v-list-item>
            </v-list>
        </v-sheet>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  head: {
    title: 'Product',
  },
  data: () => ({
    product: {},
    loading: true
  }),
  mounted() {
    this
      .$axios.$get(`product/info/${this.$route.query.id}`)
      .then(response => {
          this.product = response //.map(this.formatProducts)
          this.loading = false
      })
  }
}
</script>
