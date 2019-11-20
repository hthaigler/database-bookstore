<template>
  <div>
    <b-nav tabs v-show="tables.length > 1">
      <b-nav-item v-for="(table, index) in tables" :key="index"
        :active="selectedTableName == table.table_name"
        @click="navClicked(table, index)">{{table.table_name}}</b-nav-item>
    </b-nav>
    <b-table striped hover :items="tables[selectedTableIndex].data"></b-table>
  </div>
</template>

<script>
export default {
  name: 'DatabaseTable',
  data() {
    return {
      selectedTableName: "People",
      selectedTableIndex: 0,
    }
  },
  methods: {
    navClicked(table, index) {
      this.selectedTableName = table.table_name
      this.selectedTableIndex = index
    }
  },
  props: {
    tables: {
      type: Array,
      default: () => {return []}
    }
  },
  watch: {
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
