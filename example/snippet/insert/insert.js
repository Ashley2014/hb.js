function insert(arr,index,newArr) {

    var args = [index+1, 0].concat(newArr);
    Array.prototype.splice.apply(arr, args);

}

