(function(window,document){
    "use strict";


    var css = `*{
        margin: 0;
        padding: 0;
    }
    .icon-ieupdate{
        display: inline-block;
        *zoom:1;
        float: left;
        cursor: pointer;
    }
    .ieupdate-icon-wrapper{
        display: inline-block;
        *zoom:1;
        height: 90px;
        line-height: 1;
        cursor: pointer;
    }
    .icon-ieupdate_360_8 {
        background-image: url(http://7xopel.com2.z0.glb.qiniucdn.com/serarch/ieupdate_s.png);
        background-position: 0px 0px;
        width: 89px;
        height: 88px;
    }
    .icon-ieupdate_360se_8 {
        background-image: url(http://7xopel.com2.z0.glb.qiniucdn.com/serarch/ieupdate_s.png);
        background-position: -178px -82px;
        width: 77px;
        height: 81px;
    }
    .icon-ieupdate_chrome_8 {
        background-image: url(http://7xopel.com2.z0.glb.qiniucdn.com/serarch/ieupdate_s.png);
        background-position: -178px 0px;
        width: 82px;
        height: 82px;
    }
    .icon-ieupdate_firefox_8 {
        background-image: url(http://7xopel.com2.z0.glb.qiniucdn.com/serarch/ieupdate_s.png);
        background-position: 0px -88px;
        width: 86px;
        height: 85px;
    }
    .icon-ieupdate_ie_8 {
        background-image: url(http://7xopel.com2.z0.glb.qiniucdn.com/serarch/ieupdate_s.png);
        background-position: -86px -88px;
        width: 87px;
        height: 80px;
    }
    .icon-ieupdate_sougou_8 {
        background-image: url(http://7xopel.com2.z0.glb.qiniucdn.com/serarch/ieupdate_s.png);
        background-position: -89px 0px;
        width: 89px;
        height: 86px;
    }

    .ieupdate-img{
        border: none;
    }
    .ieupdate-page-wraper{
        width: 960px;
        margin: 0 auto;
        color: #333;
        line-height: 1.5;
    }
    .ieupdate-h1{
        font-size: 18px;
        margin-top: 30px;
    }
    .ieupdate-h2{
        font-size: 14px;
        margin-top: 20px;
        font-weight: normal;
    }
    .ieupdate-ul{
        margin-top: 30px;
        list-style: none;
        zoom:1;
    }
    .ieupdate-li{
        float: left;
        margin-right: 30px;
        text-align: center;
    }
    .ieupdate-li a{
        color: #333333;
        text-decoration: none;
        display: block;
    }
    .ieupdate-li a:hover{
        color: #333333;
        text-decoration: underline;
    }
    .ieupdate-h6{
        font-weight: normal;
        font-size: 12px;
        margin-top: 4px;
    }`;
        var head = document.head || document.getElementsByTagName('head')[0];
        var style = document.createElement('style');

    var htmlStr=`


<div class="ieupdate-page-wraper">
    <div id="ie">
        <h1 class="ieupdate-h1">抱歉，您使用的ie浏览器版本太低</h1>
        <h2 class="ieupdate-h2">低版本ie浏览存在安全漏洞，并且微软官方已经停止对其支持维护，请对浏览器升级或者改用其他浏览器。</h2>
    </div>
    <div id="iec" style="display:none;">
        <h1 class="ieupdate-h1">看起来您的IE浏览器设置了兼容模式</h1>
        <h2 class="ieupdate-h2">您可以点击工具-兼容性视图设置中，取消勾选'在兼容性视图中显示所有网站',或者在以下列表中下载一款现代浏览器</h2>
    </div>
    <ul class="ieupdate-ul">
        <li  class="ieupdate-li">
            <a href="http://rj.baidu.com/soft/detail/14744.html" target="_blank">
                <span class="ieupdate-icon-wrapper"><span class="icon-ieupdate icon-ieupdate_chrome_8"></span></span>
                <h6 class="ieupdate-h6">谷歌浏览器</h6>
            </a>
        </li>
        <li class="ieupdate-li">
            <a href="http://chrome.360.cn" target="_blank">
                <span class="ieupdate-icon-wrapper"><i class="icon-ieupdate icon-ieupdate_360_8"></i></span>
                <h6 class="ieupdate-h6">360极速浏览器</h6>
            </a>
        </li>
        <li class="ieupdate-li" id="xp">
            <a href="http://windows.microsoft.com/zh-cn/internet-explorer/download-ie" target="_blank">
                <span class="ieupdate-icon-wrapper"><i class="icon-ieupdate icon-ieupdate_ie_8"></i></span>
                <h6 class="ieupdate-h6">最新ie浏览器</h6>
            </a>
        </li>
        <li class="ieupdate-li">
            <a href="http://se.360.cn/" target="_blank">
                <span class="ieupdate-icon-wrapper"><i class="icon-ieupdate icon-ieupdate_360se_8"></i></span>
                <h6 class="ieupdate-h6">360安全浏览器</h6>
            </a>
        </li>
        <li class="ieupdate-li">
            <a href="http://ie.sogou.com/" target="_blank">
                <span class="ieupdate-icon-wrapper"><i class="icon-ieupdate icon-ieupdate_sougou_8"></i></span>
                <h6 class="ieupdate-h6">搜狗浏览器</h6>
            </a>
        </li>
    </ul>
</div>


    `;

    function renderDom(){

        style.type = 'text/css';
        if (style.styleSheet){
            style.styleSheet.cssText = css;
        } else {
            style.appendChild(document.createTextNode(css));
        }

        head.appendChild(style);

        //document.getElementsByTagName("html")[0].appendChild(document.createElement('body'));
        //document.createElement('body');
        if(document.getElementsByTagName("body")[0]){
            document.getElementsByTagName("body")[0].innerHTML = htmlStr;
            showIeGuide()
        }else{
            document.getElementsByTagName("html")[0].appendChild(document.createElement('body'));
            setTimeout(function() {
                document.getElementsByTagName("body")[0].innerHTML = htmlStr;
                showIeGuide()
            },0);
        }
        function showIeGuide(){
            function IECompatibility() {
                var agentStr = navigator.userAgent;
                this.IsIE = false;
                this.IsOn = undefined;  //defined only if IE
                this.Version = undefined;
                if (agentStr.indexOf("MSIE 7.0") > -1) {
                    this.IsIE = true;
                    this.IsOn = true;
                    if (agentStr.indexOf("Trident/6.0") > -1) {
                        this.Version = 'IE10';
                    } else if (agentStr.indexOf("Trident/5.0") > -1) {
                        this.Version = 'IE9';
                    } else if (agentStr.indexOf("Trident/4.0") > -1) {
                        this.Version = 'IE8';
                    } else {
                        this.IsOn = false; // compatability mimics 7, thus not on
                        this.Version = 'IE7';
                    }
                } //IE 7
            }
            var iev = new IECompatibility();
            //  alert(iev.Version);
            var ie=document.getElementById("ie");
            var iec=document.getElementById("iec");
            if(iev.Version){
                if(iev.Version!='ie7'||iev.Version!='ie8'){
                    ie.style.display="none";
                    iec.style.display="block";
                }
            }


            function hideIeWhenXp() {
                var xp=document.getElementById("xp");
                xp.style.display="none";
            }
            function detectOS() {
                var sUserAgent = navigator.userAgent;
                //alert(sUserAgent);

                var isWin = (navigator.platform == "Win32") || (navigator.platform == "Windows");
                if (isWin) {
                    var isWin2K = sUserAgent.indexOf("Windows NT 5.0") > -1 || sUserAgent.indexOf("Windows 2000") > -1;
                    if (isWin2K) {
                        hideIeWhenXp();
                    }
                    var isWinXP = sUserAgent.indexOf("Windows NT 5.1") > -1 || sUserAgent.indexOf("Windows XP") > -1;
                    if (isWinXP) {
                        hideIeWhenXp();
                    }
                    var isWin2003 = sUserAgent.indexOf("Windows NT 5.2") > -1 || sUserAgent.indexOf("Windows 2003") > -1;
                    if (isWin2003) {
                        hideIeWhenXp();
                    }
                }
                return "other";
            }
            detectOS();
        }


    }




    document.execCommand("Stop");
    var bgImg = new Image();
    bgImg.src = 'http://7xopel.com2.z0.glb.qiniucdn.com/serarch/ieupdate_s.png';
    var isOloadbgImg=false;
    bgImg.onload = function(){
        isOloadbgImg=true;
        renderDom();
        if(window._hmt){
            window._hmt.push(['_trackPageview', '/ieupdate']);
        }
    };

    //while (!isOloadbgImg){
    //    //nothing
    //    alert('11')
    //    setInterval(function(){
    //        alert('dd')
    //    }, 3000);
    //}



}(window,document));