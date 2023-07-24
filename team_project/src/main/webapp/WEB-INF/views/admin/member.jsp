<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        #div_admin_elmt1, #div_admin_elmt2{            
            /* border: 1px solid green; */
            height: 100%
        }
        #div_admin_elmt1{
            position: absolute;
            left: 65px;
            width: 300px;
            background-color: #f5f5f5;
            z-index: -1;
        }
        #div_admin_elmt1 h3{
            margin-left: 15px;
            margin-top: 8px;
        }
        #div_admin_elmt1 table{
            border: 1px solid lightgray;
            border-collapse: collapse;
            margin-left: 15px;
            margin-top: 5px;
            width: 250px;
        }
        #div_admin_elmt1 tr:nth-child(odd) td{
            border: 1px solid lightgray;
            height: 27px;
            font-size: 14px;
            font-weight: bold;
            padding-left: 7px;
        }
        #div_admin_elmt1 tr:nth-child(even) td{
            background-color: white;
            font-size: 13px;
            line-height: 25px;
            padding: 7px 15px;
        }
        #div_admin_elmt1 input{
            float: left;
            margin-top: 6px;
        }
        #div_admin_elmt1 label{
            display: block;
            float: left;
            height: 20px;
            margin-left: 7px;
        }
        #div_admin_elmt2{
            float: right;
            width: 100%;
            background-color: #f5f5f5;
        }
        #div_admin_elmt2 div{
            overflow: auto;
        }
        #div_admin_elmt2 table{
            border: 1px solid lightgray;
            border-collapse: collapse;
            max-width: none;
        }
        #div_admin_elmt2 td{
            border: 1px solid lightgray;
        }
        #div_admin_elmt2 tr:first-child td{
            width: 100px;
            height: 30px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            background-color: #f5f5f5;
        }

        #test{
            float: right;
            margin: 40px 20px;
            width: 100%;
            height: 500px;
            background-color: white;
            border: 1px solid lightgray;            
        }
</style>
<script>
    window.onload = function(){
        let baseElement = document.getElementById("div_admin")
        let sideElement = document.getElementById("div_admin_sideBar")
        let parentElement1 = document.getElementById("div_admin_elmt1")
        let parentElement2 = document.getElementById("div_admin_elmt2")
        let childElement = document.getElementById("test");

        function updateWidth(){
            let baseWidth = baseElement.clientWidth;
            let parentWidth = baseWidth - 340;
            let childWidth = parentWidth - 40;
            parentElement2.style.width = parentWidth + "px";
            childElement.style.width = childWidth + "px";
        }            
        updateWidth(); //초기 Width값 설정
        window.addEventListener("resize", updateWidth); //실시간 Width값 조정

        function updateHeight(){
            let baseHeight = baseElement.clientHeight;
            let parentHeight = baseHeight - 70;
            let childHeight = parentHeight - 60;
            sideElement.style.height = parentHeight + "px";
            parentElement1.style.height = parentHeight + "px";
            parentElement2.style.height = parentHeight + "px";
            childElement.style.height = childHeight + "px";
        }            
        updateHeight();
        window.addEventListener("resize", updateHeight);
    };
</script>
</head>
<body>
    <div id="div_admin_elmt1">
            <h3>회원관리</h3>
            <table>
                <tr>
                    <td>상태</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" id="checkbox1_1"><label for="checkbox1_1"> 활성</label><br>
                        <input type="checkbox" id="checkbox1_2"><label for="checkbox1_2"> 휴면</label><br>
                        <input type="checkbox" id="checkbox1_3"><label for="checkbox1_3"> 탈퇴</label><br>
                    </td>
                </tr>
                <tr>
                    <td>등급</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" id="checkbox2_1"><label for="checkbox2_1"> 브론즈</label><br>
                        <input type="checkbox" id="checkbox2_2"><label for="checkbox2_2"> 실버</label><br>
                        <input type="checkbox" id="checkbox2_3"><label for="checkbox2_3"> 골드</label><br>
                    </td>
                </tr>
                <tr>
                    <td>성별</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" id="checkbox3_1"><label for="checkbox3_1"> 남자</label><br>
                        <input type="checkbox" id="checkbox3_2"><label for="checkbox3_2"> 여자</label><br>
                    </td>
                </tr>
            </table>
        </div>
        <div id="div_admin_elmt2">
            <div id="test">
                <table>
                    <tr>
                        <td>컬럼1</td>
                        <td>컬럼2</td>
                        <td>컬럼3</td>
                        <td>컬럼4</td>
                        <td>컬럼5</td>
                        <td>컬럼6</td>
                        <td>컬럼7</td>
                        <td>컬럼8</td>
                        <td>컬럼9</td>
                        <td>컬럼10</td>
                    </tr>
                    <tr>
                        <td>값1</td>
                        <td>값1</td>
                        <td>값1</td>
                        <td>값1</td>
                        <td>값1</td>
                        <td>값1</td>
                        <td>값1</td>
                        <td>값1</td>
                        <td>값1</td>
                        <td>값1</td>
                    </tr>
                </table>
            </div>

        </div>    
</body>
</html>