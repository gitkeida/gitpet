<template>
    <div>
        <footer class="g-footer g-container_min">
            <div class="g-container">

                <ul class="g-list">
                    <li>
                        <h4>近期活动</h4>
                        <ul class="g-list_text">
                            <li v-for="(item,idx) in data[0].list" :key="idx">{{idx+1}}.{{item}}</li>
                        </ul>
                    </li>

                    <li>
                        <h4>近期评论</h4>
                        <ul class="g-list_text">
                            <li v-for="(item,idx) in data[1].list" :key="idx">{{idx+1}}.{{item}}</li>
                        </ul>
                    </li>

                    <li>
                        <h4>标签</h4>
                        <ul class="g-list_tag">
                            <li v-for="(item,idx) in data[2].list" :key="idx">{{item}}</li>
                        </ul>
                    </li>

                    <li>
                        <h4>ABOUTUS</h4>
                        <p class="g-search_title">想知道更多，搜索一下</p>
                        <div class="g-search">
                            <input type="text" placeholder="Search...">
                            <a href="javascript:;">
                                <img :src="'./static/images/'+icon" alt="">
                            </a>
                        </div>
                    </li>
                </ul>

            </div>
        </footer>
    </div>
</template>

<script>
export default {
    data() {
        return {
            msg: '页面底部',
            data:[
                {title:'近期活动',list:["天天天天天上班","国庆就要来咯","国庆假期的近期行程","又要上班咯"]},
                {title:'近期评论',list:["20岁的好多天，依旧不如你聪明","生日快乐，祝你每天能吃到不一样的果冻。","怎么样的你我都满意。","你忙归忙什么时候有空嫁给我"]},
                {title:'标签',list:["小清新","文艺青年","呆萌","双鱼座","坦率","小心谨慎","豁达"]},
                {title:'ABOUTUS',list:[]},
            ],
            icon:'icon_search.png'

        }
    },
    computed: {},
    methods: {

    }
}
</script>

<style lang="less" scoped>
    .g-footer {
        width:100%;
        height:500px;
        background:#000;
    }

    .g-list {
        display:-ms-flexbox;
        display:-webkit-box;
        display:flex;
        justify-content:space-between;
        padding:100px 0;
        border-bottom:5px solid #222;

        &>li {
            width:20%;

            &>h4{
                font-size: 20px;
                color:#fff;
                font-weight:normal;
                margin-bottom:20px;
            }

            &>.g-list_text>li {
                font-size:15px;
                line-height:30px;
                color:#ABABAB;
                transition:all .6s ease-in-out;

                &:hover {color:#fff;}
            }

            &>.g-list_tag>li {
                display:inline-block;
                padding:10px;
                background:#222;
                margin:0 10px 10px 0;
                color:#ABABAB;
                transition:all .6s ease-in-out;
                cursor:default;
                border-radius:3px;

                &:hover {background:#333;}
            }

            &>.g-search_title { font-size:15px;line-height:30px;color:#ABABAB;margin-bottom:20px;}

            &>.g-search {
                width:100%;
                background:#fff;
                padding:10px 15px;
                border-radius:4px;
                position:relative;

                &>input {
                    width:90%;
                    font-size:15px;
                    color:#666;
                    border:0;
                    outline:none;

                    
                }

                &>a{
                    position:absolute;
                    right:15px;
                }
            }
        }
    }


    ::-ms-input-placeholder, 
    ::-webkit-input-placeholder { color:#ababab; }
</style>