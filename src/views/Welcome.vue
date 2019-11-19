<template>
  <div class="welcome">
    <b-container>
      <h1 id="header">Byron's Bookstore</h1>
      <router-link to="home" id="enter">Enter</router-link>
    </b-container>
  </div>
</template>

<script>

export default {
  name: 'welcome',
  components: {
  }
}
</script>

<style lang="css">
  .welcome {
    background-image: url(../assets/background.jpg);
    background-position: center center;
    background-size: cover;

    height: 100vh;
    cursor: url(../assets/byron.png), auto;
    
    font-family: 'Mr Dafoe', cursive;
    text-transform: capitalize;
  }

  h1#header {
    padding-top: 15vh;
    font-size: 4rem;
    color: white;
    text-align: center;

    user-select: none;
  }

  #enter {
    position: absolute;
    left: 50%;
    top: calc(50% + 25px);
    text-decoration: none;
    transform: translate(-50%, -50%);

    font-weight: lighter;
    font-size: 3rem;
    color: #e8fcff;
    text-shadow: 0px 0px 30px #ffcb6a;
    font-family: 'Mr Dafoe', cursive;

    /* text-transform: uppercase; */
    /* letter-spacing: .5rem; */

    cursor: inherit;

    transition: all .3s ease;
  }
  #enter:hover {
    text-shadow: 0px 0px 40px #ffba39;
    font-size: 4rem;
  }
</style>
