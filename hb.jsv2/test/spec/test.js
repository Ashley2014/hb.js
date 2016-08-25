(function () {
    'use strict';

    describe('get full url', function () {
        it(`should get full url as ${window.location.href}`, function () {
            expect(hb.location.url()).toBe(window.location.href);
        });
    });
    describe('get query', function () {

        it(`should get string after '?' ${hb.location.url('query')}`, function () {

        });
    });
    describe('hexToRgb', function () {

        it(`#fff should to rgb(255,255,255)`, function () {
            expect(hb.color.hexToRgb('#fff',true)).toBe('rgb(255,255,255)');
        });
        it(`#fff whitout second parameter should to { r: 255, g: 255, b: 255 }`, function () {
            expect(hb.color.hexToRgb('#fff')).toEqual({ r: 255, g: 255, b: 255 });
        });
    });

    describe("A spec using the fail function", function() {
        var foo = function(x, callBack) {
            if (x) {
                callBack();
            }
        };

        it("should not call the callBack", function() {
            foo(false, function() {
                fail("Callback has been called");
            });
        });
    });

})();
