<template>
  <div>
    <b-nav tabs>
      <b-nav-item v-for="(table, index) in tables" :key="index"
        :active="selectedTableName == table.tableName"
        @click="navClicked(table, index)">{{table.tableName}}</b-nav-item>
    </b-nav>
    <b-table striped hover :items="tables[selectedTableIndex].items"></b-table>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  props: {
  },
  data() {
    return {
      selectedTableName: "People",
      selectedTableIndex: 0,
      tables: [
        {
          tableName: 'People',
          items: [
            { age: 40, first_name: 'Dickerson', last_name: 'Macdonald' },
            { age: 21, first_name: 'Larsen', last_name: 'Shaw' },
            { age: 89, first_name: 'Geneva', last_name: 'Wilson' },
            { age: 38, first_name: 'Jami', last_name: 'Carney' }
          ]      
        },
        {
          tableName: 'Person',
          items: [
            { age: 40, first_name: 'Joe', last_name: 'Macdonald' },
            { age: 21, first_name: 'Joe', last_name: 'Shaw' },
            { age: 89, first_name: 'Joe', last_name: 'Wilson' },
            { age: 38, first_name: 'Joe', last_name: 'Carney' }
          ]      
        },
      ]
    }
  },
  methods: {
    navClicked(table, index) {
      this.selectedTableName = table.tableName
      this.selectedTableIndex = index
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
