<template>
    <div>
            <div class="g-content g-container">
                <ul class="g-content_select" ref="content1">
                    <li v-for="(item,idx) in textData" :key="idx" :class="{openDonghua:anmite}">
                        <div><img :src="'./static/images/'+item.img" alt=""></div>
                        <h3>{{item.title}}</h3>
                        <p>{{item.text}}</p>
                    </li>
                </ul>
            </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            msg: '',
            textData:[
                {img:'icon1.png',title:'set up',text:'把我设置成您的特别关心，每天都有不一样的惊喜哟'},
                {img:'icon2.png',title:'listen to me.',text:'收听我的最新消息哟，么么哒，啊里啊撒哟'},
                {img:'icon3.png',title:'contact me',text:'每天都要为我打call哟'},
            ],
            anmite:false,
            onwindow:null,
        }
    },
    computed: {},
    methods: {
        scroll:function(){
            let This = this;

            this.onwindow = function(){ This.onscroll()};

            window.addEventListener("scroll",this.onwindow);

        },
        onscroll:function(){
            
                let scrollTop = document.body.scrollTop || document.documentElement.scrollTop,
                    windowHeight = document.documentElement.clientHeight,
                    offsetTop = this.$refs.content1.offsetTop;

                    // console.log("scrollTop:"+scrollTop)
                    // console.log("windowHeight:"+windowHeight)
                    // console.log(scrollTop + windowHeight)
                    // console.log("offsetTop:"+offsetTop)

                    if(offsetTop < windowHeight + scrollTop ){
                        this.anmite = true;
                    } else {
                        this.anmite = false;
                    }
        }
    },
    mounted:function(){
        this.scroll();
    },
    beforeDestroy:function(){

        window.removeEventListener("scroll",this.onwindow);

    }
}
</script>

<style lang="less" scoped>
    .g-content_select {
        padding:100px 0 80px;
        display:flex;
        justify-content: space-between;

        & li {
            text-align:center;
            opacity:0;
            width:33%;

            & h3 {color:#000;font-size:2em;margin:20px 0;text-transform:uppercase;}

            & p {color:#333;font-size:1em;white-space: pre-wrap;}
        }

        & img {width:130px;height:130px;border-radius:50%;}
    }

    

    .openDonghua {
        animation:donghua 1s forwards;
    }

    @keyframes donghua {
        0% {opacity:0;transform:translateY(50px);}
        100% {opacity:1;transform:translateY(0px);}
    }
</style>