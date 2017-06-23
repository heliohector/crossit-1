/*!
 * My Portfolio v0.0.1 (https://codepen.io/koheishingai/phaEB)
 * Copyright 2013 Kohei Shingai.
 * Licensed under MIT 
 */

$(function () {

    var admskflg = 0;

    $("#modal").draggable({
        stop: function (event, ui) {
            admskflg = 1;
        },
        handle: "#mdhd"
    });
    $("#mdhd").disableSelection();

    var afht = window.innerHeight;
    var afwi = window.innerWidth;
    $('#msk').css('height', afht).css('width', afwi);

    $(window).resize(function () {
        var afht = window.innerHeight;
        var afwi = window.innerWidth;
        $('#msk').css('height', afht).css('width', afwi);
    });

    $('#cbox').click(function () {
        $('#cmfm').css('opacity', '1');
        $('#msk').css('display', 'block');
        $('#modal').css('top', afht / 2).css('left', 250);
    });

    var mskflg = 0;

    $('.in').click(function () {
        if (admskflg != 1) {
            mskflg = 1;
        }
    });

    $('#msk').click(function () {
        if (mskflg != 1) {
            $('#msk').css('display', 'none');
        }
        mskflg = 0;
        admskflg = 0;
    });
    $('#modal').click(function () {
        mskflg = 1;
    });


    $('.hb1').mouseover(function () {
        $('.hbg1').css('box-shadow', 'inset 1px 1px 50px rgba(117, 117, 117, 0.31)');
        $('.hb1 #frames').addClass('frshb');
    });

    $('.hb1').mouseleave(function () {
        $('.hbg1').css('box-shadow', 'none');
        $('.hb1 #frames').removeClass('frshb');
    });

    $('.hb2').mouseover(function () {
        $('.hbg2').css('box-shadow', 'inset 1px 1px 50px rgba(117, 117, 117, 0.31)');
        $('.hb2 #frames').addClass('frshb');
    });
    $('.hb2').mouseleave(function () {
        $('.hbg2').css('box-shadow', 'none');
        $('.hb2 #frames').removeClass('frshb');
    });
    $('.hb3').mouseover(function () {
        $('.hbg3').css('box-shadow', 'inset 1px 1px 50px rgba(117, 117, 117, 0.31)');
        $('.hb3 #frames').addClass('frshb');
    });
    $('.hb3').mouseleave(function () {
        $('.hbg3').css('box-shadow', 'none');
        $('.hb3 #frames').removeClass('frshb');
    });
    $('.hb4').mouseover(function () {
        $('.hbg4').css('box-shadow', 'inset 1px 1px 50px rgba(117, 117, 117, 0.31)');
        $('.hb4 #frames').addClass('frshb');
    });
    $('.hb4').mouseleave(function () {
        $('.hbg4').css('box-shadow', 'none');
        $('.hb4 #frames').removeClass('frshb');
    });
});