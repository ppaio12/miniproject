<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="webjars/jquery/3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">

    // PW 일치 확인
    $(document).ready(function () {
        var submitCheck = false;

        $("#user_pw2").on("keyup", function () {
            var user_pw = $("#user_pw").val();
            var user_pw2 = $("#user_pw2").val();
            var mesg = "비밀번호가 일치합니다";

            if (user_pw != user_pw2) {
                mesg = "비밀번호가 일치하지 않습니다";
            }
            $("#pwdcheck").text(mesg);
        });

        // 아이디 중복체크
        $("#idDupulicatedcheck").on("click", function (event) {
            event.preventDefault();
            $.ajax({
                method: "GET",
                url: "/shoppingMall/idCheck",
                dataType: "text",
                data: {
                    user_id: $("#user_id").val()
                },
                success: function (data, status, xhr) {
                    $("#idcheck").text(data);
                    if (data === '사용 가능한 ID입니다') {
                        $("#user_id").attr("readonly", true);
                        submitCheck = true;
                    }
                },
                error: function (xhr, status, error) {
                    console.log(error);
                }
            });
        });
        $("#submitForm").on("submit", function (event) {
            if (!submitCheck) {
                event.preventDefault();
                alert("아이디 중복을 먼저 확인해주세요.");
            }
        });
    });

</script>

<div class="titleArea">
    <h2></h2>
</div>
<hr>

<div class="container">
    <form:form class="row g-3 m-4" modelAttribute="userDTO" method="post" id="submitForm">
        <div class="row mb-2">
            <div class="col-3"></div>
            <label for="user_id" class="col-sm-2 col-form-label">아이디*</label>
            <div class="col-auto">
                <form:input type="text" class="form-control" path="user_id" id="user_id"/>
                <form:errors path="user_id" cssStyle="color: #dc3545"></form:errors>
            </div>
            <div class="col-auto">
                <button type="button" class="btn btn-light btn-outline-dark  btn-outline-secondary mb-3"
                        id="idDupulicatedcheck">아이디중복
                </button>
            </div>
            <div class="col-auto">
                <span id="idcheck" class="fs-6"></span>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-3"></div>
            <label for="user_pw" class="col-sm-2 col-form-label">비밀번호*</label>
            <div class="col-auto">
                <form:input type="password" class="form-control" path="user_pw" name="user_pw" id="user_pw"/>
                <form:errors path="user_pw" cssStyle="color: #dc3545"></form:errors>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-3"></div>
            <label for="user_pw2" class="col-sm-2 col-form-label">비밀번호확인*</label>
            <div class="col-auto">
                <input type="password" class="form-control" name="user_pw2" id="user_pw2"/>
            </div>
            <div class="col-sm-3">
                <span id="pwdcheck" class="fs-6"></span>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-3"></div>
            <label for="user_name" class="col-sm-2 col-form-label">이름*</label>
            <div class="col-auto">
                <form:input type="text" class="form-control" path="user_name"/>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-3"></div>
            <label for="user_phone" class="col-sm-2 col-form-label">전화번호*</label>
            <div class="col-auto">
                <label for="user_phone" class="visually-hidden">전화번호</label>
                <form:input type="text" class="form-control" path="user_phone"/>
                <form:errors path="user_phone" cssStyle="color: #dc3545"></form:errors>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-3"></div>
            <label for="user_email" class="col-sm-2 col-form-label">이메일*</label>
            <div class="col-auto">
                <label for="user_email" class="visually-hidden">이메일</label>
                <form:input type="email" path="user_email" class="form-control" placeholder="직접입력"/>
                <form:errors path="user_email" cssStyle="color: #dc3545"></form:errors>
            </div>
        </div>
        <hr>
        <div class="row mb-3">
            <div class="col-3"></div>
            <div class="col-auto">
                <label for="sample4_postcode" class="visually-hidden">post</label>
                <form:input type="text" path="user_post" class="form-control" id="sample4_postcode" placeholder="우편번호"/>
                <form:errors path="user_post" cssStyle="color: #dc3545"></form:errors>
            </div>
            <div class="col-auto">
                <button type="button" class="btn btn-light btn-outline-dark  btn-outline-secondary mb-3"
                        onclick="sample4_execDaumPostcode()">우편번호 찾기
                </button>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-3"></div>
            <div class="col-sm-5">
                <label for="sample4_roadAddress" class="visually-hidden">도로명주소</label>
                <form:input type="text" path="user_addr1" class="form-control" id="sample4_roadAddress" placeholder="도로명주소"/>
                <form:errors path="user_addr1" cssStyle="color: #dc3545"></form:errors>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-3"></div>
            <div class="col-sm-5">
                <label for="sample4_jibunAddress" class="visually-hidden">지번주소</label>
                <form:input type="text" path="user_addr2" class="form-control" id="sample4_jibunAddress" placeholder="지번주소"/>
                <form:errors path="user_addr2" cssStyle="color: #dc3545"></form:errors>
                <span id="guide" style="color:#999"></span>
            </div>
        </div>
        <hr>
        <div class="col-12">
            <button type="submit" class="btn btn-light btn-outline-dark  btn-outline-secondary" id="submitCheck">회원가입
            </button>
            <button type="reset" class="btn btn-light btn-outline-dark  btn-outline-secondary" onclick="history.back()">
                취소
            </button>
        </div>
    </form:form>
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
