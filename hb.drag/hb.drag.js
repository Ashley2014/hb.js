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
        var objParentBorderLeftWidth = Number($elementParent.css("border-left-width").replace(/px|rem|%|em/,''));
        var objParentBorderTopWidth = Number($elementParent.css("border-top-width").replace(/px|rem|%|em/,''));
        var objParentBorderOffsetLeft = $elementParent.offset().left;
        var objParentBorderOffsetTop = $elementParent.offset().top;
        var leftGap=objParentBorderLeftWidth+objParentBorderOffsetLeft;
        var topGap=objParentBorderTopWidth+objParentBorderOffsetTop;
        console.log(leftGap,topGap);


        var position=this.settings.position;


        var lNow=position.left;
        var tNow=position.top;

        var scaleNow=position.scale;
        var scaleLast=0;
        var center={
            x:objWidth/2,
            y:objHeight/2,
        };

        $element.css({
            transform: `translate3d(${lNow}px,${tNow}px,0)`,
        });

        this.hammertime.on('pan', function(ev) {
            console.log('pan',ev);

            //console.log(ev.deltaX,ev.deltaY,ev.velocityX,ev.velocityY,ev.distance);

            lNow=ev.deltaX+position.left;
            tNow=ev.deltaY+position.top;



            //lNow=(ev.deltaX+position.left)*scaleNow;
            //tNow=(ev.deltaY+position.top)*scaleNow;

            //if( lNow>0){
            //    lNow=0;
            //}
            //
            //if( tNow>0){
            //    tNow=0;
            //}



            if( lNow>-(center.x-center.x*scaleNow)){
                lNow=-(center.x-center.x*scaleNow);
            }


            if( tNow>-(center.y-center.y*scaleNow)){
                tNow=-(center.y-center.y*scaleNow);
            }


            //if( lNow<(objParentWidth-objWidth) ){
            //    lNow=objParentWidth-objWidth;
            //}
            //
            //if( tNow<(objParentHeight-objHeight) ){
            //    tNow=objParentHeight-objHeight;
            //}



            if( lNow<(objParentWidth-objWidth+(objWidth-objWidth*scaleNow-(center.x-center.x*scaleNow))) ){
                lNow=objParentWidth-objWidth+(objWidth-objWidth*scaleNow-(center.x-center.x*scaleNow))
            }


            if( tNow<(objParentHeight-objHeight+(objHeight-objHeight*scaleNow-(center.y-center.y*scaleNow))) ){
                tNow=objParentHeight-objHeight+(objHeight-objHeight*scaleNow-(center.y-center.y*scaleNow))
            }


            //console.log(lNow,tNow)

            //
            //$element.css({
            //    transform: `translate3d(${lNow}px,${tNow}px,0)`,
            //});
            $element.css({
                transform: `translate3d(${lNow}px,${tNow}px,0) scale3d(${position.scale},${position.scale},${position.scale})`,
            });

            //console.log(lNow,tNow);


        });

        this.hammertime.on('panend', function(ev) {
            position.left=lNow;
            position.top=tNow;
            //console.log('pinch',ev);
        });

        this.hammertime.on('pinch', function(ev) {
            console.log('pinch',ev);

            if(scaleLast){
                var deltaScale=ev.scale-scaleLast;
            }else{
                var deltaScale=0
            }

            scaleNow=position.scale+deltaScale;
            position.scale=scaleNow;
            scaleLast=ev.scale;

            //console.log('pinch',scaleNow);
            $element.css({
                transform: `scale3d(${scaleNow},${scaleNow},${scaleNow}) translate3d(${position.left}px,${position.top}px,0)`,
                transformOrigin: `${ev.center.x-leftGap-lNow}px ${ev.center.y-topGap-tNow}px 0`,
            });

            center={
                x:ev.center.x-leftGap-lNow,
                y:ev.center.y-topGap-tNow,
            };




        });
        this.hammertime.on('pinchend', function(ev) {

            position.scale=scaleNow;
            scaleLast=0;

        });



    };





    hb.drag=function(dom,options){
        return new drag(dom,options);
    };
}());