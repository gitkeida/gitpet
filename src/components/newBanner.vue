<template>
  <div class="g-container_min">
     <div class="g-banner_wrap"
        @touchstart.stop="!PC && items > 1 &&  start($event)"
        @touchmove.stop="!PC && items > 1 && move($event)"
        @touchend.stop="!PC && items > 1 && end($event)"

        @dragstart.stop="PC && items > 1 && start($event)"
        @mousemove.stop="PC && items > 1 && move($event)"
        @mouseup="PC && items > 1 && end($event)"
     >
         <ul class="g-banner_list" 
            :style="{left:leftMsg + 'px',transition:duration}"
            ref = "bannerList"
            >   
                
                <slot :idx="loop ? activeIndex : realIndex" :realIndex="realIndex"></slot>
                
         </ul>

         <ul v-if="items >1 && pagination" class="g-banner_pagination" >
             <li v-for="(i,idx) in items" :key="i" :class="{active: realIndex == idx}" ></li>
         </ul>

        <!-- 上一个 下一个按钮 -->
         <div v-if="prevNext">
             <span class="g-btn_prev" @click="goPrev"></span>
             <span class="g-btn_next" @click="goNext"></span>
         </div>
     </div>
  </div>
</template>

<script>
export default {
  name: 'banner',
  data () {
    return {
      msg: 'this is banner component',
      o_start:0,         // start
      o_move:0,          // move
      o_end:0,              // end
      o_space:0,         // space
      

      leftMsg:0,            // left

      wrapWidth:null,         // wrap width

      d_time:"all .4s",     // duration time

      duration:"",   // duration value

      realIndex: 0,          // realIndex       // ！loop idx
      activeIndex:0,         // activeIndex     // loop idx
      
      timer:null,           // timer
      
      PC:false,
      mousedown: false,     // pc mouse down

      loopItems: this.items,      // 

      onwindow:null,

    }
  },
  props: {
      items:{
          default:1
      },
      loop:Boolean,
      autoPlay:Number,
      pagination:Boolean,
      onIndexChange:Function,
      prevNext:Boolean,
  },
  methods:{

      default(){

          this.copySlide();

            console.log("defalut:")
          
            console.log(this.loopItems)
          
          this.setLeft(-this.wrapWidth * (this.loop ? this.activeIndex : this.realIndex) ,false);
          
          this.items > 1 && this.autoPlay!= null && this.startBanner();

      },
      copySlide(){
          if(this.loop && this.items > 1){
            
            let bannerList = this.$refs.bannerList,
                first = bannerList.firstChild.cloneNode(true),
                last = bannerList.lastChild.cloneNode(true);

            bannerList.insertBefore(last,bannerList.firstChild);
            
            bannerList.appendChild(first);

            this.activeIndex = 1;
            
            this.loopItems += 2;

          }
      },

      start(e){

          e.preventDefault();

          this.stopBanner();
        
          this.loopActiveIndexChange();

          this.o_start = this.PC ? e.pageX : e.targetTouches[0].pageX;

          this.o_space = this.leftMsg;

          this.mousedown = true;

      },

      move(e){

          if(!this.mousedown) return;
          
          this.o_move = this.PC ? e.pageX : e.targetTouches[0].pageX ;
          
          this.o_end = parseInt( this.o_move - this.o_start );

          this.setLeft(this.o_space + this.o_end);

      },
      
      end(e){
        //   console.log("end")
          
          this.mousedown = false;
          
          if(this.o_end == 0) return;

          if( Math.abs(this.o_end) > this.wrapWidth / 4 ){
              // 可以移动
            //   console.log("可以移动")
              
              this.o_end < 0 ? this.realIndex++ : this.realIndex--;
              this.o_end < 0 ? this.activeIndex++ : this.activeIndex--;

              this.indexChange();

              this.slideChange();

              this.setLeft( -this.wrapWidth * (this.loop ? this.activeIndex : this.realIndex), true );


          } else {
              // 不能移动
            //   console.log("不可以移动")

              let space = this.o_end == 0 ? -this.wrapWidth * (this.loop ? this.activeIndex : this.realIndex) : this.o_space;
              
              this.setLeft(space,true);
          }

          this.o_end = 0;

          this.closeDuration();

          this.startBanner();

      },

      banner(type = true){

          // type ? next : prev   
          
          type ? this.realIndex++ : this.realIndex--;          
          type ? this.activeIndex++ : this.activeIndex--;


          this.realIndex == this.items && (this.realIndex = 0);
          this.realIndex < 0 && (this.realIndex = this.items - 1);
          

          if(this.loop){
              
             if(this.activeIndex < 0 ){
                 
                 this.activeIndex = this.loopItems - 2;
                 
                 this.setLeft(-this.wrapWidth * this.activeIndex);
                    
                setTimeout(()=>{
    
                    this.activeIndex--;
                        
                    this.slideChange();
                        
                    this.setLeft(-this.wrapWidth * this.activeIndex, true);
                        
                    this.closeDuration();

                },50);

                return;

             }
             

             if(this.activeIndex == this.loopItems){
                    
                    this.activeIndex = 1;
                    
                    this.setLeft(-this.wrapWidth * this.activeIndex);
                    
                    setTimeout(()=>{
                        this.activeIndex++;
                        
                        this.slideChange();
                        
                        this.setLeft(-this.wrapWidth * this.activeIndex, true);
                        
                        this.closeDuration();

                    },50);
                

                    return;
             }

          } else {

              this.activeIndex == this.items && (this.activeIndex = 0);
              this.activeIndex < 0 && (this.activeIndex = this.items - 1);

          }

          
          this.slideChange();

          this.setLeft(-this.wrapWidth * (this.loop ? this.activeIndex : this.realIndex), true);
          
          this.closeDuration();


      },

      startBanner(){
          
          if(this.autoPlay != null && this.timer == null){

              this.timer = setInterval(this.banner.bind(this),this.autoPlay);
          
          }

      },

      stopBanner(){

          if(this.timer !== null){
              
            //   console.log("清除定时器")
              clearInterval(this.timer);
              
              this.timer = null;

          }
          
      },

      // 监听slide
      slideChange(){
        //   console.log("slideChange");
          this.onIndexChange && this.onIndexChange();
      },

      indexChange(){
            
            this.realIndex == this.items && 
                    (this.realIndex = this.loop ? 0 : this.items - 1);
            
            this.realIndex < 0 && 
                    (this.realIndex = this.loop ? this.items - 1 : 0);



            // activeIndex 只在 !loop 下改变   (在loop下activeIndex 会在 start 中计算)
            // 因为 在 loop 下 active 不会等于 loopItems && !< 0

            // !loop
            this.activeIndex < 0 && (this.activeIndex = 0);

            // !loop
            this.activeIndex == this.loopItems && (this.activeIndex = this.loopItems - 1);


            console.log("realIndex: "+this.realIndex);
            console.log("activeIndex: "+this.activeIndex);

      },

      // loop循环模式
      loopActiveIndexChange(){


            if (this.activeIndex == this.loopItems - 1){
                // 最后一张

                this.activeIndex = 1;

                this.setLeft(-this.wrapWidth * this.activeIndex);

            } else if (this.activeIndex == 0){
                // 第一张

                this.activeIndex = this.loopItems - 2;

                this.setLeft(-this.wrapWidth * this.activeIndex);

            }


      },

      goPrev:function(){
          if(this.duration == '')
          {
              this.stopBanner();
              this.banner(false);
              this.startBanner();

          }

      },

      goNext:function(){
          if(this.duration == '')
          {
            this.stopBanner();
            this.banner();
            this.startBanner();
          }

      },

      setLeft(left,isTime = false){

          this.duration = isTime ?  this.d_time : '';

          this.leftMsg = left

      },

      // 关闭过度
      closeDuration(){
          setTimeout(()=>{
              this.duration = '';
          },300);
      },
      
      resize(){
          
          let resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
              This = this;
          
          this.onresize();

          this.onwindow = function(){
              This.onresize();
          };

          window.addEventListener(resizeEvt,this.onwindow);

      },

      onresize(){
            // this.$refs.bannerList.clientWidth ||

            // console.log(this.$refs.bannerList.firstChild)
            this.$refs.bannerList &&
            (this.wrapWidth =  this.$refs.bannerList.clientWidth);
                
            this.PC = this.ISPC();

            
      },
      ISPC(){
          var userAgentInfo = navigator.userAgent;
            var Agents = ["Android", "iPhone",
                "SymbianOS", "Windows Phone",
                "iPad", "iPod"];
            var flag = true;
            for (var v = 0; v < Agents.length; v++) {
                if (userAgentInfo.indexOf(Agents[v]) > 0) {
                    flag = false;
                    break;
                }
                
            }
            return flag;
      },


  },
  mounted:function(){

      this.resize();
      this.default();
  },
  beforeDestroy:function(){
      
      var resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize';
      window.removeEventListener(resizeEvt,this.onwindow);

      this.stopBanner();

  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="less" scoped>
    .g-banner_wrap{
        width:100%;
        // height:1.2rem;
        position:relative;
        overflow:hidden;

        & >.g-banner_list{
            position:relative;
            height:100%;
            display:flex;
            left:0px;
            padding:0;
            margin:0;
            

            & >li{
                // width:100%;
                min-width:100%;
                height:100%;
                cursor:pointer;


                & img{
                    width:100%;
                    height:100%;
                    cursor:pointer;
                }
            }
        }

        & >.g-banner_pagination{
            width:100%;
            height:8px;
            display:flex;
            justify-content:center;
            align-items:center;
            position:absolute;
            bottom:5%;

            & >li{
                width:8px;
                height:8px;
                background:#fff;
                border-radius:50%;
                margin:0 5px;

                &.active{
                   background:pink ;
                }
            }


        }

        & .g-btn_prev,& .g-btn_next {
            position:absolute;
            width:45px;
            height:45px;
            top:0;
            bottom:0;
            margin:auto;
            font-size:40px;
            background:rgba(0,0,0,0.3);
            color:#ccc;
            text-align:center;
            line-height:45px;
            cursor:pointer;
            transition:all 1s;

            &:hover{
                background:rgba(0,0,0,0.9);
                color:#fff;
            }

            &.g-btn_prev{
                left:0;

                &::after {
                    content:'\<';
                    display:inline-block;
                }
            }

            &.g-btn_next{
                right:0;

                &::after {
                    content:'\>';
                    display:inline-block;
                }
            }
        }
    }

</style>
