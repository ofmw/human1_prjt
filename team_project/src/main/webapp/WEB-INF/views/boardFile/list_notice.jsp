<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
        *{margin: 0; padding: 0; font-family: 'Noto Sans KR', sans-serif;}
    #div_menu{
        position: relative;
        float: left;
        width: 200px;
        top: 100px;
    }
    #div_menu p{
        padding: 6px 0;
        text-align: center;
        font-size: 20px;
        font-weight: bold;
        border-bottom: 3px solid black;
    }
    #div_menu ul{
        list-style: none; /* 기본 불릿 스타일 제거 */
        display: flex;
        flex-direction: column; /*세로 방향으로 정렬*/
        text-align: center;
    }
    #div_menu li{
        padding: 12px 0;
        cursor: pointer;
    }
    #div_menu ul li:nth-child(2){
        background-color: black;
        color: white;
    }
    #cs_info{
        position: absolute;
        bottom: 0;
        left: 0;
        padding-left: 10px;
        padding-top: 10px;
        border-top: 3px solid black;
        font-size: 23px;
        width: 100%;
        height: 80px;
    }
    #cs_info span{
        font-size: 17px;
        color: rgb(224, 224, 224);
    }
    #div_faq{
        position: relative;
        margin-bottom: 50px;
        float: left;
        top: 80px;
        left: 50%;
        transform: translateX(-70%); /* 중앙 정렬을 위한 설정 */
        width: 758px;
    }
    #div_faq p{
        font-size: 28px;
        font-weight: bold;
        padding-bottom: 30px;
    }
    #div_faq ul{
        list-style: none;
        margin-bottom: 50px;
    }
    #div_faqMenu{
        font-size: 0;/* 자식객체에 inline-block 하면 여백 남는거 해결방법 */
    }
    #div_faqMenu li{
        display: inline-block;
        margin-bottom: 20px;
        padding: 10px 0;
        width: 378px;
        text-align: center;
        border: 1px solid black;
        border-left: none;
        font-size: 19px;
        cursor: pointer;
    }
    #div_faqMenu ul li:nth-child(1){
        background-color: black;
        color: white;
    }
    #div_faqContent li{
        margin-top: 20px;
        width: 758px;
        height: 50px;
        font-size: 18px;
        border-bottom: 1px solid rgb(224, 224, 224);
        line-height: 30px;
    }
    #div_faqContent p{
        float: right;
        font-size: 13px;
        cursor: pointer;
    }
    #div_faqContent div{
        padding: 20px;
        background-color: rgb(224, 224, 224);
    }
    .close{
        display: none;
        position: relative;
        padding: 10px;
    }


</style>
<script>
    window.onload = function () {
        let faqSees = document.querySelectorAll(".faq_see")
        let contents = document.querySelectorAll(".close");


        for(let i=0; i<faqSees.length; i++){
            faqSees[i].addEventListener("click", function () {    
                
                if (!contents[i].classList.contains("close")) {
                    contents[i].classList.add("close");
                    return;
                }  
                
                // 모든 FAQ 닫기
                for(let j=0; j<contents.length; j++){
                    contents[j].classList.add("close");
                }
                                    
                contents[i].classList.remove("close");
                
            });
        };
    };
