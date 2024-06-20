
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
    // 전체 선택
    function selectAll(selectAll)  {
        const checkboxes = document.getElementsByName('allCheck');
        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAll.checked;
        })
    }

    // 한 행 삭제
    $(document).ready(function () {
        $(".deleteCartOne").on("click", function(event) {
            var tr = $(this).closest("tr");
            var cartIdx = tr.find("td:eq(0)").text();
            event.preventDefault();
            $.ajax({
                method: "GET",
                url: "/shoppingMall/deleteCartOne",
                dataType: "text",
                data: {
                    cart_idx: cartIdx
                },
                success: function (data, status, xhr) {
                    tr.remove();
                    alert('삭제가 완료되었습니다')
                    window.location.href = "cartList";
                },
                error: function (xhr, status, error) {
                    console.log(error);
                }
            });
        });

        // 선택 삭제
        $(".deleteCartSelected").on("click", function(event) {
            event.preventDefault();
            var cartSelected = [];  // 선택된 cart_idx 값을 담을 배열

            // 선택된 체크박스에서 cart_idx 추출
            $(".check:checked").each(function() {
                var cartIdx = $(this).closest("tr").find("td:eq(0)").text();
                cartSelected.push(parseInt(cartIdx));
            });

            // AJAX 요청
            $.ajax({
                method: "GET",
                url: "/shoppingMall/deleteCartSelected",
                dataType: "text",
                traditional: true,
                data: {
                    cartSelected: cartSelected
                },
                success: function (data, status, xhr) {
                    alert('선택된 항목이 삭제되었습니다.');
                    window.location.href = "cartList";  // 삭제 후 새로고침
                },
                error: function (xhr, status, error) {
                    console.log(error);
                }
            });
        });

        // 전체 삭제
        $(document).ready(function () {
            $(".deleteCartAll").on("click", function (event) {
                event.preventDefault();
                $.ajax({
                    method: "GET",
                    url: "/shoppingMall/deleteCartAll",
                    dataType: "text",
                    success: function (data, status, xhr) {
                        $("table tbody tr").slice(1).each(function() {
                            $(this).remove();
                        });
                        alert('삭제가 완료되었습니다')
                        window.location.href = "cartList";
                    },
                    error: function (xhr, status, error) {
                        console.log(error);
                    }
                });
            });
        });
    });

</script>

<div class="TodoApp">
    <div class="container">
        <div>
            <table class="table">
                <thead>
                <tr>
                    <th class="scope">상품번호</th>
                    <th class="scope">
                        <input type="checkbox" name="allCheck" id="allCheck" value="allCheck" onclick='selectAll(this)'>
                    </th>
                    <th class="scope">상품이미지</th>
                    <th class="scope">상품정보</th>
                    <th class="scope">판매가</th>
                    <th class="scope">수량</th>
                    <th class="scope">합계</th>
                    <th class="scope">선택</th>
                </tr>
                </thead>
                <tbody>
                <c:set var="sum" value="0"/>
                <c:forEach var="dto" items="${cartList}" varStatus="status">
                    <c:set var="amount" value="${dto.cart_quantity}"/>
                    <c:set var="sum" value="${dto.cartList[0].product_price * amount + sum}"/>
                    <tr>
                        <td style="display: none">${dto.cart_idx}</td>
                        <td>${dto.product_idx}</td>
                        <td><input type="checkbox" name="allCheck" class="check"></td>
                        <td><img src="images/product/${dto.cartList[0].product_image}.jpg" width="80" height="100" ></td>
                        <td>
                            <span>${dto.cartList[0].product_name}</span>
                            [옵션: ${dto.cart_size}&nbsp;/&nbsp;${dto.cart_color}]
                        </td>
                        <td>
                            KRW <fmt:formatNumber value="${dto.cartList[0].product_price}" pattern="#,###"/>
                        </td>
                        <td>${amount}</td>
                        <td>
                            KRW <fmt:formatNumber value="${dto.cartList[0].product_price * amount}" pattern="#,###"/>
                        </td>
                        <td>
                            <div class="btn btn-light btn-outline-dark  deleteCartOne">주문하기</div>
                            <div class="btn btn-light btn-outline-dark  deleteCartOne">삭제</div>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td>[기본배송]</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td colspan="3" class="totalPrice">
                        합계 : &nbsp;KRW <fmt:formatNumber value="${sum}" pattern="#,###"/>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
<%--        <div class="btn">--%>
                <div class="btn btn-light btn-outline-dark deleteCartSelected">선택상품 삭제</div>
                <div class="btn btn-light btn-outline-dark deleteCartAll">전체삭제</div>
                <div class="btn btn-light btn-outline-dark orderCartAll">전체주문</div>
<%--        </div>--%>
    </div>
</div>
