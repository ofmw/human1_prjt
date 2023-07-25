<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		let memberElement = document.getElementById("div_member2");
		
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
        
        /* display: none/block 변환 function */
        let displayBtns = document.querySelectorAll(".display");
        let divShadow = document.getElementById("div_shadow");
        let cancelBtn = document.getElementById("btn_cancel");
        
        displayBtns.forEach((btn) => {
            btn.addEventListener("click", function(){
                divShadow.style.display = "block";
            });
        });
        
        cancelBtn.addEventListener("click", function(){
        	divShadow.style.display = "none";
        	frm_member_edit.reset();
        });
        
	}
</script>
</head>
<body>    
	<div id="div_admin">
	    <div id="div_admin_topBar">
	    
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
	                 <a href="">
                         <img src="" alt="">
                         <p>회원</p>
                     </a>
	             </div>                    
	         </li>
	         <li>
	             <div>
	                 <a href="">
                         <img src="" alt="">
                         <p>판매</p>
                     </a>
	             </div>                    
	         </li>
	         <li>
	             <div>
	                 <a href="">
                         <img src="" alt="">
                         <p>통계</p>
                     </a>
	             </div>                    
	         </li>
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
	        <jsp:include page="admin/member.jsp"></jsp:include>
	    </div>      
	</div>
</body>
</html>