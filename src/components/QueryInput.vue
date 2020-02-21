<template>
  <div><b-form @submit.prevent="onSubmit">
      <b-form-group
        id="input-group-1"
        label="SQL Query:"
        label-for="query"
        description="Query the database. No DROP allowed"
      >
        <b-form-textarea
          :readonly="!editable"
          id="query"
          v-model="query"
          placeholder="Enter SQL query..."
          rows="5"
        ></b-form-textarea>
      </b-form-group>

      <b-button type="submit" variant="primary"
        :disabled="hasDROP"
      >Submit</b-button>
      <div v-show="hasDROP"
        class="error"
      >QUERY CANNOT CONTAIN 'DROP'</div>
      <div v-show="!!errorMessage"
        class="error"
      >{{errorMessage}}</div>
    </b-form>
  </div>
</template>

<script>
export default {
  name: 'QueryInput',
  data() {
    return {
      query: this.queryIn,
      errorMessage: ''
    }
  },
  props: {
    queryIn: {
      type: String,
      default: ''
    },
    editable: {
      type: Boolean,
      default: true
    }
  },
  methods: {
    onSubmit() {
      this.errorMessage = ''
      if (this.hasDROP) {
        return
      }
      this.$emit('submitted')
      this.axios
        .get('https://webhome.auburn.edu/~cah0077/api/query.php', {
           params: {          
            'query': this.query
          }
        })
        .then((response) => {
          this.$emit('success', response)
        }).catch(error => {
          this.errorMessage = error.response.data
        })
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
