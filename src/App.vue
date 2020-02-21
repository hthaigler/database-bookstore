<template>
  <div id="app">
    <div id="nav" v-show="!$route.meta.noNav">
      <b-navbar toggleable="lg" type="dark" variant="info">
        <b-container>
          <b-navbar-brand href="#">
            <img src="./assets/byron.png" class="d-inline-block align-top" alt="logo">
            Byron's Bookstore
          </b-navbar-brand>          
          <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>
          <b-collapse id="nav-collapse" is-nav>
            <b-navbar-nav>
              <b-link class="router-button" to="home">Tables</b-link>
              <b-link class="router-button" to="queries">Queries</b-link>
              <b-link class="router-button" to="/">Exit</b-link>
            </b-navbar-nav>
          </b-collapse>
        </b-container>
      </b-navbar>
    </div>
    <div id="content" :class="{'is-full-screen': $route.meta.noNav}">
    <router-view/>
    </div>
  </div>
</template>

<style scoped>
  #nav {
    position: fixed;
    width: 100vw;
    top: 0px;
    z-index: 1000;
  }
  #content {
    margin-top: 90px;
  }
  .is-full-screen {
    margin: 0px !important;
  }
  #nav a.router-button {
    color: #ececec;
    text-decoration: none;
    margin-right: .5rem;
    font-size: 1rem;
    padding: .25rem .5rem;
    transition: color .3s ease, background-color .1s ease, border-radius .5s ease;
    border-radius: 0px;
  }
  #nav a.router-button:last-child {
    margin-right: 0px;
  }
  #nav a.router-link-exact-active{
    color: rgb(58, 193, 211);
    background-color: white;
    border-radius: 5px;
  }
</style>
