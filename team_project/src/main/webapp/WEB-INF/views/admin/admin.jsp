<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Smart 관리</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
	*{margin: 0; padding: 0; font-family: 'Noto Sans KR', sans-serif;}
	a{text-decoration: none; color: white;}
/* 	div{
	   border: 1px solid red;
	} */
	#div_admin{
 	    position: absolute;
 	    background-color: #f5f5f5;
	    width: 100%;
	    height: 100%;
	    z-index: -10;
	    overflow: hidden;
	}
	#div_admin_topBar{
	    background-color: rgb(52, 152, 219);
        width: 100%;
        height: 70px;
        overflow: hidden;
    }
    #div_admin_topBar img,#div_admin_topBar h3{
        float: left;
        line-height: 80px;
        color: white;
    }
    #div_admin_topBar img{
        margin: 15px;
    }
    #div_admin_topMenu{
        float: right;
        /* border: 1px solid black; */
        width: 500px;
        height: 50px;
        margin: 10px;
    }
    #div_admin_topMenu span{
        float: right;
        width: 500px;
        text-align: right;
        font-size: 11px;
        color: white;
        margin-right: 10px;             
    }
    #div_admin_topMenu div{
        float: right;
        /* border: 1px solid white; */
        height: 25px;
        margin-top: 5px;
        font-size: 12px;
    }
    #div_admin_topMenu_btns{
        width: 150px;
    }
    #div_admin_timeout{            
        width: 160px;
    }
    #div_admin_topMenu div *{
        float: left;
        color: white;
        margin: 5px;            
    }
    #div_admin_timeout button{
        background-color: rgb(127, 127, 127);
        margin: 3px;
        font-size: 11px;
        width: 33px;
        height: 20px;
        cursor: pointer;
        border: none;
        border-radius: 5px;
        line-height: 15px;
    }
    #div_admin_sideBar{
        float: left;
        width: 65px;
        height: 100%;
        background-color: rgb(70, 90, 120);
    }
    #div_admin_sideBar div{
        border: 1px solid white;
        width: 50px;
        height: 50px;
        border-radius: 25px;
        margin: 17px 5px;      
        text-align: center;
        color: white;
        overflow: hidden;
    }
    #div_admin_sideBar img{
        width: 30px;
        height: 30px;
        margin-top: 3px;
    }
    #div_admin_sideBar p{
        font-size: 12px;
        margin-top: -6px;
    }
    #div_admin_section{
        float: left;
        background-color: #f5f5f5;
        left: 65px;
        height: 100%;
        width: 100%;
    }    
    
</style>
<script>
	window.onload = function(){
		/* Width/Height 조정 function */
		let adminElement = document.getElementById("div_admin");
		let sideBarElement = document.getElementById("div_admin_sideBar");
		let sectionElement = document.getElementById("div_admin_section");
		let memberElement = document.getElementById("div_right");
		
		function updateWidth(){ //width 자동 조정
			let adminWidth = adminElement.clientWidth;
			let sectionWidth = adminWidth - 65;
			let memberWidth = sectionWidth - 320;
			let tableWidth = memberWidth -18;
			sectionElement.style.width = sectionWidth + "px";
			memberElement.style.width = memberWidth + "px";
		}
		updateWidth(); //초기 Width값 설정
        window.addEventListener("resize", updateWidth); //실시간 Width값 조정
        
        function updateHeight(){ //height 자동 조정
            let adminHeight = adminElement.clientHeight;
            let elementsHeight = adminHeight - 70;            
            let memberHeight = elementsHeight -55;
            sideBarElement.style.height = elementsHeight + "px";
            sectionElement.style.height = elementsHeight + "px";
            memberElement.style.height = memberHeight + "px";
        }
        updateHeight(); //초기 Width값 설정
        window.addEventListener("resize", updateHeight); //실시간 Width값 조정   
        
        
        
	}
</script>
</head>
<body>    
	<div id="div_admin">
	    <div id="div_admin_topBar">
	        <img src="../resources/img/omart_classic_logo.png" alt="">
            <h3>SMART 관리</h3>
            <div id="div_admin_topMenu">
                <span>관리자님</span>
                <div id="div_admin_topMenu_btns">
                    <a href="">메인으로 가기</a><p> | </p>
                    <a href="">로그아웃</a>
                </div>
                <div id="div_admin_timeout">
                    <p>남은시간 01:00:00</p>
                    <button>연장</button>
                </div>
            </div>
	    </div>
	    <div id="div_admin_sideBar">
	        <ul>
	         <li>
	             <div>
	                 <a href="">
		                 <img src="" alt="">
		                 <p>권한</p>
	                 </a>
	             </div>                    
	         </li>
	         <li>
	             <div>
	                 <a href="${pageContext.request.contextPath}/admin/member.do">
                         <img src="" alt="">
                         <p>회원</p>
                     </a>
	             </div>                    
	         </li>
	         <li>
	             <div>
	                 <a href="${pageContext.request.contextPath}/admin/product.do">
                         <img src="" alt="">
                         <p>판매</p>
                     </a>
	             </div>                    
	         </li>
	         <!-- <li>
	             <div>
	                 <a href="">
                         <img src="" alt="">
                         <p>통계</p>
                     </a>
	             </div>                    
	         </li> -->
	         <li>
	             <div>
	                 <a href="">
                         <img src="" alt="">
                         <p>문의</p>
                     </a>
	             </div>                    
	         </li>
	     </ul>
	    </div>
	    <div id="div_admin_section">
	       <c:choose>
	           <c:when test="${status == 'member'}">
	               <jsp:include page="member.jsp"></jsp:include>
	           </c:when>
	           <c:when test="${status == 'product'}">
                   <jsp:include page="product.jsp"></jsp:include>
               </c:when>
	       </c:choose>	        
	    </div>      
	</div>
</body>
</html>