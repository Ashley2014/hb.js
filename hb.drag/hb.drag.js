;(function(){
    "use strict";

    function drag(dom,options){
        var options=options||{};
        var defaults={
            bottom:100,
            reachBottom:function(){
                //console.log('f')
            }
        };
        var settings = $.extend( {}, defaults, options );

        if(typeof dom=='string'){
            this.element=document.querySelector(dom);
        }else{
            this.element=dom;
        }
        this.$element=$(this.element);
        this.init();
        //console.log($el,el);
    }


    drag.prototype.init=function(){
        this.hammertime = new Hammer(this.element, {});
        this.hammertime.get('pinch').set({ enable: true });



        var $obj = this.$element;
        var $objParent = this.$element.parent();

        var objParentWidth = $objParent.innerWidth();
        var objParentHeight = $objParent.innerHeight();

        var objParentLeft = $objParent.position().left;
        var objParentTop = $objParent.position().top;

        var objWidth = $obj.outerWidth();
        var objHeight = $obj.outerHeight();
        var objLeft ;
        var objTop ;

        var mx ;
        var my ;
        var lI;
        var tI ;
        var l;
        var t;

        var xNow,yNow;
        var down ;
        var xFirst;
        var yFirst ;
        var objLeftFirst ;
        var objTopFirst ;

        this.hammertime.on('pan', function(ev) {
            //console.log('pan',ev);
            xFirst = ev.pageX;
            yFirst = ev.pageY;
            //console.log(ev.deltaX,ev.deltaY,ev.velocityX,ev.velocityY,ev.pointers);
            objLeftFirst = $obj.position().left;
            objTopFirst = $obj.position().top;

            //event.preventDefault();
            //event.stopPropagation();


//                    objLeft = $obj.position().left;
//                    objTop = $obj.position().top;
                xNow = ev.pageX;
                yNow = ev.pageY;

                l = xNow-xFirst;
                t = yNow-yFirst;

//                    console.log(l);
//                    console.log(t);

                var lNow=l+objLeftFirst;
                var tNow=t+objTopFirst;
//                    console.log(lNow);
//                    console.log(tNow);

                if( lNow>0){
                    lNow=0;
                }

                if( tNow>0){
                    tNow=0;
                }

                if( lNow<(objParentWidth-objWidth) ){
                    lNow=objParentWidth-objWidth;
                }

                if( tNow<(objParentHeight-objHeight) ){
                    tNow=objParentHeight-objHeight;
                }


            $obj.css({

                transform: `translate3d(${ev.deltaX}px,${ev.deltaY}px,0)`,
            });

            //console.log(lNow,tNow);



        });

        this.hammertime.on('pinch', function(ev) {
            //console.log('pinch',ev);
        });



    };





    hb.drag=function(dom,options){
        return new drag(dom,options);
    };
}());