;(function(){
    "use strict";
//            alert(navigator.userAgent);
//            alert(window.innerWidth);
    //
    function setViewPort(mw,mh,tw,th){
        var metaTag=document.createElement('meta');
        metaTag.name = "viewport";
        metaTag.content = "width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0";
        document.write(metaTag.outerHTML);
        //
        //    alert(window.innerWidth);
        //

        var deviceWidth=document.documentElement.clientWidth;
        var deviceHeight=document.documentElement.clientHeight;

        var scale=1;
        calScale();

        function calScale(){
            deviceWidth=document.documentElement.clientWidth;
            deviceHeight=document.documentElement.clientHeight;
            if(deviceWidth<deviceHeight){
                if(deviceWidth<500){
                    scale=deviceWidth/mw;
                }else{
                    scale=deviceWidth/tw;
                }
            }else{
                if(deviceWidth<1000){
                    scale=deviceWidth/mh;
                }else{
                    scale=deviceWidth/th;
                }
            }

            scale=Math.floor(scale*1000)/1000;



//            if(navigator.userAgent.match(/(MicroMessenger)/g)&&navigator.userAgent.match(/(iPhone)/g)){
////                        scale=Math.round(scale*1000)/1000;
////                        alert(scale)
//                var re = /(\d+\.\d{3})/;
////                        alert(scale.toString())
//                scale =String(scale).match(re)[0];
////                        alert(scale)
//            }
//                    alert(scale)



        }







        var viewport = document.querySelector("meta[name=viewport]");

        viewport.setAttribute('content', 'width=device-width, initial-scale='+scale+', maximum-scale='+scale+', user-scalable=0');



        window.addEventListener("orientationchange", function(event){
            //alert(event.orientation);

            viewport.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0');
            deviceWidth=document.documentElement.clientWidth;
            calScale();
            viewport.setAttribute('content', 'width=device-width, initial-scale='+scale+', maximum-scale='+scale+', user-scalable=0');

        });

        document.documentElement.style.fontSize='1px';

        //
//            alert(window.innerWidth);
//
//            alert(document.documentElement.clientWidth);
    }
    setViewPort(750,1334,1536,2048);
}());