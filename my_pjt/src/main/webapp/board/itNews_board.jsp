<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    *{margin: 0; padding: 0;}
    fieldset{
        margin: 30px;
        padding: 20px;
    }
    fieldset *{
	   font-family: Consolas, monospace;
	   line-height: 30px;
    }
    legend{
        font-size: 20px;
        font-weight: bold;
    }
    
    #tbl_IT img{
        width: 150px;
        height: 100px;
    }
    #tbl_IT a{
        font-family: Consolas, monospace;
        font-size: 17px;
    }
    #tbl_IT p{
        font-weight: normal;
    }    
    
</style>
<body>
    <fieldset>
        <legend>IT News</legend>
        <table id="tbl_IT">
        	<tr>
        		<td>
        		  <img alt="" src="../resources/img/apple.jpg">
        		</td>
        		<td>
        		  <a href="">애플 '비전 프로' 생태계 확대 나선다...개발자 키트 공개</a>
        		  <p>애플이 혼합현실(MR) 헤드셋 '비전 프로' 앱 개발자 키트를 곧 공개할 전망이다...</p>
        		</td>
        	</tr>
        	<tr>
        		<td>
                    <img alt="" src="../resources/img/KT.jpg">
                </td>
        		<td>
                  <a href="">KT, 토종 ICT 혁신기업 유럽 진출 돕는다</a>
                  <p>KT가 유럽 최대 규모 스타트업 박람회에서 국내 대표 정보통신기술(ICT) 기업의 해외 진출을 지원...</p>
                </td>
        	</tr>
        	<tr>
                <td>
                    <img alt="" src="../resources/img/meta.jpg">
                </td>
                <td>
                  <a href="">메타휴먼 ‘한유아’, ‘다정한 비인간’ 출간…우다영 작가와의 수다집</a>
                  <p>스마일게이트의 메타휴먼 한유아가 신간 ‘다정한 비인간: 메타휴먼과의 알콩달콩 수다’...</p>
                </td>
        	</tr>
        </table>
            
        </div>
    </fieldset>
</body>
</html>