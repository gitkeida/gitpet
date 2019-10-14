<template>
    <div>
        <div class="g-container">
            <div class="g-title">
                <h3>我们的故事</h3>
            </div>

            <ul class="g-two_list">
                <li>
                    <div class="g-img_case">
                        <div class="g-img"><img :src="'./static/images/'+data[0].img" alt=""></div>
                        <div class="g-info blue"><h3>John Leo</h3></div>
                    </div>

                    <div class="g-text_case">
                        <h3>Handsome Boy</h3>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellat perspiciatis nobis soluta consequatur animi tenetur a eius iusto, illum praesentium alias, autem nihil voluptate, illo recusandae rem optio suscipit quidem...</p>
                    </div>
                </li>
                <li>
                    <div class="g-img_case">
                        <div class="g-img"><img :src="'./static/images/'+data[1].img" alt=""></div>
                        <div class="g-info pink"><h3>Rosee Smith</h3></div>
                    </div>
                    <div class="g-text_case">
                        <h3>Beautiful Girl</h3>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde, doloremque! Modi unde aspernatur culpa nulla, iusto architecto a. Velit id illo ex non quisquam sit quos, odit libero magni totam.</p>
                    </div>
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
            data:[
                {img:'boy.jpg',name:''},
                {img:'girl.jpg',name:''},

            ],
        }
    },
    computed: {},
    methods: {

    }
}
</script>

<style lang="less" scoped>
    .g-two_list {
        padding-top:40px;
        padding-bottom:60px;
        display:-webkit-box;
        display:-ms-flexbox;
        display:flex;

        &>li {
            display:inline-block;
            width:49%;
            text-align:center;

            &>.g-img_case {
                display:inline-block;
                width:400px;
                height:400px;
                position:relative;
                overflow:hidden;

                &:hover {
                    &>.g-img {transform:translateY(-50px) scale(0.5);}
                    &>.g-info {transform:scale(1);opacity:1;}
                }
                
                &>.g-img {
                    transition:all .35s ease-in-out; 
                    transform:scale(1);
                    z-index:20;

                    &::before{
                        content:'';
                        display:inline-block;
                        width:100%;
                        height:100%;
                        border-radius:50%;
                        position:absolute;    
                        box-shadow: inset 0 0 0 16px rgba(255, 255, 255, 0.6), 0 1px 2px rgba(0, 0, 0, 0.3);
                        transition:all .35s ease-in-out;
                    }
                }



                &>.g-info {
                    display:inline-block;
                    width:100%;
                    height:100%;
                    border-radius:50%;
                    transition:all .35s ease-in-out;
                    position:absolute;
                    top:0;
                    left:0;
                    opacity:0;
                    transform:scale(0);
                    z-index: -1;

                    &>h3 {
                        color:#fff;
                        margin-top:300px;
                        font-size:30px;
                    }
                }

                & img {border-radius:50%;width:100%;}
            }

            &>.g-text_case {
                width:540px;
                margin:auto;

                &>h3 {margin:30px 0 20px;font-size:30px;color:#fc3158;}

                &>p {    
                    font-size: 1em;
                    color: #555;
                    letter-spacing: 1px;
                    margin: 1em 0 2em 0;
                    line-height: 2em;
                }

            }
        }
    }

    .blue {background:#73a6dc;}
    .pink {background:pink;}
</style>