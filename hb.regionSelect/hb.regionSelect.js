;hb.regionSelect=(function(){
    "use strict";
    function init(){
        initSelects();
    }

    function findRegion(data){
        var deferred=$.Deferred();
        //console.log(data);
        sendXhr();
        function sendXhr(){
            $.ajax({
                type:'POST',
                url:'/userinfo/getRegion',
                data:data,
                dataType:'json',
                success: function(res) {
                    if(res.status==1){
                        deferred.resolve(res.data);
                    }else{
                        deferred.reject(res.info);
                    }
                },
                error: function(error) {
                    deferred.reject('网络繁忙请稍候再试');
                }
            })
        }
        return deferred.promise();
    }
    function initSelects(){

        var hash={};
        var instanceArr=[];
        $('[hb-region-select-level3]').each(function(){
            var dataFor=$(this).data('for');
            if(!hash[dataFor]){
                instanceArr.push(dataFor);
                hash[dataFor]=true;
            }
        });
        //console.log(instanceArr)
        instanceArr.forEach(function(n,i){
            var dataFor=n;

            if(!$(`[hb-region-select-level3][data-for=${dataFor}]`).val()){
                $(`[hb-region-select-level3][data-for=${dataFor}]`).addClass('placeholder')
            }
            $(`[hb-region-select-level3="2"][data-for=${dataFor}],[hb-region-select-level3="3"][data-for=${dataFor}]`).prop( "disabled", true );

            $(`[hb-region-select-level3][data-for=${dataFor}]`).on('change',function(){
                if(!$(this).val()){
                    $(this).addClass('placeholder');
                }else{
                    $(this).removeClass('placeholder');
                }
            });
            $(`[hb-region-select-level3="1"][data-for=${dataFor}]`).on('change',function(){

                if(!$(this).val()){
                    $(`[hb-region-select-level3="2"][data-for=${dataFor}]`).prop( "disabled", true );
                }else{
                    let city=``;
                    if($(`[hb-region-select-level3="2"][data-for=${dataFor}]`).has( "option" )){
                        city=$(`[hb-region-select-level3="2"][data-for=${dataFor}]`).html();
                    }else{
                        city=`<option value="">请选择城市</option>`;
                    }
                    hb.util.loading.show();
                    findRegion({
                        city:$(this).val(),
                    }).then(function(res){
                        hb.util.loading.hide();
                        $.each(res, function(index, val) {
                            city += `<option value="${val.region_id}">${val.region_name}</option>`;
                        });
                        $(`[hb-region-select-level3="2"][data-for=${dataFor}]`).html(city).removeClass('placeholder');
                    });
                    $(`[hb-region-select-level3="2"][data-for=${dataFor}]`).prop( "disabled", false );
                }
            });

            $(`[hb-region-select-level3="2"][data-for=${dataFor}]`).on('change',function(){

                if(!$(this).val()){
                    $(`[hb-region-select-level3="3"][data-for=${dataFor}]`).prop( "disabled", true );
                }else{
                    let region=``;
                    if($(`[hb-region-select-level3="3"][data-for=${dataFor}]`).has( "option" )){
                        region=$(`[hb-region-select-level3="3"][data-for=${dataFor}]`).html();
                    }else{
                        region=`<option value="">请选择区县</option>`;
                    }
                    hb.util.loading.show();
                    findRegion({
                        city:$(this).val(),
                    }).then(function(res){
                        hb.util.loading.hide();
                        $.each(res, function(index, val) {
                            region += `<option value="${val.region_id}">${val.region_name}</option>`;
                        });
                        $(`[hb-region-select-level3="3"][data-for=${dataFor}]`).html(region).removeClass('placeholder');
                    });
                    $(`[hb-region-select-level3="3"][data-for=${dataFor}]`).prop( "disabled", false );
                }
            });




            var province=``;
            if($(`[hb-region-select-level3="1"][data-for=${dataFor}]`).has( "option" )){
                province=$(`[hb-region-select-level3="1"][data-for=${dataFor}]`).html();
            }else{
                province=`<option value="">请选择省份</option>`;
            }
            findRegion().then(function(res){
                $.each(res, function(index, val) {
                    province += `<option value="${val.region_id}">${val.region_name}</option>`;
                });
                $(`[hb-region-select-level3="1"][data-for=${dataFor}]`).html(province).removeClass('placeholder');
            },function(error){
                hb.lib.weui.alert({
                    title:'温馨提示',
                    content:error,
                    btn:'确定',
                })
            });
        });


    }

    return{
        init:init,
        findRegion:findRegion,
    }
}());
