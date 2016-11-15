$(document).ready(function () {
    $('.AddToCart').on('click', function () {
        var proId = $(this).data('proid');
        var url = '/Cart/Add_ID/' + proId;
        var soluong = $("a#load_cart span").text();
        $.ajax({
            url: url,
            type: 'post',
            dataType: 'json',
            success: function (data) {
                if (data.status == true) {
                    $("a#load_cart span").text(parseInt(soluong) + 1);
                }
            },
            err: function () {
                alert("err");
            }
        });
    });
});