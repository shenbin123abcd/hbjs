;(function(){
    (window.requestAnimationFrame)||(window.requestAnimationFrame = window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame);


    var PI=Math.PI;
    var DEG=57.2957795;
    var RAD=0.0174532925;
    var PIE=2*PI;

    function rand(max,min){
        return (Math.max(min||0,Math.random()*max))
    }
    function rrand(max,min){
        return Math.round(rand.apply(undefined, arguments))
    }

    function rad(deg){
        return deg * RAD
    }

    function deg(rad){
        return rad * DEG
    }

    function normalRandom(a,b,c,d,e){
        do {
            d=2*Math.random()-1;
            e=2*Math.random()-1;
            c=d*d+e*e;
        }
        while(c>1);
        return(b||1)*d*Math.sqrt(-2*log(c)/c)+(a||0)
    }
    function fromPolar(r, t){
        return [r * Math.cos(t),r * Math.sin(t)];
    }
    function normalize(min_r,max_r,min_s,max_s,value) {
        return min_s + (value-min_r)*((max_s-min_s)/(max_r-min_r))
    }

    function drawStar(size,ctx){
        ctx.beginPath();
        ctx.moveTo(size,0);
        for (var i=0;i<9;i++){
            rotate(PI/5);
            ctx.lineTo((i%2 === 0)?(size/0.525731)*0.200811:size,0)};
        ctx.closePath();
        ctx.fill();
    }
    function drawTriangle(w, h, ctx){
        ctx.save();
        translate(-w/2,-(h*2)/3);
        ctx.beginPath();
        ctx.moveTo(w/2, 0);
        ctx.lineTo(w, h);
        ctx.lineTo(0, h);
        ctx.closePath();
        ctx.fill();
        ctx.restore();
    }
    function drawCircle(x,y,r, ctx){
        ctx.beginPath();
        ctx.arc(x, y, r, 0 , PI*2, false);
        ctx.closePath();
        ctx.fill();
    }
    function squares(canvas){
        var ctx=canvas.getContext('2d'),w=canvas.width,h=canvas.height;
        [[0, h-10],[0, 0],[w-10, 0],[w-10, h-10],[w/2, h/2]].forEach(function(p){
            ctx.fillRect.apply(ctx,p.concat([10,10]))
        });
    }


    var Vector = {
        create:function(a, b) {return new Float32Array([a, b]);},
        add:function(a, b, out) {return [a[0] + b[0], a[1] + b[1]]},
        subtract:function(a, b, out) {return [a[0] - b[0], a[1] - b[1]]},
        scale:function(a, v, out) {return [a[0] * v,a[1] * v]},
        normalize:function(a, out) {return Vector2d.scale(a,1 / Vector2d.getLength(a));},
        getLength:function(a, out) {return Math.sqrt((a[0] * a[0]) + (a[1] * a[1]));},
        distance:function(a,b){return Math.sqrt((b[0]-a[0])^2 + (b[1]-a[1])^2)}
    }


    function Ball(){
        this.color = "#ff0000";
        this.bounce = .5 + (Math.random() * .5);
        this.vx = Math.random() * 50 - 25;
        this.vy = Math.random() * 50 - 25;
        this.size = 35 - (this.bounce * 25);
        this.x = Math.random() * width;
        this.y = Math.random() * height;
    }
    function generate(){
        for(var i = 0; i < total; i++){
            balls[balls.length] = new Ball();
        }
    }
    function update(ball){
        collisionCheck();

        var gravity = 2;
        var drag = .98;

        ball.x += ball.vx;
        ball.y += ball.vy;

        if ((ball.x + ball.size) > width)
        {
            ball.x = width - ball.size;
            ball.vx = -ball.vx * ball.bounce;
        }
        else if((ball.x - ball.size) < 0)
        {
            ball.x = 0 + ball.size;
            ball.vx = -ball.vx * ball.bounce;
        }

        if ((ball.y + ball.size) > height)
        {
            ball.y = height - ball.size;
            ball.vy = -ball.vy * ball.bounce;
        }
        else if((ball.y - ball.size) < 0)
        {
            ball.y = 0 + ball.size;
            ball.vy = -ball.vy * ball.bounce;
        }
        var rot=(orientation===-90||orientation===180)?90+tiltLR:90-tiltLR
        ball.vx = ball.vx * drag + Math.cos(rot*RAD);
        ball.vy = ball.vy * drag + gravity + tiltY;
    }
    function collisionCheck(){
        var spring = .5;

        for(var i = 0; i < (total-1); ++i)
        {
            var ball0 = balls[i];

            for(var j = i + 1; j < total; ++j)
            {
                var ball1 = balls[j];
                var dx = ball1.x - ball0.x;
                var dy = ball1.y - ball0.y;
                var dist = Math.sqrt(dx * dx + dy * dy);
                var minDist = ball0.size + ball1.size;

                if(dist < minDist)
                {
                    var angle = Math.atan2(dy, dx);
                    var tx = ball0.x + dx / dist * minDist;
                    var ty = ball0.y + dy / dist * minDist;
                    var ax = (tx - ball1.x);
                    var ay = (ty - ball1.y);


                    ball0.x -= ax;
                    ball0.y -= ay;

                    ball1.x += ax;
                    ball1.y += ay;


                    ball0.vx -= (ax * spring);
                    ball0.vy -= (ay * spring);
                    ball1.vx += (ax * spring);
                    ball1.vy += (ay * spring);
                }
            }
        }
    }
    function render(){
        var isChange = (browserX != window.screenX || browserY != window.screenY);
        if(isChange)
        {
            var diffX = browserX - window.screenX;
            browserX = window.screenX;

            var diffY = browserY - window.screenY;
            browserY = window.screenY;
        }

        var j = balls.length;
        while(--j > -1)
        {
            update(balls[j]);

            if(isChange)
            {
                balls[j].vx += (diffX * .05);
                balls[j].vy += (diffY * .1);
            }
        }
        draw();
    }

    function drawRadiantLine(angle,ctx){
        var r=50,rot=(orientation===-90||orientation===180)?90+angle:90-angle;
        rotationSpan.innerHTML=rot;
        ctx.save();
        ctx.lineWidth=3;
        ctx.beginPath();
        ctx.moveTo(width/2,height/2);
        ctx.lineTo((width/2)+(r*Math.cos((rot)*RAD)),(height/2)+(r*Math.sin((rot)*RAD)));
        //console.log(200+Math.cos(270+tiltLR),200+Math.sin(270+tiltLR));
        ctx.closePath();
        ctx.stroke();
        ctx.restore();

    }
    function drawPlumbLine(ctx){
        drawRadiantLine(tiltLR, ctx);

    }

    function draw(){
        context.clearRect(0, 0, width, height);
        var i = balls.length;
        while(--i > -1)
        {
            context.fillStyle = balls[i].color;
            context.beginPath();
            context.arc(balls[i].x,balls[i].y,balls[i].size,0,Math.PI*2,true);
            context.closePath();
            context.fill();
        }
    }

    var canvas=document.getElementById('canvas');
    var stage=document.createElement('canvas');

    var ctx=canvas.getContext('2d');
    var sctx=stage.getContext('2d');
    var width=document.body.offsetWidth;
    var height=document.body.offsetHeight;
    canvas.width=width;
    canvas.height=height;
    stage.width=width;
    stage.height=height;
    var startTime=null;

    var browserX = window.screenX;
    var browserY = window.screenY;
    var balls = [];
    var total = 25;
    var tiltX = 0;
    var tiltY = 0;
    var tiltLR = 0;
    var tiltXSpan=document.getElementById('tiltX');
    var tiltYSpan=document.getElementById('tiltY');
    var tiltLRSpan=document.getElementById('tiltGamma');
    var tiltFBSpan=document.getElementById('tiltBeta');
    var tiltDir=document.getElementById('tiltAlpha');
    var orientationSpan=document.getElementById('orientation');
    var rotationSpan=document.getElementById('rotation');
    generate();

    var m=10;
    var M=90;
    var G=9.8;
    var g=0;
    var y=0;
    var Y=height;
    var a=0;

    function draw(t){
        startTime=startTime||t;
        sctx.save();
        sctx.clearRect (0,0,stage.width, stage.height);
        /*sctx.save();
         sctx.strokeStyle="red";
         drawRadiantLine(180,sctx);
         sctx.strokeStyle="green";
         drawRadiantLine(270,sctx);
         sctx.strokeStyle="green";
         drawRadiantLine(90,sctx);
         sctx.strokeStyle="red";
         drawRadiantLine(360,sctx);
         sctx.restore();
         drawPlumbLine(sctx);*/
        sctx.save();
        var i = balls.length;
        while(--i > -1)
        {
            sctx.fillStyle = balls[i].color;
            sctx.beginPath();
            sctx.arc(balls[i].x,balls[i].y,balls[i].size,0,Math.PI*2,true);
            sctx.closePath();
            sctx.fill();
        }
        sctx.restore();
        ctx.save()
        ctx.clearRect (0,0,canvas.width, canvas.height);
        ctx.drawImage(stage, 0, 0, canvas.width, canvas.height);
        ctx.restore();
        //console.log(star.position);
        window.requestAnimationFrame(render)
    }

    window.requestAnimationFrame(render)

//'ondevicemotion'
    window.addEventListener('deviceorientation', function () {
        if(Math.abs(orientation)===90){
            tiltLR=event.beta;
        }else{
            tiltLR=event.gamma;
        }
        tiltLRSpan.innerText=tiltLR;
        tiltFBSpan.innerText=event.beta;
        tiltDir.innerText=event.alpha;
        orientationSpan.innerText=window.orientation;
    }, true);

    window.addEventListener('devicemotion', function () {
        tiltX=event.acceleration.x;
        tiltY=event.acceleration.y;
        tiltXSpan.innerText=tiltX;
        tiltYSpan.innerText=tiltY;
    }, true);

}());

