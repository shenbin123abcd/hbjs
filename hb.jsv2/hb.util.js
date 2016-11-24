/*
 *
 * util
 */

var util={};
var Spinner=require("spin.js");
/*
 *
 * 反序列化数据
 * a=1&b=2  =》 {a:1,b:2}
 *
 *
 */
(function(window,document,undefined) {
    "use strict";
    var QueryStringToHash = function QueryStringToHash (query) {
        if(!query){
            return {};
        }
        var query_string = {};
        var vars = query.split("&");
        for (var i=0;i<vars.length;i++) {
            var pair = vars[i].split("=");
            pair[0] = decodeURIComponent(pair[0]);
            pair[1] = decodeURIComponent(pair[1]);
            // If first entry with this name
            if (typeof query_string[pair[0]] === "undefined") {
                query_string[pair[0]] = pair[1];
                // If second entry with this name
            } else if (typeof query_string[pair[0]] === "string") {
                var arr = [ query_string[pair[0]], pair[1] ];
                query_string[pair[0]] = arr;
                // If third or later entry with this name
            } else {
                query_string[pair[0]].push(pair[1]);
            }
        }
        return query_string;
    };

    util.deParam=QueryStringToHash;
})(window, document);


/*
 *
 * 隐藏虚拟键盘
 */
(function(window,document,undefined) {
    "use strict";
    var hideKeyboard = function() {
        document.activeElement.blur();
        $("input").blur();
    };
    util.hideKeyboard=hideKeyboard;
})(window, document);
/*
 *
 * 数字加逗号
 */
(function(window,document,undefined) {
    "use strict";
    /*
     *
     * 数字加逗号

     */
    var formatNumber = function(n) {
        var numberWithCommas,wanN;
        if(!n){
            return 0;
        }
        if(n>9999){
            wanN=n/10000
        }

        numberWithCommas=function(x) {
            var parts = x.toString().split(".");
            parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            parts[1]&&(parts[1]=parts[1].substr(0,1));
            return parts.join(".");
        };

        //if(n>9999){
        //    //console.log(numberWithCommas(wanN),'万');
        //
        //
        //    return numberWithCommas(wanN)+'万';
        //}

        return numberWithCommas(n)

    };
    util.formatNumber=formatNumber;
})(window, document);
/*
 *
 * 数字前补0
 */
(function(window,document,undefined) {
    "use strict";
    /*
     *
     *
     */
    function pad (str, max) {
        str = str.toString();
        return str.length < max ? pad("0" + str, max) : str;
    }
    util.pad=pad;
})(window, document);


(function(window,document,undefined) {
    "use strict";
    /*
     *
     *getRandomInt(0, 9)
     */
    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }
    util.getRandomInt=getRandomInt;
})(window, document);



/*
 hb.util.loading
 require spin.js
 */
(function(window,document,undefined) {
    "use strict";

    var loading=(function(){
        var loadingHtmlStr=`
            <div style="position: fixed;z-index: 9999999;width: 100%;height: 100%;left: 0;top: 0;background: rgba(0,0,0,0.2);"></div>
            `;
        var $loadingHtml=$(loadingHtmlStr);

        var target = $loadingHtml.get()[0];
        var spinner = new Spinner().spin(target);

        //console.log(spinner);

        var show=function(){
            //console.log('er',$loadingHtml,$("body"))
            $("body").append($loadingHtml);
        };
        var hide=function(){
            $loadingHtml.remove();
        };

        return{
            show:show,
            hide:hide
        }
    }());
    util.loading=loading;
})(window, document);

export default util;