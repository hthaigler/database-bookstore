<template>
  <div class="welcome">
    <div class="background" :class="{transitioning: transitioning}">
      <div class="back-1" :style="'transform: perspective(10000px) translateZ(40px) scale(' + scale / 10 * scaleFactor.s1 + ') translate(' + xyCor.x/.9 + 'px, ' + xyCor.y/.9 + 'px )'"></div>
      <div class="back-2" :style="'transform: perspective(100px) translateZ(10px) scale(' + scale / 10 * scaleFactor.s2 + ') translate(' + xyCor.x/3 + 'px, ' + xyCor.y/3 + 'px )'"></div>
      <div class="back-3" :style="'transform: perspective(0px) translateZ(2px) scale(' + scale / 10 * scaleFactor.s3 + ') translate(' + xyCor.x/10 + 'px, ' + xyCor.y/10 + 'px ) rotate(180deg)  scaleX(-1)'"></div>
      <div class="back-4" :style="'transform: perspective(0px) translateZ(0px) scale(' + scale / 10 * scaleFactor.s4 + ') translate(' + xyCor.x/-2 + 'px, ' + xyCor.y/-2 + 'px )'"></div>
    </div>
    <b-container>
      <h1 id="header">Byron's Bookstore</h1>
      <a to="home" id="enter" @click="enterSite">Enter</a>
    </b-container>
  </div>
</template>

<script>

export default {
  name: 'welcome',
  data() {
    return {
      transitioning: false,
      mousePos: {
        x: null,
        y: null
      },
      scale: 10,
      scaleFactor: {
        s1: 1.1,
        s2: 1.1,
        s3: 1.15,
        s4: 1.1
      }
    }
  },
  components: {
  },
  mounted() {
    this.transitioning = false
    window.addEventListener('mousemove',this.mouseIsMoving);
  },
  destroyed: function() {
    window.removeEventListener('mousemove', this.mouseIsMoving);
  },
  methods: {
    mouseIsMoving(e) {
      let x = e.pageX;
      let y = e.pageY;
      this.mousePos = {
        x: x,
        y: y
      }
    },
    enterSite() {
      this.transitioning = true
      this.scaleFactor.s1 = 1.4
      this.scaleFactor.s2 = 10
      this.scaleFactor.s3 = 5
      this.scaleFactor.s4 = 1.75
      setTimeout(() => {        
        this.$router.push('/home')
      }, 500);
    }
  },
  computed: {
    xyCor() {
      let cords = {
        x: (this.mousePos.x - screen.width / 2) / 20,
        y: (this.mousePos.y - screen.height / 2) / 20
      }
      return cords
    }
  },
}
</script>

<style lang="css">
  .welcome {
    height: 100vh;
    cursor: url(../assets/byron.png), auto;
    
    font-family: 'Meddon', serif;
    text-transform: capitalize;

    overflow: hidden;
  }

  h1#header {
    padding-top: 15vh;
    font-size: 2.5rem;
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
    font-size: 2rem;
    color: #e8fcff;
    text-shadow: 0px 0px 10px #ffcb6a6c;
    font-family: 'Meddon', serif;

    /* text-transform: uppercase; */
    /* letter-spacing: .5rem; */

    cursor: inherit;

    transition: all .3s ease;
  }
  #enter:hover {
    text-shadow: 0px 0px 40px #ffba39;
    font-size: 3rem;
  }

  .background {
    height: 100vh;
    width: 100vw;
    overflow: hidden;

    
    position: absolute;
    -webkit-transform-style: preserve-3d;
    transform-style: preserve-3d;
    z-index: -1;

    background: #21262b;
  }
  
  .background > *{
    height: 100vh;
    width: 100vw;
    overflow: hidden;
    
    background-size: cover;
    background-position: center center;
    position: absolute;    
  }

  .background.transitioning > * {
    transition: all .5s ease-in;
  }
  
  .back-1 {    
    background-image: url(../assets/background/background-1.png);
    z-index: 900;
    top: 20px;
  }
  .back-2 {    
    background-image: url(../assets/background/background-2.png);
    z-index: 800;
  }
  .back-3 {    
    background-image: url(../assets/background/background-3.png);
    z-index: 700;
  }
  .back-4 {    
    background-image: url(../assets/background/background-4.png);
    z-index: 600;
  }
</style>
