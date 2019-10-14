<template>
    <div>
            <div class="g-bg_container g-container_min">

                <div class="g-container">
                    <div class=g-title>
                        <h3>个人喜爱</h3>
                    </div>

                    <div>
                        <ul class="g-like_list">
                            <li v-for="(item,idx) in likeData" :key="idx">
                                <div class="g-img"><img :src="item.pic" alt=""></div>
                                <div>  
                                    <h3>{{item.pet_name}}</h3>
                                    <p>{{item.pet_text}}</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
    </div>
</template>

<script>
import api from '../service/api'
export default {
    data() {
        return {
            msg: '',
            likeData:[
                {pic:'./static/images/like4.jpg',pet_name:'大猫咪',pet_text:'无论你的宠物的耳朵周围需要抓伤，还是需要玩耍的地方,都可以给它戴顶帽子'},
                {pic:'./static/images/like2.jpg',pet_name:'小猫咪',pet_text:'最好的朋友宠物护理是领导者的时候，谈到绝对最好的照顾你的猫或狗。'},
                {pic:'./static/images/like3.jpg',pet_name:'老盆友了',pet_text:'大狗子，这是一段很有爱的描述'},
            ],
        }
    },
    computed: {},
    methods: {
        getData(){
            this.axios.get(api.pet).then(res=>{
                console.log(res);
                if (res.status == 200){
                    this.likeData = res.data;
                }
            })
        },
    },
    mounted:function(){
        this.getData();
    }
}
</script>

<style lang="less" scoped>
    .g-like_list {
        display:-webkit-box;
        display:-ms-flexbox;
        display:flex;
        justify-content:space-between;

        &>li {
            width: 33%;
            text-align:center;
            color:#fff;

            & .g-img {
                overflow:hidden;

                &>img {transition:all .6s;}
                &>img:hover {transform:scale(1.1);}
            }

            & h3 {font-size:1.5em;color:#fff;margin:30px 0;}

            & p {padding:0 25px;line-height:25px;}
        }
    }

    .g-bg_container {
        background:url(../../static/images/slider3.jpg) no-repeat;
        background-color:rgba(0,0,0,0.8);
        background-size:cover;
        background-attachment:fixed;
        background-position: center center;
        padding:30px 0;
    }

    .g-title>h3 {color:#fff;}
</style>