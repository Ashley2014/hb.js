;(function(){
    "use strict";

    function drag(dom,options){
        var options=options||{};
        var defaults={
            bottom:100,
            position:{
                left:0,
                top:0,
                scale:1
            },
            reachBottom:function(){
                //console.log('f')
            }
        };
        this.settings = $.extend( {}, defaults, options );

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

        var $element = this.$element;
        var $elementParent = this.$element.parent();

        var objWidth = $element.outerWidth();
        var objHeight = $element.outerHeight();
        var objParentWidth = $elementParent.innerWidth();
        var objParentHeight = $elementParent.innerHeight();

        var position=this.settings.position;


        var lNow=position.left;
        var tNow=position.top;
        $element.css({
            transform: `translate3d(${lNow}px,${tNow}px,0)`,
        });

        this.hammertime.on('pan', function(ev) {

            //console.log(ev.deltaX,ev.deltaY,ev.velocityX,ev.velocityY,ev.distance);
            lNow=ev.deltaX+position.left;
            tNow=ev.deltaY+position.top;

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


            $element.css({
                transform: `translate3d(${lNow}px,${tNow}px,0)`,
            });
            //$element.css({
            //    transform: `translate3d(${lNow}px,${tNow}px,0) scale3d(${position.scale},${position.scale},${position.scale})`,
            //});

            //console.log(lNow,tNow);


        });

        this.hammertime.on('panend', function(ev) {
            position.left=lNow;
            position.top=tNow;
            //console.log('pinch',ev);
        });

        this.hammertime.on('pinch', function(ev) {
            //console.log('pinch',ev);
            //position.scale=ev.scale;
            //$element.css({
            //    transform: `scale3d(${ev.scale},${ev.scale},${ev.scale}) translate3d(${position.left}px,${position.top}px,0)`,
            //});
        });



    };





    hb.drag=function(dom,options){
        return new drag(dom,options);
    };
}());