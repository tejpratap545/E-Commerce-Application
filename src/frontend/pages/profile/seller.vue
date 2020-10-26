<template>
    <div>
        <v-row>
            <v-col><h2>My Products</h2></v-col>
            <v-col></v-col>
        </v-row>
        <div>
            <v-data-table
                dense
                :headers="headers"
                :items="desserts"
                item-key="name"
                class="elevation-1"
            ></v-data-table>
        </div>
    </div>
</template>