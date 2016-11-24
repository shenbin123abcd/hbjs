;(function (factory) {
    if (typeof define === 'function' && define.amd) {
        define(factory);
    } else if (typeof exports === 'object') {
        module.exports = factory();
    } else {
        var OldRaf = window.raf;
        var api = window.raf = factory();
        api.noConflict = function () {
            window.raf = OldRaf;
            return api;
        };
    }
}(function () {
    "use strict";
    var vendors = ['ms', 'moz', 'webkit', 'o'];
    for(var x = 0; x < vendors.length && !window.requestAnimationFrame; ++x) {
        window.requestAnimationFrame = window[vendors[x]+'RequestAnimationFrame'];
        window.cancelAnimationFrame = window[vendors[x]+'CancelAnimationFrame']
            || window[vendors[x]+'CancelRequestAnimationFrame'];
    }

    //var raf={
    //    init:null,
    //    start:null,
    //    cancel:null,
    //};


    class RafClass{
        constructor() {
            var pureRaf= window.requestAnimationFrame;
            if(pureRaf){
                let timer={};
                this.cancel=function(t){
                    //console.log(t.timer)
                    window.cancelAnimationFrame(t.timer);
                };

                this.start=function(fun,speed){
                    var now;
                    var then = Date.now();
                    var delta;

                    function go() {
                        timer.timer=pureRaf(go);
                        now = Date.now();
                        delta = now - then;

                        if (delta > speed) {
                            // 这里不能简单then=now，否则还会出现上边简单做法的细微时间差问题。
                            // 例如fps=10，每帧100ms，而现在每16ms（60fps）执行一次draw。16*7=112>100，需要7次才实际绘制一次。
                            // 这个情况下，实际10帧需要112*10=1120ms>1000ms才绘制完成。
                            then = now - (delta % speed);
                            fun()
                        }
                        return timer;
                    }
                    return go();
                }
            }else{
                //raf.cancel=window.clearTimeout;

                let timer={};
                this.cancel=function(t){
                    window.clearTimeout(t.timer);
                };
                this.start=function(fun,speed){
                    function go(){
                        fun();
                        timer.timer= setTimeout(go, speed);
                        return timer
                    }
                    return go();
                }


            }


        }
    }




    return {
        init:function(){
            return new RafClass()
        }
    };
}));


