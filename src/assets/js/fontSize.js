(function(window,document){

    function remAuto (){
        var element = document.documentElement,
        	resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize';
            i = 750,
            d = i / 100;    // 设计图 px / 100 = rem;

            function setFontSize () {
                var width = element.clientWidth;
                width > 640 && (width = 640);
                element.style.fontSize = width * 2 / d  + "px";
            };
            window.addEventListener && 
            (window.addEventListener("DOMContentLoaded",setFontSize),window.addEventListener(resizeEvt,setFontSize));
    }

    remAuto();

})(window,document)

