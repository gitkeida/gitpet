<template>
  <div id="app">
    <router-view />

    <div class="g-lazy hidden">
        <div class="g-lazy_content"></div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'App',
  
}
</script>

<style lang="less">

    @mainColor:'#d67979';

    #app {
      font-family: 'Avenir', Helvetica, Arial, sans-serif;
      -webkit-font-smoothing: antialiased;
      -moz-osx-font-smoothing: grayscale;

    }

    .g-lazy {
      position:fixed;
      top:0;
      left:0;
      width:100%;
      height:100%;
      background:#fff;
      z-index:99999;

      &>.g-lazy_content {
          position:absolute;
          top:50%;
          left:50%;
          transform:translate(-50%,-50%);
          width:50px;
          height:50px;
          background:#ffb600;
          border-radius:50px;
          animation:loading 1.2s infinite ease-in-out alternate;

      }
    }

    .g-title {
      position:relative;
      text-align:center;
      padding:20px 0 40px;

      &::after{
        content:'';
        display:inline-block;
        position:absolute;
        width:70px;
        height:3px;
        background:#ffb600;
        top:0;
        left:0;
        right:0;
        margin:auto;
      }

      & h3 {font-size:35px;color:#d67979;}
    }

    @keyframes loading {
      0% {margin-top:-5%;}
      70% {height:50px;box-shadow:unset;}
      100% {margin-top:5%;height:37px;box-shadow: 0px 5px 15px 0px rgba(0,0,0,0.3);}
    }
</style>
