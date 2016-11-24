/**
 * Created by i7z97pro_iyghuygu on 2016/8/3.
 */

function unique1(arr) {
    var result = [], hash = {};

    for (let i = 0, item; (item = arr[i]) != null; i++) {
        console.log(hash,item,arr[i],(item = arr[i]))
        if (!hash[item]) {
            result.push(item);
            hash[item] = true;
        }
    }
    console.log(hash)
    return result;
}

function unique2(arr) {
    var result = [], hash = {};
    arr.forEach(function (n, i) {
        if(!hash[n]){
            result.push(n);
            hash[n]=true;
        }
    });
    return result;
}
