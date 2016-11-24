;(function(){
    "use strict";

    function drag(dom,options){
        var options=options||{};
        var defaults={
            bottom:100,
            reachBottom:function(){
                //console.log('f')
            }
        };
        var settings = defaults;

        if(typeof dom=='string'){
            this.element=document.querySelector(dom);
        }else{
            this.element=dom;
        }

        this.init();
        //console.log($el,el);
    }


    drag.prototype.init=function(){
        this.hammertime = new Hammer(this.element, {});
        this.hammertime.get('pinch').set({ enable: true });
        var element=this.element;

        this.hammertime.on('pan', function(ev) {

            element.style['-webkit-transform']=`translate3d(${ev.deltaX}px,${ev.deltaY}px,0)`;


            //console.log(lNow,tNow);



        });

        this.hammertime.on('pinch', function(ev) {
            //console.log('pinch',ev);
        });



    };





    window.hbDragv2=function(dom,options){
        return new drag(dom,options);
    };
}());