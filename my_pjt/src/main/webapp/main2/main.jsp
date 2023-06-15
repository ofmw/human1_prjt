<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<style>
/*         div{
            border: 1px solid gray; 
            border-collapse: collapse;
        } */
        #div_main{
            width: 1250px;
            height: 650px;
            box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }
        #div_main div{
            float: left;
            margin-left:3.5px;
            margin-right:3.5px;
        }
        .div_m_content{
            width: 400px;
            height: 650px;
        }
        .div_rowLine{
            width: 1px;
            height: 500px;
            background-color: gray;
            margin-top: 80px;
        }
        .div_m_content h3{
            margin: 30px;
        }
    </style>
<body>
    <div id="div_main">
        <div class="div_m_content">
            <a href="">
            	<h3>IT News ></h3>
            </a>
        </div>
        <div class="div_rowLine"></div>
        <div class="div_m_content">
            <a href="">
                <h3>Notice ></h3>
            </a>
        </div>
        <div class="div_rowLine"></div>
        <div class="div_m_content">
            <a href="">
                <h3>LearnCoding ></h3>
            </a>
        </div>
    </div>
    
</body>
</html>