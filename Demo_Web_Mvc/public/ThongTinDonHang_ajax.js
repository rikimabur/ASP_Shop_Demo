$(document).ready(function () {
    var check_donhang = true;
    $("a#order_id").click(function () {
        if (check_donhang == true)
        {
            check_donhang = false;
            // hien thi don hang theo ma
            var mataikhoan = $("#MaTK").val();
            var list_luu = [];// lưu vào mảng tránh trường hợp click nhiều lần 

            url = '/DonHang/ThongTinDonHang/' + mataikhoan;
            $.ajax({
                url: url,
                type: 'POST',
                datatype: 'Json',
                success: function (data) {
                    // hien thi thong tin
                    var html_table =
                    '<div class="col-lg-12 hienthi_donhang_ct">' +
                    '<div class="panel panel-default">' +
                    '<div class="panel-heading text-center"><h3>Thông Tin Đơn Hàng</h3></div>' +
                    '<div class="panel-body">' +
                    '<table class="table table-condensed" style="border-collapse:collapse;">' +
                    '<thead>' +
                        '<tr>' +
                            '<th>STT</th>' +
                            '<th>Ngày Mua</th>' +
                            '<th>Tổng Tiền</th>' +
                            '<th>&nbsp;</th>' +
                        '</tr>' +
                    '</thead>' +
                    '<tbody id="tbobylist">' +
                    '</tbody>' +
                    '</table>' +
                    '</div>' +
                    '</div>' +
                    '</div>';
                    $("#thongtin").append(html_table);
                    var i = 0;
                    $.each(data, function (idx, ord) {
                        i = i + 1;
                        var html =
                            '<tr class ="add_mau' + ord.MaDH + '" >' +
                                '<td>' + i + '</td>' +
                                '<td>' + ord.ngaynhap + '</td>' +
                                '<td>' + ord.tongtien + '</td>' +
                               '<td>' +
                                    '<button class="btn btn-default btn-xs order_row" id="order_row" data-id=' + ord.MaDH + '><span class="glyphicon glyphicon-triangle-bottom ma_dh' + ord.MaDH + '"></span></button>' +
                                '</td>' +
                            '</tr>' +
                            '<tr>' +
                             '<td colspan="12" class="hiddenRow">' +
                             '<div id="chitiet_order' + ord.MaDH + '"> ' +

                              '</div>' +
                             '</td>' +
                            '</tr>';
                        $("#tbobylist").append(html);
                    });
                    // ket thuc hien thi don hang theo ma
                    //// ajax don hang chi tiet
                    $('button.order_row').click(function () {
                        var MaDH = $(this).data('id');
                        list_luu.push(MaDH);
                        var count = 0;
                        for (i = 0; i < list_luu.length; i++) {
                            if (MaDH == list_luu[i]) {
                                count = count + 1;
                            }
                        }
                        if (count < 2) {
                            url1 = '/DonHang/ThongTinDonHangChiTiet/' + MaDH;
                            $.ajax({
                                url: url1,
                                type: 'POST',
                                datatype: 'Json',
                                success: function (data) {
                                    var i = 0;
                                    var html_ct =
                                      '<div class="row donhang_chitiet" id="orderdetail"> <h3 class="text-center">Chi Tiết Đơn Hàng</h3>' +
                                      '<table class="table table-striped table_chitiet">' +
                                         '<thead>' +
                                             '<tr>' +
                                              '<td>STT</td>' +
                                              '<td>Tên Sản Phẩm</td>' +
                                              '<td>Hình Ảnh</td>' +
                                              '<td>Số Lượng</td>' +
                                              '<td>Giá</td>' +
                                              '<td>Tổng Tiền</td>' +
                                            '</tr>' +
                                          '</thead>' +
                                          '<tbody id="donhang_ct' + MaDH + '">' +
                                           '</tbody>' +
                                        '</table>  ' +
                                      '</div> ';
                                    $('tr.add_mau' + MaDH).css({ "background-color": "yellow" });
                                    $('#chitiet_order' + MaDH).append(html_ct);
                                    $('#chitiet_order' + MaDH).find(".donhang_chitiet:last").hide().slideDown();
                                    $.each(data, function (idx, ort) {
                                        i = i + 1;
                                        var html2 =
                                        '<tr>' +
                                            '<td>' + i + '</td>' +
                                            '<td>' + ort.TENSP + '</td>' +
                                            '<td><img src="/hinhanh/' + ort.Link + ' " style="width:50px; height:50px;"></td>' +
                                            '<td><input type="text" value="' + ort.SoLuong + '" class="quantity_dh"  id="quantity_dh" data-id="' + ort.MaSP + '" /></td>' +
                                            '<td>1</td>' +
                                            '<td>' + ort.tongtien + '</td>';
                                        '</tr>';
                                        $('button.order_row span.ma_dh' + ort.MaDH).removeClass('glyphicon glyphicon-triangle-bottom').addClass('glyphicon glyphicon-triangle-top');
                                        $('#donhang_ct' + ort.MaDH).append(html2)
                                        // dinh dang touchSpin
                                        $("td input.quantity_dh").TouchSpin(
                                         {
                                             min: 1,
                                             verticalbuttons: true
                                         });
                                        // ket thuc dinh dang
                                    });
                                },
                            });
                        }
                        else //  co thể dùng hiệu ứng slideToggle() thay cho 2 cái dưới
                            if ((count % 2) == 0 && count > 1) {
                                $('tr.add_mau' + MaDH).removeAttr('style');
                                $('button.order_row span.ma_dh' + MaDH).removeClass('glyphicon glyphicon-triangle-top').addClass('glyphicon glyphicon-triangle-bottom');
                                $('#chitiet_order' + MaDH).slideUp();

                            }
                            else {
                                $('tr.add_mau' + MaDH).css({ "background-color": "yellow" });
                                $('button.order_row span.ma_dh' + MaDH).removeClass('glyphicon glyphicon-triangle-bottom').addClass('glyphicon glyphicon-triangle-top');
                                $('#chitiet_order' + MaDH).slideDown();
                            }

                    });
                    //// ket thuc ajax don hang chi tiet
                },
                err: function () {
                    alert("err");
                }
            });
        }
        else
        {
            $("#thongtin").slideUp();
            check_donhang = true;
        }
    });



});