<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>

<link rel="stylesheet" href="../resources/css/join_jsp.css" />

<script type="text/javascript" src="../resources/js/check.js"></script>

<%
	String dis = "none";
%>
<c:set var="dis" value="<%= dis %>"></c:set>

<style>

</style>
<body>
    <form action="join_process.jsp" method="post" name="frm" autocomplete=off>
        <table>
            <img src="../resources/img/logo.png" alt="">
            <tr>
                <td>
                    <p>아이디</p>
                    <input type="text" id="m_id" name="m_id">
                    <input type="button" id="btn_checkId" name="aNum" value="중복확인" onclick=""><br><br>
                    <p style="display:"${dis}>이미 사용중인 아이디입니다.</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>비밀번호</p>
                    <input type="password" name="m_pw">
                </td>
            </tr>
            <tr>
                <td>
                    <p>비밀번호 재확인</p>
                    <input type="password" name="pwCheck" id="pwCheck">
                    <p name="hdn_msg_pwC" id="hdn_msg_pwC">비밀번호가 일치하지 않습니다.</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>이름</p>
                    <input type="text" name="m_name">
                </td>
            </tr>
            <tr>
                <td id="born">
                    <p>생년월일</p>
                    <input type="text" name="birth" placeholder="생년월일(8자)">
                </td>
            </tr>
            <tr>
                <td>
                    <p>성별</p>
                    <select name="gender" id="gender">
                        <option value="0">성별</option>
                        <option value="1">남자</option>
                        <option value="2">여자</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <p>본인 확인 이메일</p>
                    <input type="text" placeholder="선택입력" name="email">
                </td>
            </tr>
            <tr>
                <td id="sel">
                    <p>휴대전화</p>
                    <select name="selNum" id="selNum">
                        <option value="0">대한민국 +82</option>
                    </select>
                    <input type="text" id="inputNum" name="inputNum" placeholder="전화번호 입력">
                    <input type="button" id="numButton" name="aNum" value="인증번호 받기" onclick="getANum()">
                    <input type="text" id="inputANum" name="inputANum" placeholder="인증번호 입력하세요" disabled="true">
                </td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td>
                    <input type="reset" id="reset" value="취소하기">
                    <input type="button" id="create" value="가입하기" onclick="addCheck()">
                </td>
            </tr>
        </table>
    </form>

</body>

</html>