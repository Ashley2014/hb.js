require("./style.scss");
var $=require("jquery");
var hb=require("hb");
//var template = require("./dialog.jade");
var html = require("raw-loader!jade-html!./dialog.jade");
var $html = $(html);
var $close = $html.find('[hb-login-close]');
var $form = $html.find('[hb-login-form]');
var $error = $html.find('[hb-login-error]');
var errorType = '';
var isSumitted = false;
var $phone = $html.find('[hb-login-phone]');
var $password = $html.find('[hb-login-password]');


var bg=`<div class="hb-login-bg"></div>`;
var $bg=$(bg);
var options={};
var defaultOption={
    debug:false,
    callbackSuccess:function(){},
    callbackError:function(){},
};

var  haloAuth=(function() {
    var domain = hb.location.url('domain');
    var hostname = hb.location.url('hostname');
    if (hostname == 'localhost') {
        var domain = '';
    } else {
        var domain = hb.location.url('domain') || '';
    }
    //console.log(domain,hostname);
    var setUser = function (data) {
        //window.localStorage.setItem('user', JSON.stringify(data));
        hb.Cookies.set('halo_user', data, {domain: domain, expires: 30});
    };
    var getUser = function () {
        //return JSON.parse(window.localStorage.getItem('user'));
        return hb.Cookies.getJSON('halo_user');
    };

    var setToken = function (data) {

        //window.localStorage.setItem('token', JSON.stringify(data));

        hb.Cookies.set('halo_token', data, {domain: domain, expires: 30});
    };
    var getToken = function () {

        //return JSON.parse(window.localStorage.getItem('token'));
        return hb.Cookies.getJSON('halo_token');
    };
    var removeToken = function () {
        //window.localStorage.removeItem('token');
        hb.Cookies.remove('halo_token', {domain: domain}); // removed!

    };
    var removeUser = function () {
        //window.localStorage.removeItem('user');
        hb.Cookies.remove('halo_user', {domain: domain}); // removed!
    };
    var _clear = function () {
        //window.localStorage.removeItem('user');
        //window.localStorage.removeItem('token');
        removeToken();
        removeUser();
    };

    return {
        setUser: setUser,
        getUser: getUser,
        removeUser: removeUser,
        setToken: setToken,
        getToken: getToken,
        removeToken: removeToken,
        clear: _clear
    }
}());

//$.fn.hb_login_zIndex=function( zIndex ) {
//    if ( zIndex !== undefined ) {
//        return this.css( "zIndex", zIndex );
//    }
//
//    if ( this.length ) {
//        var elem = $( this[ 0 ] ), position, value;
//        while ( elem.length && elem[ 0 ] !== document ) {
//            // Ignore z-index if position is set to a value where z-index is ignored by the browser
//            // This makes behavior of this function consistent across browsers
//            // WebKit always returns auto if the element is positioned
//            position = elem.css( "position" );
//            if ( position === "absolute" || position === "relative" || position === "fixed" ) {
//                // IE returns 0 when zIndex is not specified
//                // other browsers return a string
//                // we ignore the case of nested elements with an explicit value of 0
//                // <div style="z-index: -10;"><div style="z-index: 0;"></div></div>
//                value = parseInt( elem.css( "zIndex" ), 10 );
//                if ( !isNaN( value ) && value !== 0 ) {
//                    return value;
//                }
//            }
//            elem = elem.parent();
//        }
//    }
//
//    return 0;
//};



hb.account=(function(){
    return {
        login:open
    };
}());
//console.log($.isPlainObject({a:1}));

//$form.on('submit',function(event){
//    console.log('oo')
//    event.preventDefault();
//});

