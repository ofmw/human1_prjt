<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>footer</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
        *{margin: 0; padding: 0; font-family: 'Noto Sans KR', sans-serif;}

        #div_footer {
            position: relative;
            display: flex;
            flex-direction: column;
            width: 100%;
            min-width: 1280px;
            height: 280px;
            bottom: 0px;
        }
        #wrap{
            display: flex;
            flex-direction: column;
            align-items: center;

            width: 100%;
        }
        #wrap2{
            width: 1280px;
            padding-left: 45px;
        }
        #div_footer_menu_box {
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 50px;
            width: 100%;
            background-color: rgb(250, 250, 250);
            border-top: 1px solid rgb(220, 220, 220);
            border-bottom: 1px solid rgb(220, 220, 220);
            user-select: none;
        }
        #div_footer_menu{
            display: flex;
            width: 1280px;
            padding-left: 30px;
        }
        #div_footer_menu div{
            display: flex;
        }
        #div_footer_menu div:not(#div_footer_menu div:first-child)::before{
            background-color: #e1e5e9;
            content: "";
            width: 1px;
            height: 12px;
            display: block;
            margin-top: 20px;
        }
        a {
            text-decoration: none;
        }
        #div_footer_menu a{
            margin: 0 15px;
            line-height: 50px;
            font-size: 14px;
            color: #222;
        }
        #div_support {
            /* width: 1280px; */
            height: 80px;
            /* padding-left: 10px; */
            padding-top: 10px;
        }
        #div_support p {
            float: left;
        }
        #div_support span {
            line-height: 40px;
            font-size: 17px;
            font-weight: bold;
        }
        #div_support input {
            margin-left: 7px;
            width: 60px;
            height: 23px;
            font-size: 12px;
            font-weight: bold;
            text-align: left;
            background-color: white;
            border-radius: 3px;
            cursor: pointer;
        }
        #div_support input[type="button"]{
            text-align: center;
        }
        #div_business_info {
            height: 100px;
            /* width: 1280px; */
            /* padding-left: 10px; */
        }
        #div_business_info *{
            color: gray;
        }
        #div_business_info span {
            font-size: 13px;
        }
        #div_business_info p {
            font-size: 10px;
        }
    </style>
</head>
<body>

    <div id="div_footer">
        <div id="wrap">
            <div id="div_footer_menu_box">
                <div id="div_footer_menu">
                    <div><a href="">회사소개</a></div>
                    <div><a href="">공지사항</a></div>
                    <div><a href="">이벤트</a></div>
                    <div><a href="">개인정보처리방침</a></div>
                    <div><a href="">이용약관</a></div>
                    <div><a href="">청소년보호방침</a></div>
                </div>
            </div>
            <div id="wrap2">
                <div id="div_support">
                    <span>(주)오마트닷컴</span><br>
                    <p>0000-0000</p>
                    <input type="button" value="1:1문의" onclick="location.href='${pageContext.request.contextPath}/boardFile/inquiry.do';"/>
                    <input type="button" value="고객센터" onclick="location.href='${pageContext.request.contextPath}/boardFile/faq_member.do';">
                </div>
                <div id="div_business_info">
                    <span>대표자:홍길동 천안시 동남구 대흥로 215 사업자등록번호: 000-00-00000 통신판매업 신고번호:제2023-서울강남-00000호</span><br>
                    <span>개인정보보호책임자: 김길동 Fax: 041-0000-0000  omart@omart.com</span><br><br>
                    <p>OMART.COM 호스팅서비스 사업자:(주)오마트닷컴</p>
                    <p>(주)오마트닷컴 사이트의 상품/판매자/쇼핑정보,컨텐츠,UI 등에 대한 무단 복제,전송,배포,스크래핑 등의 혐위는 저작권법,콘텐츠사업 진흥법 등에 의하여 엄격히 금지됩니다.</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>