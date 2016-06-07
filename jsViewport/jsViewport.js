;(function(){
    "use strict";
//            alert(navigator.userAgent);
//            alert(window.innerWidth);
    //
    function setViewPort(dw){
        var metaTag=document.createElement('meta');
        metaTag.name = "viewport";
        metaTag.content = "width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0";
        document.write(metaTag.outerHTML);
        //
//            alert(window.innerWidth);
        //
        var deviceWidth=window.innerWidth;
        var scale=deviceWidth/dw;


        var viewport = document.querySelector("meta[name=viewport]");
        viewport.setAttribute('content', 'width=device-width, initial-scale='+scale+', maximum-scale='+scale+', user-scalable=0');

        document.documentElement.style.fontSize='1px';

        //
//            alert(window.innerWidth);
//
//            alert(document.documentElement.clientWidth);
    }
    setViewPort(750);
}());