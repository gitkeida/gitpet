<template>
    <div>
        <nav class="g-nav g-container_min" :class="classList">
            <div class="g-nav_content g-container">
                <div class="g-logo">
                    <img :src="logo" alt="">
                </div>

                <ul class="g-nav_list">
                    <li v-for="(item,key) in navList" :key="item + key" @click="$router.push('/box')">{{item.name}}</li>
                </ul>
            </div>
        </nav>
    </div>
</template>

<script>
export default {
    data() {
        return {
            msg: '',
            logo: './static/images/logo2.gif',
            navList: [
                {name: '主页'},
                {name: 'ME'},
                {name: 'M动态'},
                {name: '图片墙'},
                {name: '联系我们'},
            ],
            classList:{
                fixed:false,
            },
            space:null,
            onwindow:null,
        }
    },
    computed: {},
    methods: {

        onscroll:function(){
            let scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
            
            if(this.space > scrollTop){

                this.space = scrollTop;

                this.classList.fixed = scrollTop > 70;

            } else {
                
                this.space = scrollTop;

                this.classList.fixed = false;

            }
            // console.log(scrollTop)

        }
    },
    mounted:function(){

        let This = this;

        this.onwindow = function(){ This.onscroll(); }
        
        window.addEventListener("scroll",this.onwindow);

    },
    beforeDestroy:function(){

        window.removeEventListener("scroll",this.onwindow);

    },
}
</script>

<style lang="less" scoped>

    .fixed {
        position:fixed;
        top:0;
        z-index:99;
        animation: fixedTop .7s;
    }

    .g-nav {
        @line:70px;
        background:#000;
        width:100%;
        height:@line;


        & >.g-nav_content {
            width:80%;
            height:100%;
            margin:0 auto;
            display:flex;
            justify-content:space-between;

            &>.g-logo {
                line-height:@line;

                // &>img {width:200px;}
                &>img {width:160px;}
            }

            &>.g-nav_list {
                height:100%;

                &>li{
                    height:100%;
                    position:relative;
                    display:inline-block;
                    color:#c4c4c4;
                    padding:0px 20px;
                    line-height:@line;
                    font-size:16px;
                    cursor:pointer;

                    &.active {
                        color:#fff;
                    }

                    &::after{
                        content: '';
                        display:inline-block;
                        position:absolute;
                        bottom:1%;
                        left:0;
                        right:0;
                        margin:auto;
                        width:0%;
                        height:4px;
                        transition:all .7s;
                        background:#d67979;
                        opacity:0.3;
                    }

                    &:hover {
                        color:#d67979;

                        &::after {
                            width:100%;
                            opacity:1;

                        }
                    }

                }
            }
        }
    }

    @keyframes fixedTop {
        0% {top:-70px;opacity:0;}
        100% {top:0px;opacity:1;}
    }
</style>