function open(p1,p2,p3){

    var callbackSuccess,callbackError;

    callbackSuccess=function(){};
    callbackError=function(){};

    if ($.isFunction(p1)){
        callbackSuccess=p1;
    }
    if ($.isFunction(p2)){
        callbackError=p2;
    }


    if ($.isPlainObject(p1)){
        options=$.extend({},defaultOption,p1);
        callbackSuccess=options.callbackSuccess;
        callbackError=options.callbackError;
    }else{
        options=defaultOption;
    }

    if(p3){
        options.debug=true;
    }







    $('body').append($bg).append($html);
    var scrollTop=$(window).scrollTop();
    var windowH=$(window).height();
    var elH=$html.outerHeight();
    $html.css({
        top:scrollTop+windowH/2-elH/2,
    });

    $bg.on('click',close);
    $close.on('click',close);

    var submit=function(event){
        event.preventDefault();
        isSumitted=true;
        //deferred = $.Deferred();
        hb.util.loading.show();
        login({
            phone: $.trim($phone.val()),
            password: $password.val()
        }).done(function(res){
            //return res;
            //console.log(res);
            hb.util.loading.hide();
            $error.hide();
            $phone.val('');
            $password.val('');
            haloAuth.setToken(res.data.token);
            haloAuth.setUser(res.data.user);
            close();
            callbackSuccess(res);

        }).fail(function(res){
            //return res;
            //console.log(res);
            hb.util.loading.hide();
            $error.text(res).show();
            callbackError(res);
        });
    };

    $form.on('submit',submit);
    $phone.on('blur',function(){
        if(!isSumitted){
            return
        }
        if(errorType=='phone'){
            frontValidation.phone($.trim($phone.val())).then(function(res){
                $error.hide();
            },function(res){
                $error.text(res).show();
            });
        }
    });
    //$([$phone,$password]).each(function(){
    //    this.on('blur',function(){
    //        console.log('aa')
    //        hintMsg({
    //            phone: $.trim($phone.val()),
    //            password: $password.val()
    //        });
    //    });
    //})

}

function close(){
    $html.remove();
    $bg.remove();
    $bg.off('click',close);
    $close.off('click',close);

    //$form.off('submit',submit);
    //$._data($phone,"events");
    //console.log($phone)
    //console.log($._data($phone,"events"))

}



function login(data) {
    var deferred = $.Deferred();
    data = data || {};
    var xhrOptions={
        //method: "POST",
        dataType: "jsonp",
        url: "http://account.halobear.com/api/login",
        //timeout: 10000,
        data: data,
        success: function(res, textStatus, errorThrown) {
            //console.log(res);
            if (res.iRet == 1) {
                deferred.resolve(res);
            } else {
                deferred.reject(res.info);
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            //console.log(jqXHR, textStatus, errorThrown);
            deferred.reject('网络繁忙请稍候再试');
            //if(t==="timeout") {
            //	// something went wrong (handle it)
            //}
        }
    };
    if(options.debug){
        xhrOptions.url="http://account.hx.com/api/login"
    }



    var init = function() {
        frontValidation.all(data).then(function(res){
            sendXhr();
        },function(res){
            deferred.reject(res);
        });
        //data = data || {};
        //switch (true) {
        //    case !data.phone:
        //        errorType='phone';
        //        deferred.reject('请输入手机号');
        //        break;
        //    case !hb.validation.checkPhone(data.phone):
        //        errorType='phone';
        //        deferred.reject('您的手机号格式错误');
        //        break;
        //    case !data.password:
        //        errorType='password';
        //        deferred.reject('请输入密码');
        //        break;
        //    default:
        //        sendXhr();
        //}
    };

    var sendXhr = function() {
        $.ajax(xhrOptions);
    };
    init();
    return deferred.promise();

}




var frontValidation=(function(data){
    //var deferred = $.Deferred();
    //data = data || {};
    //switch (true) {
    //    case !data.phone:
    //        errorType='phone';
    //        deferred.reject('请输入手机号');
    //        break;
    //    case !hb.validation.checkPhone(data.phone):
    //        errorType='phone';
    //        deferred.reject('您的手机号格式错误');
    //        break;
    //    case !data.password:
    //        errorType='password';
    //        deferred.reject('请输入密码');
    //        break;
    //    default:
    //        deferred.resolve('all good');
    //}
    //return deferred.promise();


    function checkPhone(phone){
        var deferred = $.Deferred();
        switch (true) {
            case !phone:
                errorType='phone';
                deferred.reject('请输入手机号');
                break;
            case !hb.validation.checkPhone(phone):
                errorType='phone';
                deferred.reject('您的手机号格式错误');
                break;
            default:
                deferred.resolve('phone good');
        }
        return deferred.promise();
    }
    function checkPassword(pwd){
        var deferred = $.Deferred();
        switch (true) {
            case !pwd:
                errorType='password';
                deferred.reject('请输入密码');
                break;
            default:
                deferred.resolve('pwd good');
        }
        return deferred.promise();
    }

    function checkAll(data){
        data = data || {};
        //var deferred = $.Deferred();
        return checkPhone(data.phone).then(function(res){
            return checkPassword(data.password);
        });
        //return deferred.promise();
    }

    return{
        all:checkAll,
        phone:checkPhone
    }
}());




