


var selectedItemsLevel1Ids=_.uniq(_.map(selectedItemsLevel2,'pid'));

// console.log(selectedItemsLevel1Ids);

var selectedItemsLevel1=_.flatten(_.map(selectedItemsLevel1Ids, function(item){
    return _.filter(arr, {id:item});
}));
