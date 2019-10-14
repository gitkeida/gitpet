<template>
    <div>
        
        <Nav></Nav>

        <Banner v-if="data.length > 0" :items="data.length" :loop="true" :autoPlay="3000" :pagination="true" :onIndexChange="onSlideChange" :prevNext="true" v-slot:default="slot">
            <li v-for="(item,idx) in data" :key="idx+new Date()"  :data-idx="idx" :class="{active:slot.realIndex == idx,'g-slide':true}">
                <router-link to="#" >
                    <img :src="item.imgurl" width="100%" alt="">
                </router-link>
                <div class="g-banner_text">
                    <div>
                        <h3>{{item.title}}</h3>
                    </div>
                    <div>
                        <p>{{item.bannerText}}</p>
                    </div>
                </div>
            </li>
        </Banner>

        <section>

            <TwoCase></TwoCase>

            <LikeCase ></LikeCase>

            <ListenCase></ListenCase>

        </section>

        <TheFooter></TheFooter>

    </div>
</template>

<script>
import Nav from '@/components/nav';
import Banner from '@/components/newBanner';
import ListenCase from '@/components/listenCase';
import LikeCase from '@/components/likeCase';
import TwoCase from '@/components/twoCase';
import TheFooter from '@/components/footer';

import api from '@/service/api'

export default {
    data() {
        return {
            msg: '',
            data:[],
            logo: './static/images/logo.png',



        }
    },
    components:{Nav,Banner,ListenCase,LikeCase,TwoCase,TheFooter},
    computed: {},
    methods: {
        onSlideChange:function(){
            // console.log("触发监听")
        },

        getBannerData:function(){
            this.axios.get(api.banner).then(res=>{
                console.log(res)
                if(res.status == 200){
                    this.data = res.data;
                }
            })
        }


    },
    mounted:function(){

        this.getBannerData();
    },
}
</script>

<style lang="less" scoped>
    
    section {padding:100px 0;}

    .g-slide {
        position:relative;

        &>.g-banner_text {
            position:absolute;
            top:20%;
            left:75%;

            & h3 {color:#FFF;padding:16px 40px;display:inline-block;background:#febd17;font-size:45px;font-weight:normal;border-radius:8px;margin-left:-200px;opacity:0;margin-bottom:30px;animation: opacity .9s forwards;}

            & p {padding:10px 20px;color:#fff;background:#000;border-radius:4px;display:inline-block;animation: opacity .9s .3s forwards;opacity:0;margin-left:-200px;}

        }
    }

    @keyframes opacity {
        0%{opacity:0;margin-left:-200px;}
        100%{opacity:1;margin-left:0;}
    }
</style>