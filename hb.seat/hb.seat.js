;(function(){
    "use strict";

    var canvas=document.getElementById('myCanvas');
    var ctx=canvas.getContext('2d');
    ctx.fillStyle='#FF8800';
    ctx.fillRect(0,0,80,100);

    var img = new Image();
    img.onload = function() {
        ctx.drawImage(img, 0, 0,100,100);
    }
    img.src = "seat.png?v="+new Date().getTime();
}());