</script>
<body>
    <div id="div_menu">
        <p>고객센터</p>
        <ul>
            <li onclick="location.href='list_faq_member.html'">FAQ</li>
            <li onclick="location.href='list_notice.do'">공지사항</li>
            <li onclick="location.href='list_event.html'">이벤트</li>
            <li onclick="location.href='list_inquiry.do'">1:1문의하기</li>
        </ul>
    </div>

    <div id="div_faq">
        <p>공지사항</p>
            <div id="div_faqMenu">
                <ul>
                    <li onclick="location.href='list_notice.html'">공지사항</li>
                    <li onclick="location.href='list_notice_event.html'" style="border-right: none;">이벤트 당첨자 발표</li>
                </ul>
            </div>
            <div id="div_faqContent">
                <ul>
                    <li>[Omart] 메인서비스 점검 안내<p class="faq_see">보기</p></li>
                    <div class="close">
                        안녕하세요.
                        신세계적 쇼핑포털 SSG.COM 입니다.
                        보다 안정적이고 편리한 서비스 제공을 위해 아래와 같이 사이트 점검이 진행될 예정입니다.
                        해당 점검시간에는 사이트 접속이 어려우니 고객님의 너그러운 양해 부탁드립니다.
                        감사합니다.
                        ○ 점검 일시 : 2023년 7월 23일 일요일 02:00 ~ 07:00 (5시간)
                        ○ 점검 대상 : SSG.COM몰
                        ○ 점검 내용 : 데이터 마이그레이션
                        ○ 영향 범위 : SSG.COM 전체 웹 서비스 이용 중지
                    </div>
                    <li>[Omart] Omart사칭사이트 주의 안내<p class="faq_see">보기</p>
                    </li>
                    <div class="close">
                        최근 SSG.COM을 사칭하는 사이트들이
                        발견되어 고객 여러분께 안내드립니다.
                        [사칭 사이트 리스트]
                        shinsegaebestmall.com
                        shinsegaebestshop.com
                        ssgmalls.com
                        ssgs.shop
                        ssgmallshop.com
                        qorwngks33.cafe24.com
                        emartmallshop.com
                        www.ssgbiz.co.kr
                        ssgoutlets.co.kr
                        emartbest.com
                        해당 사이트는 당사와 무관하며, 
                        SSG.COM을 사칭하는 사이트를 발견하시는 경우
                        SSG.COM고객센터(1577-3419)에 확인하시어
                        피해가 발생하지 않도록 각별한 주의 부탁드립니다.
                        감사합니다.
                    </div>
                    <li>[Omart] Omart 개인정보처리방침 개정 안내 [개정일 : 2023.06.21]<p class="faq_see">보기</p>
                    </li>
                    <div class="close">
                        안녕하세요.
                         신세계적 쇼핑포털 SSG.COM입니다.                   
                        2023년 6월 21일부로 SSG.COM 개인정보처리방침이 개정되어 아래와 같이 안내해 드립니다.                       
                        1. 개정사유
                         - 쓱배송 원데이 서비스 관련 개인정보 처리위탁 업무 추가                         
                        2. 개정내용
                         - 제 5조 수집한 개인정보의 처리 위탁 수탁자 추가                         
                        고객님께서 개정일까지 거부의사(회원탈퇴)를 표시하지 않으시는 경우, 본 개인정보 처리방침에 동의하신 것으로 봅니다.                         
                        앞으로도 고객님의 즐겁고 편안한 쇼핑을 위하여 더욱 노력하겠습니다.                         
                        감사합니다.
                    </div>
                    <li>[Omart] Omart 위치기반서비스 이용약관 개정 안내 [개정일 : 2023.06.21]<p class="faq_see">보기</p>
                    </li>
                    <div class="close">
                        안녕하세요. 
                        신세계적 쇼핑포털 SSG.COM입니다.                        
                        2023년 4월 26일 위치기반서비스 이용약관 개정을 안내해 드립니다.                        
                        1. 개정사유
                        - 이마트몰 상호 변경 
                        - 위치기반서비스 약관에 동의하는 자의 정의(개인위치정보주체)에 따른 전반적 정책 정비                         
                        2. 개정내용
                        -  위치기반서비스 이용약관 전부개정 내용 확인하기                        
                        개인위치정보주체가 개정일까지 거부의사(배송기사앱 '미동의'선택)를 표시하지 않으시는 경우, 본 이용약관 개정에 동의하신 것으로 봅니다.                        
                        앞으로도 고객님의 즐겁고 편안한 쇼핑을 위하여 더욱 노력하겠습니다.                        
                        감사합니다.
                    </div>
                </ul>
            </div>
			<a href="list_notice_write.do"><button id="btn_write">글등록</button></a>
			
    </div>

    <div>

    </div>
      <p id="cs_info">고객센터 이용안내 <span>운영시간09:00~21:00</span></p>
</body>
</html>