$(function () {
    csmapi.set_endpoint ('http://5.iottalk.tw:9999');
    var profile = {
        'dm_name': 'Bulb',
        'idf_list': [],
        'odf_list': [Luminance, Color_O],
    }
    
    var r = 0;
    var g = 200;
    var b = 200;
    var lum = 100;

    var firstRun = 1;  // 程式的狀態
    var tout = 0; // time out 時間 -- 過多少 ms 要執行 ccc( ) 變化顏色
    var myLoop;   // 用來記住定時工作的工作代碼 (job ID)

    function draw () {
        var rr = Math.floor((r * lum) / 100);
        var gg = Math.floor((g * lum) / 100);
        var bb = Math.floor((b * lum) / 100);
        $('.bulb-top, .bulb-middle-1, .bulb-middle-2, .bulb-middle-3, .bulb-bottom, .night').css(
            {'background': 'rgb('+ rr +', '+ gg +', '+ bb +')'}
        );
    }

    function Luminance (data) {
        if(firstRun==99)if(data[0] < 1) { firstRun=1; clearTimeout(myLoop); }
        if(firstRun==3){ firstRun=99; myLoop=setTimeout(ccc, 3000); } /// 三秒後啟動 ccc( )
        if(firstRun==2)firstRun=3; 
        if(firstRun==1)firstRun=2; 
        lum = data[0]
        draw();
    }

    function ccc( ) {
        r = Math.floor(256 * Math.random( ));
        g = Math.floor(256 * Math.random( ));
        b = Math.floor(256 * Math.random( ));
        if( Math.max(r, g, b) < 102) { r=g=255; b=51;  }
        tout = 150 + 100 * Math.floor( 20* Math.random( ));
        myLoop = setTimeout(ccc, tout);
        draw();
    } 

    function Color_O (data) {
        r = data[0];
        g = data[1];
        b = data[2];
        draw();
    }

    function ida_init () {
        $('font')[0].innerText = profile.d_name;
        $('#ggyy')[0].innerText = csmapi.get_endpoint() ;
        draw();
    }

    var ida = {
        'ida_init': ida_init,
    };

    dai(profile, ida);
});
