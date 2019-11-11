<template>
  <div class="home">
    <b-container>
      <DatabaseTable/>
      <QueryInput/>
    </b-container>
  </div>
</template>

<script>
// @ is an alias to /src
import QueryInput from '@/components/QueryInput.vue'
import DatabaseTable from '@/components/DatabaseTable.vue'

export default {
  name: 'home',
  components: {
    DatabaseTable,
    QueryInput
  }
}
</script>
