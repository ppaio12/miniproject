<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="webjars/jquery/3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">

    // PW 일치 확인
    $(document).ready(function() {
        $("#user_pw2").on("keyup", function() {
            var user_pw = $("#user_pw").val();
            var user_pw2 = $("#user_pw2").val();
            var mesg = "비밀번호가 일치합니다";

            if(user_pw != user_pw2) {
                mesg = "비밀번호가 일치하지 않습니다";
            }
            $("#pwdcheck").text(mesg);
        });

        $("#idDupulicatedcheck").on("click", function(event) {
            event.preventDefault();
            $.ajax({
                method: "GET",
                url: "/shoppingMall/idCheck",
                dataType: "text",
                data: {
                    user_id: $("#user_id").val()
                },
                success: function(data, status, xhr) {
                    $("#idcheck").text(data);
                },
                error: function(xhr, status, error) {
                    console.log(error);
                }
            });
        });
    });

</script>
<div class="container">
    <form:form class="row g-3 m-4" modelAttribute="UserDTO" method="post">
        <div class="row mb-3">
            <label for="user_id" class="col-sm-2 col-form-label">*아이디</label>
            <div class="col-auto">
                <form:input type="text" class="form-control" path="user_id" id="user_id"/>
            </div>
            <div class="col-auto">
                <button type="button" class="btn btn-primary mb-3" id="idDupulicatedcheck">아이디중복</button>
            </div>
            <div class="col-sm-3">
                <span id="idcheck" class="fs-5" style="font-size: 15px"></span>
            </div>
        </div>
        <div class="row mb-3">
            <label for="user_pw" class="col-sm-2 col-form-label">*비밀번호</label>
            <div class="col-auto">
                <form:input type="password" class="form-control" path="user_pw" id="user_pw"/>
                <form:errors path="user_pw"></form:errors>
            </div>
        </div>
        <div class="row mb-3">
            <label for="user_pw2" class="col-sm-2 col-form-label">비밀번호확인</label>
            <div class="col-auto">
                <input type="password" class="form-control" name="user_pw2" id="user_pw2"/>
            </div>
            <div class="col-sm-3">
                <span id="pwdcheck" class="fs-5"></span>
            </div>
        </div>
        <div class="row mb-3">
            <label for="user_name" class="col-sm-2 col-form-label">이름</label>
            <div class="col-auto">
                <form:input type="text" class="form-control" path="user_name"/>
            </div>
        </div>
        <div class="row mb-3">
            <label for="user_birth" class="col-sm-2 col-form-label">생년월일</label>
            <div class="col-auto">
                <input type="date" class="form-control small-input" name="user_birth" id="user_birth" style="width: 150px; height: 30px; font-size: 12px;">
            </div>
        </div>
        <div class="row mb-3">
            <label for="user_phone" class="col-sm-2 col-form-label">전화번호</label>
            <div class="col-auto">
                <label for="user_phone" class="visually-hidden">전화번호</label>
                <input type="text" name="user_phone" class="form-control" id="user_phone">
            </div>
        </div>
        <div class="row mb-3">
            <label for="user_email" class="col-sm-2 col-form-label">이메일</label>
            <div class="col-auto">
                <label for="user_email" class="visually-hidden">이메일</label>
                <input type="text" name="user_email" class="form-control" id="user_email" placeholder="직접입력">
            </div>
        </div>
        <hr>
        <div class="row mb-3">
            <div class="col-auto">
                <label for="sample4_postcode" class="visually-hidden">post</label>
                <input type="text" name="user_post" class="form-control" id="sample4_postcode" placeholder="우편번호">
            </div>
            <div class="col-auto">
                <button type="button" class="btn btn-primary mb-3" onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-sm-5">
                <label for="sample4_roadAddress" class="visually-hidden">도로명주소</label>
                <input type="text" name="user_addr1" class="form-control" id="sample4_roadAddress" placeholder="도로명주소">
            </div>
            <div class="col-sm-5">
                <label for="sample4_jibunAddress" class="visually-hidden">지번주소</label>
                <input type="text" name="user_addr2" class="form-control" id="sample4_jibunAddress" placeholder="지번주소">
                <span id="guide" style="color:#999"></span>
            </div>
        </div>
        <hr>
        <div class="col-12">
            <button type="submit" class="btn btn-primary">Sign in</button>
            <button type="reset" class="btn btn-primary">cancel</button>
        </div>
    </form:form>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var fullRoadAddr = data.roadAddress;
                var extraRoadAddr = '';

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                if(data.autoRoadAddress) {
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
