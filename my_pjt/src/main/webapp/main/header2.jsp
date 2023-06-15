<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<style>
    *{margin: 0; padding: 0;}
    #div_logo{
        position: absolute;
        border: 1px solid gray;
        border-collapse: collapse;
        height: 80px;
        width: 300px;
        text-align: center;
    }
    #div_logo img{
        margin-top: 7px;
        margin-left: -30px;
    }
    #div_banner{
        position: absolute;
        border: 1px solid gray;
        border-collapse: collapse;
        left:300px;
        height: 280px;
        width: 970px;
        overflow: hidden;
        background-image: url("../resources/img/main_visual.png");
        background-size: cover;
    }
    #div_menu{
        float: left;
/*         border: 1px solid gray; */
        border-collapse: collapse;
        height: 80px;
        width: 970px;
        background-color: rgba(100, 100, 100, 0.5)
    }
    #div_menu div{
        float: left;
/*         border: 1px solid gray; */
        border-collapse: collapse;
        width: 130px;
        margin-left: 60px;
    }
    a{
        font-family: Consolas, monospace;
	    font-size: 20px;
	    line-height: 80px;
	    text-decoration: none;
	    font-weight: bold;
	    color: black;
    }
    #div_account{
        position: absolute;
        border: 1px solid gray;
        border-collapse: collapse;
        top: 80px;
        height: 200px;
        width: 300px;
    }
    #tbl_account{
        float: left;
        margin-left: 10px;
        margin-top: 60px;
    }
    #tbl_account tr, td{
/*      border: 1px solid gray; */
        font-family: Consolas, monospace;
        font-size: 14px;
        font-weight: bold;
        line-height: 25px;
    }
    #member_id, #member_pw{
        float: right;
        height: 25px;
        padding-left: 5px;
    }
    #btn_login{
        width: 60px;
        height: 60px;
        font-family: Consolas, monospace;
        font-size: 17px;
        font-weight: bold;
        cursor: pointer;
    }
    #div_account a{
        font-size: 12px;
        line-height: 14px;
        margin: 35px;
    }
    #div_option{
        float: left;
        height: 200px;
        width: 970px;
/*         border: 1px solid gray; */
        border-collapse: collapse;
        background-color: rgba(100, 100, 100, 0.5);
        display: none;
        overflow: hidden;
    }
    #div_option div{
        float: left;
/*         border: 1px solid gray; */
        width: 130px;
        height: 200px;
        margin-left: 60px;
    }
    #div_option a{
        font-size: 15px;
        margin: 0px 0px;
        line-height: 50px;
    }
    #div_banner .up {
        height: 0px;
        animation-name: slide_up;
        animation-duration: 0.5s;
    }

    #div_banner .down {
        height: 200px;
        animation-name: slide_down;
        animation-duration: 0.5s;
    }

    @keyframes slide_up {
        0% {
            height: 200px;
        }

        100% {
            height: 0px;
        }
    }

    @keyframes slide_down {
         0% {
            height: 0px;
        }

        100% {
            height: 200px;
        }
    }
</style>

<script>
    window.onload = function(){
        let div_menu = document.getElementById("div_menu");
        let div_option = document.getElementById("div_option");
        let div_banner = document.getElementById("div_banner");
        let section = document.getElementById("section");
        let div_logo = document.getElementById("div_logo");
        let div_account = document.getElementById("div_account");
        
        
        div_menu.onmouseover = function(){
            div_option.style.display = "block";
            div_option.classList.remove("up");
            div_option.classList.add("down");
        }
        div_logo.onmouseover = function(){
            div_option.classList.remove("down");
            div_option.classList.add("up");
        }
        div_account.onmouseover = function(){
            div_option.classList.remove("down");
            div_option.classList.add("up");
        }
        section.onmouseover = function(){
            div_option.classList.remove("down");
            div_option.classList.add("up");
        }
    }
</script>

<body>
    <div id="div_logo">
        <a href="../index.jsp"><img src="../resources/img/logo.png" alt=""></a>
    </div>
    <div id="div_account">
        <table id="tbl_account">
            <tr>
                <td>
                  ID&nbsp;&nbsp;<input type="text" name="member_id" id="member_id" autocomplete="off"/>         
                </td>
                <td rowspan="2">
                  <input type="button" value="Login" id="btn_login"/>
                </td>
            </tr>
            <tr>
                <td>
                   PW&nbsp;&nbsp;<input type="password" name="member_pw" id="member_pw" autocomplete="off"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                  <a href="">회원가입</a>
                  <a href="">ID/PW 찾기</a>
                </td>
            </tr>
        </table>
    </div>
    <div id="div_banner">    
	    <div id="div_menu">
	       <div><a href="../news/notice.jsp">News</a></div>
	       <div><a href="../learncoding/qa.jsp">LearnCoding</a></div>
<!-- 	       <div><a href="../main/commercial.jsp">Commission</a></div> -->
<!-- 	       <div><a href="../main/download.jsp">Download</a></div> -->
	       <div><a href="../main/ranking.jsp">Ranking</a></div>
	    </div>
	    <div id="div_option" class="up">
	        <div>
	           <a href="../news/notice.jsp">Notice</a><br>
	           <a href="../news/itNews.jsp">IT News</a>
	        </div>
            <div>
               <a href="../learncoding/qa.jsp">Q&A</a><br>
               <a href="../learncoding/editCode.jsp">Edit Code</a><br>
               <a href="../learncoding/qa.jsp">Preset</a>
            </div>
<!--             <div>
               <a href="">Commercial</a><br>
               <a href="">non-Commercial</a>
            </div> -->
            <div></div>
            <div></div>
	    </div>
    </div>
</body>
</html>