$(document).ready(function () {
    var common = {
        init: function () {
            common.registerEvent();
        },
        registerEvent: function () {
            $("#txtkeyword").autocomplete({
                minLength: 2,
                source: function (request, response) {
                    $.ajax({
                        url: "/SanPham/AutoCompleteSearch",
                        dataType: "json",
                        data: {
                            q: request.term
                        },
                        success: function (res) {
                            response(res.data);
                        }
                    });
                },

                focus: function (event, ui) {
                    $("#txtkeyword").val(ui.item.TENSP);
                    return false;
                },
                select: function (event, ui) {
                    var url = $(location).attr('href');
                    var res = url.split("/");
                    var k = res[0] +"//"+ res[1] + res[2];
                    var urlnew = k + '/SanPham/SanPhamChitiet?spid_x=' + ui.item.MASP + '';
                    $(location).attr('href', urlnew);
                   // alert(urlnew);
                 //$("#txtkeyword").val(ui.item.TENSP);
                 return false;
                },
            })
            .autocomplete("instance")._renderItem = function (ul, item) {
                return $("<li style= font-size:16px;background:#DDDDDD;>")
             .append("<div id='search_div'><a id='search_key'><img src='/hinhanh/" + item.Link + "'style=width:40px; height:30px; />" + item.TENSP + "</a></div>")
            //.append("<a href='./SanPhamChiTiet?spid_x?=" + item.MASP + "' class=search_key><img src='/hinhanh/" + item.Link + "'style=width:30px; height:30px; />" + item.TENSP + "</a>")
            //.append("<a href='javascipt:;' id=search_key><img src='/hinhanh/" + item.Link + "'style=width:30px; height:30px; />" + item.TENSP + "</a>")
            .appendTo(ul);
               
            };
        }
    }
    common.init();
    //$("#search_key").keyup( function () {
    //    alert("a");
    //});
    //$("#search_div").on('click', function () {
    //    alert("a");
    //});
    
});
