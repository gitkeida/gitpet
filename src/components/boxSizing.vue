<template>
    <div>

        <h2>标准盒模型和怪异盒模型</h2>
        <br>
        <br>
        <br>
        <br>

        <p>标准盒模型：</p>
        <div class="w3c">
            <input type="text">
        </div>

        <br>
        <br>
        <br>

        <p>怪异盒模型：</p>
        <div class="ie">
            <input type="text">

        </div>
        
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
        <h1>test</h1>
    </div>
</template>

<script>
export default {
    data (){
        return {
            arr: [1,2,3,3,4,4,5,3,1,7,6,1],
            msg:[],
        }
    },
    mounted:function(){
        //if( typeof Array.prototype.delrepet == "function" ) 
            Array.prototype.delrepet = function(){
                let newArr = [],
                    item = '',
                    isRepet = false,
                    i = 0,
                    j = 0;

                for( i; i<this.length; i++ )
                {
                    item = this[i];
                    isRepet = false;

                    for(j=0; j<newArr.length; j++)
                    {
                        if(newArr[j] == item)
                        {
                            isRepet = true;
                            break;
                        }
                    }
                    if(!isRepet)
                    {
                        newArr[newArr.length] = item;
                    }
                }

                return newArr;
            };

        Array.prototype.resss = function(){
            for(let i=0;i<this.length;i++)
            {
                let temp = this[i];
                this[i] = temp + 'my';
            }
            return this;
        }

        Array.prototype.mystr = function(){
            for(let i=0;i<this.length;i++)
            {
                let temp = this[i] + '|';
                this[i] = temp ;
            }
            return this.toString();
        }

        

        this.msg = this.arr.delrepet();
        console.log(this.msg.reverse());
        console.log(this.msg)

        console.log(this.arr.join())
        console.log(this.arr)



    }
}
</script>

<style>
    .w3c input{
        box-sizing:content-box;
    }
    .ie input{
        box-sizing:border-box;
    }
    .w3c,.ie {
        border:1px solid red;
        width: 200px;
        height: 200px;
        padding:10px;
        background:darkgray;
    }

    .w3c>input,.ie>input{
        width:100%;
        padding:5px;        
    }
</style>