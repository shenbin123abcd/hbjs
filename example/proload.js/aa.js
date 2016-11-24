function initLoading(){

    var bar = new ProgressBar.Circle(container, {
        color: '#aaa',
        // This has to be the same size as the maximum width to
        // prevent clipping
        strokeWidth: 4,
        trailWidth: 1,
        easing: 'easeInOut',
        duration: 1400,
        text: {
            autoStyleContainer: false
        },
        from: { color: '#aaa', width: 1 },
        to: { color: '#333', width: 4 },
        // Set default step function for all animate calls
        step: function(state, circle) {
            circle.path.setAttribute('stroke', state.color);
            circle.path.setAttribute('stroke-width', state.width);
            var value = Math.round(circle.value() * 100);
            if (value === 0) {
                circle.setText('%');
            } else {
                circle.setText(value+'%');
            }

        }
    });
    bar.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
    bar.text.style.fontSize = '2rem';

    // bar.animate(1.0);  // Number from 0.0 to 1.0
    var fileArray=[
        'images/propscover/light-1.png',
        'images/propscover/light-2.png',
        'images/propscover/lightbox.png',
        'images/propscover/num-bg.png',
        'images/propscover/props-cover-bt-1.png',
        'images/propscover/props-cover-bt-2.png',
        'images/propscover/rest-bg.png',
    ];

    var id=hb.location.url('?id');

    switch(id){
        case '1000':
            fileArray=fileArray.concat(['images/propscover/props-bg-1000.jpg','images/propscover/title-1000.png']);
            break;
        case '1001':
            fileArray=fileArray.concat(['images/propscover/props-bg-1001.jpg','images/propscover/title-1001.png']);
            break;
        case '1002':
            fileArray=fileArray.concat(['images/propscover/props-bg-1002.jpg','images/propscover/title-1002.png']);
            break;
        case '1003':
            fileArray=fileArray.concat(['images/propscover/props-bg-1003.jpg','images/propscover/title-1003.png']);
            break;
        case '1004':
            fileArray=fileArray.concat(['images/propscover/props-bg-1004.jpg','images/propscover/title-1004.png']);
            break;
        case '1005':
            fileArray=fileArray.concat(['images/propscover/props-bg-1005.jpg','images/propscover/title-1005.png']);
            break;

    }
    // console.log(fileArray)


    var queue = new createjs.LoadQueue(false);

    queue.on("fileload", handleFileComplete);
    queue.on("complete", handleComplete);
    queue.on("progress", handleProgress);

    // queue.loadFile('http://7ktsyl.com2.z0.glb.qiniucdn.com/halo/565268082c318.jpg');
    // queue.loadFile('http://7ktsyl.com2.z0.glb.qiniucdn.com/store/201605/19/Fn8hn8Ue3t7CB0Kds8sCItwK10IX.jpg');
    queue.loadManifest(fileArray, false)
    queue.load();

    function handleFileComplete(event) {


        // console.log('handleFileComplete',event)
        // document.body.appendChild(event.result);
    }
    function handleComplete(event) {
        // console.log('handleComplete',event)
        // $('html').addClass('html-props-cover');
        // $('[cover-content]').show();
        // document.body.appendChild(event.result);
    }

    function handleProgress(event) {
        // console.log('General progress', Math.round(event.loaded) * 100, event);
        console.log('General progress', event.progress);
        bar.set(event.progress)
        // console.log(event)
        // document.body.appendChild(event.result);
    }
}
/**
 * Created by Administrator on 2016/7/18.
 */
