;(function(){
    'use strict';

    function extend() {

        // Variables
        var extended = {};
        var deep = false;
        var i = 0;
        var length = arguments.length;

        // Check if a deep merge
        if ( Object.prototype.toString.call( arguments[0] ) === '[object Boolean]' ) {
            deep = arguments[0];
            i++;
        }

        // Merge the object into the extended object
        var merge = function (obj) {
            for ( var prop in obj ) {
                if ( Object.prototype.hasOwnProperty.call( obj, prop ) ) {
                    // If deep merge and property is an object, merge properties
                    if ( deep && Object.prototype.toString.call(obj[prop]) === '[object Object]' ) {
                        extended[prop] = extend( true, extended[prop], obj[prop] );
                    } else {
                        extended[prop] = obj[prop];
                    }
                }
            }
        };

        // Loop through each object and conduct a merge
        for ( ; i < length; i++ ) {
            var obj = arguments[i];
            merge(obj);
        }

        return extended;

    }


    class Ball {
        constructor() {
            this.color = "#ff0000";
            this.bounce = .5 + (Math.random() * .5);
            this.vx = Math.random() * 50 - 25;
            this.vy = Math.random() * 50 - 25;
            this.size = 35 - (this.bounce * 25);
            this.x = Math.random() * width;
            this.y = Math.random() * height;
        }

        toString() {
            return '(' + this.x + ', ' + this.y + ')';
        }
    }


    class BounceBall {
        constructor(dom,options) {
            options=options||{};
            var defaults={
                loopClassName:'loop-active',
                loopNumber:5,
                speed:1000
            };
            this.settings = extend( {}, defaults, options );
            if(typeof dom=='string'){
                this.element=document.querySelector(dom);
            }else{
                this.element=dom;
            }
            this.init();
        }

        init() {
            var canvas=this.element
            var ctx=canvas.getContext('2d');

            ctx.lineJoin='round';
            ctx.lineWidth=2;
            ctx.font='24px Arial,Microsoft YaHei,sans-serif';
            ctx.fillText('24px 缩放 Microsoft',15,40);
            ctx.strokeRect(20,60,50,50);
            ctx.fillRect(5,5,10,10);

            ctx.beginPath();
            ctx.arc(100, 300, 20, 0, 2 * Math.PI);
            ctx.lineWidth = 1;
            ctx.strokeStyle = '#003300';
            ctx.stroke();
        }


    }



    window.hbBounceBall=function(dom,options){
        return new BounceBall(dom,options);
    };

}());