
import styles from "./style.scss";
//confirm('aaa')
console.log(styles)
$('body').append(`
<div class="${styles.lg1}">
ewrewr
<div class="${styles.inner}">334</div>
</div>
<div class="${styles.inner}">333</div>
`);

var iui=(function(){
    var _alert=function(options){
        var deferred = $.Deferred();
        var defaults = {
            title:'提示',
            content:'提示内容',
            btn:'确定',
        };

        if(typeof options=="string"){
            defaults = $.extend(defaults,{
                content:options
            });
        }else{

        }

        var settings = $.extend( {},defaults, options );

        var alertHtmlStr=`
    <div id="iui-pop-alert" class="${styles['mui-popup']} " style="display: block;">
    <div class="${styles['mui-popup-inner']}">
    <div class="${styles['mui-popup-title']}">${settings.title}</div>
    <div class="${styles['mui-popup-text']}">${settings.content}</div></div>
    <div class="${styles['mui-popup-buttons']}">
    <span class="${styles['mui-popup-button']} ${styles['mui-popup-button-bold']}">${settings.btn}</span>
    </div>
    </div>
    <div class=" ${styles['mui-popup-backdrop']}  ${styles['mui-active']}" ></div>
        `;
        var $alertHtml=$(alertHtmlStr);
        $("body").append($alertHtml);
        setTimeout(function(){
            $("#iui-pop-alert").addClass(styles['mui-popup-in']);
        });
        //$alertHtml.find(`.${styles['mui-popup-button']}`).fadeIn(200);
        var $confirmBt=$alertHtml.find(`.${styles['mui-popup-button']}`);
        $confirmBt.on('click',function(){
            $alertHtml.remove();
            deferred.resolve(true);
        });
        return deferred.promise();
    };

    var _confirm=function(options){
        var deferred = $.Deferred();
        var defaults = {
            title:'提示',
            content:'提示内容',
            rightBtn:'确定',
            leftBtn:'取消',
        };

        if(typeof options=="string"){
            defaults = $.extend(defaults,{
                content:options
            });
        }else{

        }

        var settings = $.extend( {},defaults, options );
        var confirmHtmlStr=`
    <div id="iui-pop-alert" class="${styles['mui-popup']} " style="display: block;">
    <div class="${styles['mui-popup-inner']}">
    <div class="${styles['mui-popup-title']}">${settings.title}</div>
    <div class="${styles['mui-popup-text']}">${settings.content}</div></div>
   <div class="${styles['mui-popup-buttons']}">
   <span id="iui-pop-confirm-left" class="${styles['mui-popup-button']}">${settings.leftBtn}</span><span id="iui-pop-confirm-right" class="${styles['mui-popup-button']} ${styles['mui-popup-button-bold']}">${settings.rightBtn}</span>
   </div>
    </div>
    <div class=" ${styles['mui-popup-backdrop']}  ${styles['mui-active']}" ></div>
                `;

        var $confirmHtml=$(confirmHtmlStr);
        $("body").append($confirmHtml);
        setTimeout(function(){
            $("#iui-pop-alert").addClass(styles['mui-popup-in']);
        });
        //$confirmHtml.find(".weui-dialog").fadeIn(200);
        var $confirmBt=$confirmHtml.find("#iui-pop-confirm-right");
        $confirmBt.on('click',function(){
            $confirmHtml.remove();
            deferred.resolve(true);
        });
        var $cancelBt=$confirmHtml.find("#iui-pop-confirm-left");
        $cancelBt.on('click',function(){
            $confirmHtml.remove();
            deferred.reject(false);
        });
        return deferred.promise();

    };



    var loading=(function(){
        var loadingHtmlStr=`<div  >
<div class="${styles['weui-mask_transparent']}"></div>
<div class="${styles['weui-toast']}">
    <i class="${styles['weui-loading']} ${styles['weui-icon_toast']}"></i>
    <p class="${styles['weui-toast__content']}">数据加载中</p>
</div>
</div>`;
        var $loadingHtml=$(loadingHtmlStr);
        var show=function(){
            $("body").append($loadingHtml);
        };
        var hide=function(){
            $loadingHtml.remove();
        };

        return{
            show:show,
            hide:hide
        }
    }());



    var toast=function(msg){
        var toastHtmlStr=`<div >
<div class="${styles['weui-mask_transparent']}"></div>
<div class="${styles['weui-toast']}">
    <i class="${styles['weui-icon-success-no-circle']} ${styles['weui-icon_toast']} glyphicon glyphicon-ok"></i>
    <p class="${styles['weui-toast__content']}">${msg}</p>
</div>
</div>`;
        var $toastHtml=$(toastHtmlStr);
        $("body").append($toastHtml);
        var $weui_toast=$toastHtml.find(".weui-toast");
        $weui_toast.fadeIn(200);
        var hideToast=function(){
            $toastHtml.fadeOut(400).remove();
        };
        //setTimeout(hideToast,600);
    };



    return{
        alert:_alert,
        confirm:_confirm,
        loading:loading,
        toast:toast,
    };
}());


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


export default iui;


