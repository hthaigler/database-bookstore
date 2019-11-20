<template>
  <div class="home">
    <b-container class="mt-5 mb-5">
      <div v-for="(query, index) in queries" :key="index">
          <b-list-group-item variant="" @click="selectedIndex = index != selectedIndex ? index: -1; table = null">{{index + 1 + '. ' + query.title}}</b-list-group-item>
          <b-collapse :id="'collapse-' + index" class="mb-4" :visible="selectedIndex == index">
            <b-card>
              <!-- <pre class="card-text">{{query.displayQuery}}</pre> -->
              <query-input 
                class="mb-3"
                :queryIn='query.displayQuery'
                :editable="false"
                @success='onSuccess'
              ></query-input>      
              <div v-show="table != null">
                <DatabaseTable
                  :tables="table"
                />
              </div>
            </b-card>
          </b-collapse>
      </div>
    </b-container>    
  </div>
</template>

<script>
// @ is an alias to /src
import DatabaseTable from '@/components/DatabaseTable.vue'
import QueryInput from '@/components/QueryInput.vue'

export default {
  name: 'home',
  data() {
    return {
      selectedIndex: 0,
      table: null,
      queries: [
        {
          title: 'Show the subject names of books supplied by *supplier2*.',
          displayQuery: 'SELECT category from subjects\nINNER JOIN books ON books.subject_id = subjects.subject_id\nINNER JOIN suppliers ON suppliers.supplier_id = books.supplier_id\nWHERE suppliers.supplier_id = 2',
        },
        {title: 'Show the name and price of the most expensive book supplied by *supplier3*.'},
        {
          title: 'Show the unique names of all books ordered by *lastname1 firstname1*.',
          displayQuery: 'SELECT DISTINCT title from books\n	INNER JOIN order_details ON order_details.book_id = books.book_id\n	INNER JOIN orders ON orders.order_id = order_details.order_id\n	INNER JOIN customers ON customers.customer_id = orders.customer_id\n	WHERE customers.customer_id = 1'
        },
        {
          title: 'Show the title of books which have more than 10 units in stock.',          
          displayQuery: 'SELECT title from books\nWHERE quantity > 10'
        },
        {title: 'Show the total price *lastname1 firstname1* has paid for the books.'},
        {title: 'Show the names of the customers who have paid less than $80 in totals.'},
        {
          title: 'Show the name of books supplied by *supplier2*.',
          displayQuery: 'SELECT title from books\nINNER JOIN suppliers ON suppliers.supplier_id = books.supplier_id\nWHERE suppliers.supplier_id = 2'
        },
        {title: 'Show the total price each customer paid and their names.  List the result in descending price.'},
        {title: 'Show the names of all the books shipped on 08/04/2014 and their shippers\' names.'},
        {title: 'Show the unique names of all the books *lastname1 firstname1* and *lastname4 firstname4* *both* ordered.'},
        {title: 'Show the names of all the books *lastname6 firstname6* was responsible for.'},
        {title: 'Show the names of all the ordered books and their total quantities.  List the result in ascending quantity.'},
        {title: 'Show the names of the customers who ordered at least 2 books.'},
        {title: 'Show the name of the customers who have ordered at least a book in  *category3* or *category4* and the book names.'},
        {title: 'Show the name of the customer who has ordered at least one book written by *author1*.'},
        {title: 'Show the name and total sale (price of orders) of each employee.'},
        {title: 'Show the book names and their respective quantities for open orders (the orders which have not been shipped) at midnight 08/04/2016.'},
        {title: 'Show the names of customers who have ordered more than 1 book and the corresponding quantities.  List the result in the descending quantity.'},
        {title: 'Show the names of customers who have ordered more than 3 books and their respective telephone numbers.'}

      ]
    }
  },
  components: {
    DatabaseTable, QueryInput
  },
  mounted () {
    this.axios
      .get('https://webhome.auburn.edu/~cah0077/api/bookstoreTables.php')
      .then(response => {
        this.tables = response.data
      })
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
    onSuccess(e) {
      this.table = [e.data]
    }
  }
}
</script>

<style lang="css" scoped>
.list-group-item {
  cursor: pointer;
}
</style>
