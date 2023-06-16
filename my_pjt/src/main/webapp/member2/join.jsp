<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>

<link rel="stylesheet" href="../resources/css/join_jsp.css?v=12345" />

<script type="text/javascript" src="../resources/js/check2.js"></script>

<body>
    <form action="join_process.jsp" method="post" name="frm" autocomplete=off>
        <table>
            <img src="../resources/img/logo.png" alt="">
            <tr>
                <td>
                    <p>아이디(이메일)</p>
                    <input type="email" id="m_id" name="m_id" placeholder="이메일 주소">
                    <input type="button" id="btn_checkId" value="중복확인" onclick="checkId()">
                    <input type="hidden" name="confirm_id">
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
                <td id="sel">
                    <p>휴대전화</p>
                    <select name="nation" id="nation">
                        <option value="0">대한민국 +82</option>
                    </select>
                    <input type="text" id="selNum" name="selNum" placeholder="전화번호 입력">
                    <input type="button" id="btn_aNum" name="btn_aNum" value="인증번호 받기" onclick="getANum()">
                    <input type="text" id="inputANum" name="inputANum" placeholder="인증번호 입력" disabled="true">
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