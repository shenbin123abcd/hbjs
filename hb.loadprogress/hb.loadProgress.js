/**
 * Created by Administrator on 2016/7/18.
 */
function initLoading(){


    // queue.loadFile('http://7ktsyl.com2.z0.glb.qiniucdn.com/halo/565268082c318.jpg');
    // queue.loadFile('http://7ktsyl.com2.z0.glb.qiniucdn.com/store/201605/19/Fn8hn8Ue3t7CB0Kds8sCItwK10IX.jpg');

    var url='http://7ktsyl.com2.z0.glb.qiniucdn.com/halo/565268082c318.jpg' ;
    var img=new Image(url);
    var thisImg = img;
    var xmlHTTP = new XMLHttpRequest();
    xmlHTTP.open('GET', url,true);
    xmlHTTP.responseType = 'arraybuffer';
    xmlHTTP.onload = function(e) {
        var blob = new Blob([this.response]);
        thisImg.src = window.URL.createObjectURL(blob);
    };
    xmlHTTP.onprogress = function(e) {
        thisImg.completedPercentage = parseInt((e.loaded / e.total) * 100);

        console.log(thisImg.completedPercentage)
    };
    xmlHTTP.onloadstart = function() {
        thisImg.completedPercentage = 0;
    };
    xmlHTTP.send();

}