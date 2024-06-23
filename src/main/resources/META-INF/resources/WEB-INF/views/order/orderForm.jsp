<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--할인 전 총 금액--%>
<c:set var="point" value="${userDTO.user_point}" scope="page"/>

<c:forEach var="dto" items="${cartList}" varStatus="status">
    <c:set var="amount" value="${dto.cart_quantity}"/>
    <c:set var="sum" value="${dto.cartList[0].product_price * amount + sum}"/>
</c:forEach>

<script type="text/javascript">
    $(document).ready(function () {
        $("#inputPoint").on("blur", function (event) {

            var inputPoint = parseInt($("#inputPoint").val());
            var totalDiscountSum = $("#totalDiscountSum").val();
            var mesg = "사용가능 적립금보다 많습니다.\n적립금 사용금액을 다시 입력해주세요";

            if (inputPoint > ${point}) {
                alert(mesg);
                $("#inputPoint").val('');
                $("#totalUsePoint").text('-KRW ' + 0);
                $("#totalDiscountSum").text('KRW ' + (${sum}).toLocaleString('ko-KR'));
            }
            else {
                $("#totalUsePoint").text('-KRW ' + (inputPoint.toLocaleString('ko-KR')));
                $("#totalDiscountSum").text('KRW ' + (${sum} -inputPoint).toLocaleString('ko-KR'));
            }
        });

        // // 결제 요청
        // $("#submitCheck").on("submit", function() {
        //     // user정보, producdt정보, order_totalPrice, order_comment
        //     $.ajax({
        //         method: "POST",
        //         url: "/shoppingMall/orderForm",
        //         dataType: "text",
        //         success: function (data, status, xhr) {
        //             console.log(data);
        //         },
        //         error: function(xhr, status, error) {
        //             console.log(error);
        //         }
        //     })
        // })



    });
</script>
<div class="titleArea">
    <h2>ORDER FORM</h2>
</div>
<hr>
<div class="userInfoTop">
    <div class="description">
        <div class="member ">
            <strong class="txt17 txtWarn">${userDTO.user_name}</strong> 님은, 일반 회원이십니다.<br>
            KRW 10,000 이상 구매시 1%을 적립 받으실 수 있습니다.
        </div>
        <div>가용적립금 : <strong>
            <fmt:formatNumber value="${point}" pattern="#,###"/>
        </strong> 원
        </div>
    </div>
</div>

<div class="TodoApp">
    <div class="container">
        <div>
            <table class="table">
                <thead>
                <tr>
                    <th class="scope">상품번호</th>
                    <th class="scope">상품이미지</th>
                    <th class="scope">상품정보</th>
                    <th class="scope">판매가</th>
                    <th class="scope">수량</th>
                    <th class="scope">합계</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="dto" items="${cartList}" varStatus="status">
                    <tr>
                        <td style="display: none">${dto.cart_idx}</td>
                        <td>
                                ${dto.product_idx}
                        </td>
                        <td><img src="images/product/${dto.cartList[0].product_image}.jpg" width="80" height="100">
                        </td>
                        <td>
                            <span>${dto.cartList[0].product_name}</span><br>
                            [옵션: ${dto.cart_size}&nbsp;/&nbsp;${dto.cart_color}]
                        </td>
                        <td>
                            KRW <fmt:formatNumber value="${dto.cartList[0].product_price}" pattern="#,###"/>
                        </td>
                        <td>${amount}</td>
                        <td>
                            KRW <fmt:formatNumber value="${dto.cartList[0].product_price * amount}"
                                                  pattern="#,###"/>
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
            <div id="infoChange">
                <span>상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</span>
            </div>
            <%--            결제예정금액--%>
            <table class="table">
                <thead>
                <tr>
                    <th>총 주문 금액</th>
                    <th>총 할인(적립금)</th>
                    <th>총 결제예정 금액</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th class="totalPrice">
                        KRW <fmt:formatNumber value="${sum}" pattern="#,###"/>
                    </th>
                    <th>
                        <span id="totalUsePoint">-KRW 0</span>
                    </th>
                    <th>
                        <span id="totalDiscountSum">
                        KRW <fmt:formatNumber value="${sum}" pattern="#,###"/>
                        </span>
                    </th>
                </tr>
                <tr>
                    <th>
                        적립금
                    </th>
                    <th>
                        <input type="text" id="inputPoint" class="form-control-sm" style="width: 150px; font-size: 12px;" > 원
                        (총 사용 가능 적립금: <fmt:formatNumber value="${point}" pattern="#,###"/>원)
                        <br><span>- 적립금은 최소 0원 이상일 때 사용 가능합니다</span>
                    </th>
                    <th></th>
                </tr>
                <tr>
                    <th>결제수단</th>
                    <th class="howtopay">
                        <input type="radio" name="pay" id="creditcard" checked="checked">
                        <label for="creditcard">신용카드</label>
                        <input type="radio" name="pay" id="kakaopay">
                        <label for="kakaopay">카카오페이</label>
                        <input type="radio" name="pay" id="accountpay">
                        <label for="accountpay">무통장입금</label>
                    </th>
                </tr>
                </tbody>
            </table>
            <%--            회원정보란--%>
            <div>
                <form id="paymentForm" action="orderAdd" method="post">
                    <c:forEach items="${cartList}" var="cart" varStatus="stat">
                        <input type="hidden" name="product_idx" value="${cart.product_idx}">
                        <input type="hidden" name="cart_quantity" value="${cart.cart_quantity}">
                        <input type="hidden" name="cart_color" value="${cart.cart_color}">
                        <input type="hidden" name="cart_size" value="${cart.cart_size}">
                    </c:forEach>
                    <table class="table">
                        <thead>
                        <tr>
                            <th class="scope">배송 정보</th>
                            <th class="scope">필수입력사항</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>받으시는 분</td>
                            <td>
                                <input type="text" class="form-control" id="user_name" name="user_name" value="${userDTO.user_name}">
                            </td>
                        </tr>
                        <tr>
                            <td>전화번호</td>
                            <td>
                                <input type="text" class="form-control" id="user_phone" name="user_phone" value="${userDTO.user_phone}">
                            </td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td>
                                <input type="email" id="user_email" name="user_email" class="form-control" placeholder="직접입력"
                                       value="${userDTO.user_email}">
                            </td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>
                                <div class="d-flex">
                                    <div class="col-auto">
                                        <button type="button" class="btn btn-light btn-outline-dark btn-outline-secondary mx-2"
                                                onclick="sample4_execDaumPostcode()">우편번호
                                        </button>
                                    </div>
                                    <div class="col">
                                        <input type="text" id="sample4_postcode" name="user_post" class="form-control" placeholder="우편번호"
                                               value="${userDTO.user_post}">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>도로명주소</td>
                            <td>
                                <input type="text" id="sample4_roadAddress" name="user_addr1" class="form-control" placeholder="도로명주소"
                                       value="${userDTO.user_addr1}">
                            </td>
                        </tr>
                        <tr>
                            <td>지번주소</td>
                            <td>
                                <input type="text" id="sample4_jibunAddress" name="user_addr2" class="form-control" placeholder="지번주소"
                                       value="${userDTO.user_addr2}">
                                <span id="guide" style="color:#999"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>배송메시지</td>
                            <td>
                                <textarea class="form-control" id="order_comment" name="order_comment">배송 전 미리 연락바랍니다.</textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <button type="submit" class="btn btn-light btn-outline-dark  btn-outline-secondary" id="submitCheck">결제하기
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    console.log(${sum})
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if (fullRoadAddr !== '') {
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if (data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if (data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>