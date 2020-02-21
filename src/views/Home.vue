<template>
  <div class="home">
    <b-container>
      <h3>Tables</h3>
      <DatabaseTable
        :tables="formatedTable"
      />
      <div class="mb-4">
      <QueryInput
        @success="onSuccess"
        @submitted="queryTable = null"
      />  
      </div>    
      <div 
        v-show="!!queryTable">
        <h3>Result</h3>
        <DatabaseTable
          :tables="queryTable"
        />
      </div>
    </b-container>    
  </div>
</template>

<script>
// @ is an alias to /src
import QueryInput from '@/components/QueryInput.vue'
import DatabaseTable from '@/components/DatabaseTable.vue'

export default {
  name: 'home',
  data() {
    return {
      tables: null,
      queryTable: null
    }
  },
  components: {
    DatabaseTable,
    QueryInput
  },
  mounted () {
    this.getTables()
  },
  computed: {
    formatedTable() {
      if (this.tables == null) {
        return []
      }
      return this.tables.map(obj => {
        return {
          data: obj.data,
          table_name: obj.table_name.replace(/(^[a-z])|([-_][a-z])/ig, ($1) => {
            return $1.toUpperCase()
            .replace('_', ' ');
          })
        }
      })
    }
  },
  methods: {
    getTables() {
      this.axios
        .get('https://webhome.auburn.edu/~cah0077/api/bookstoreTables.php')
        .then(response => {
          this.tables = response.data
        })
    },
    onSuccess(e) {
      this.queryTable = [e.data]
      if (e.status == 426) {
        this.getTables()
      }
    }
  }
}
</script>

<style lang="css" scoped>
</style>
