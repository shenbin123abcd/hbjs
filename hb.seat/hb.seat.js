;(function(){
    "use strict";

    function seat(dom,options){
        var options=options||{};
        var defaults={
            sections:[{
                columns :13,
                rows:6,
                seatRows:[],
                sectionId:"01",
                sectionName:"默认场区",
            }],
            reachBottom:function(){
                //console.log('f')
            }
        };
        this.settings = $.extend( {}, defaults, options );

        if(typeof dom=='string'){
            this.element=document.querySelector(dom);
        }else{
            this.element=dom;
        }
        this.$element=$(this.element);
        this.init();
        //console.log($el,el);
    }


    seat.prototype.init=function(){

        //var width=this.element.clientWidth;
        //var height=this.element.clientHeight;


        var width=this.settings.sections[0].columns*30+600;
        var height=this.settings.sections[0].rows*30+600;


        var canvas=document.createElement('canvas');

        canvas.setAttribute("width", width);
        canvas.setAttribute("height", height);
        canvas.style.background='#dddddd';
        this.element.appendChild(canvas);


        hb.drag(canvas,{})


        var ctx=canvas.getContext('2d');
        ctx.fillStyle='#FF8800';
        ctx.fillRect(0,0,80,100);
        var img = new Image();
        img.onload = function() {
            ctx.drawImage(img, 0, 0,100,100);
        }
        img.src = "seat.png?v="+new Date().getTime();

    };




    hb.seat=function(dom,options){
        return new seat(dom,options);
    };
}());