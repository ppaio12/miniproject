<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">

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
            <fmt:formatNumber value="${userDTO.user_point}" pattern="#,###"/>
        </strong> 원
        </div>
    </div>
</div>

<div class="TodoApp">
    <div class="container">
        <form id="paymentForm" action="payment" method="post">
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
                    <c:set var="sum" value="0"/>
                    <c:forEach var="dto" items="${cartList}" varStatus="status">
                        <c:set var="amount" value="${dto.cart_quantity}"/>
                        <c:set var="sum" value="${dto.cartList[0].product_price * amount + sum}"/>
                        <tr>
                            <td style="display: none">${dto.cart_idx}</td>
                            <td>${dto.product_idx}</td>
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
            </div>
            <div id="infoChange">
                <span>상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</span>
            </div>
            <%--            회원정보란--%>
            <table class="table justify-content-center w-50 userInfo table-bordered">
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
                        <input type="text" class="form-control" id="user_name" value="${userDTO.user_name}">
                    </td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td>
                        <input type="text" class="form-control" id="user_phone" value="${userDTO.user_phone}">
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        <input type="text" id="user_email" class="form-control" placeholder="직접입력" value="${userDTO.user_email}">
                    </td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>
                        <div class="d-flex">
                            <div class="col-auto">
                                <button type="button" class="btn btn-light btn-outline-dark btn-outline-secondary mx-2" onclick="sample4_execDaumPostcode()">우편번호</button>
                            </div>
                            <div class="col">
                                <input type="text" id="sample4_postcode" class="form-control" placeholder="우편번호" value="${userDTO.user_post}">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>도로명주소</td>
                    <td>
                        <input type="text" id="sample4_roadAddress" class="form-control" placeholder="도로명주소" value="${userDTO.user_addr1}">
                    </td>
                </tr>
                <tr>
                    <td>지번주소</td>
                    <td>
                        <input type="text" id="sample4_jibunAddress" class="form-control" placeholder="지번주소" value="${userDTO.user_addr2}">
                        <span id="guide" style="color:#999"></span>
                    </td>
                </tr>
                <tr>
                    <td>배송메시지</td>
                    <td>
                        <textarea class="form-control" id="user_comment" placeholder="배송 전 미리 연락바랍니다."></textarea>
                    </td>
                </tr>
                </tbody>
            </table>
            <button type="submit" class="btn btn-light btn-outline-dark  btn-outline-secondary" id="submitCheck">결제하기</button>
        </form>
    </div>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
