require("./style.scss");
var $=require("jquery");
var hb=require("hb");
//var template = require("./dialog.jade");
var html = require("raw-loader!jade-html!./dialog.jade");
var $html = $(html);
var $close = $html.find('[hb-login-close]');
var $form = $html.find('[hb-login-form]');
var $error = $html.find('[hb-login-error]');
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





hb.account=(function(){
    return {
        login:open
    };
}());
//console.log($.isPlainObject({a:1}));



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
    $bg.on('click',close);
    $close.on('click',close);
    submit=function(event){
        event.preventDefault();
        //console.log('234')
        //deferred = $.Deferred();
        login({
            phone: $.trim($("[hb-login-phone]").val()),
            password: $("[hb-login-password]").val()
        }).done(function(res){
            //return res;
            //console.log(res);
            $error.hide();
            $("[hb-login-phone]").val('');
            $("[hb-login-password]").val('');
            haloAuth.setToken(res.data.token);
            haloAuth.setUser(res.data.user);
            close();
            callbackSuccess(res);

        }).fail(function(res){
            //return res;
            //console.log(res);
            $error.text(res).show();
            callbackError(res);
        });
    };
    $form.on('submit',submit);
}

function close(){
    $html.remove();
    $bg.remove();
    $bg.off('click',close);
    $close.off('click',close);
    $form.off('submit',submit)
}

function submit(){

}

function login(data) {
    var deferred = $.Deferred();

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
        data = data || {};
        switch (true) {
            case !data.phone:
                deferred.reject('请输入手机号');
                break;
            case !hb.validation.checkPhone(data.phone):
                deferred.reject('您的手机号格式错误');
                break;
            case !data.password:
                deferred.reject('请输入密码');
                break;
            default:
                sendXhr();
        }
    };

    var sendXhr = function() {
        $.ajax(xhrOptions);

    };
    init();
    return deferred.promise();

}




