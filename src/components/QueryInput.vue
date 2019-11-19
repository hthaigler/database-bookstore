<template>
  <div><b-form @submit.prevent="onSubmit">
      <b-form-group
        id="input-group-1"
        label="SQL Query:"
        label-for="query"
        description="Query the database. No DROP allowed"
      >
        <b-form-textarea
          id="query"
          v-model="query"
          placeholder="Enter SQL query..."
          rows="4"
        ></b-form-textarea>
      </b-form-group>


      <b-button type="submit" variant="primary"
        :disabled="hasDROP"
      >Submit</b-button>
      <div v-show="hasDROP"
        class="error"
      >QUERY CANNOT CONTAIN 'DROP'</div>
    </b-form>
  </div>
</template>

<script>
export default {
  name: 'QueryInput',
  props: {
  },
  data() {
    return {
      query: '',
    }
  },
  methods: {
    onSubmit() {
      if (this.hasDROP) {
        return
      }
    }
  },
  computed: {
    hasDROP() {      
      let lowercaseQuery = this.query.toLowerCase()
      let hasDROP = lowercaseQuery.includes('drop')
      return hasDROP
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

.error {
  width: 100%;
  background: #ffe4e8;
  color: #e71336;
  border: #e71336 1px solid;
  border-radius: 5px;
  padding: 1rem;
  text-align: center;
  margin: .5rem 0px;
}
</style>
