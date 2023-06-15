package util;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

public class JSFunction {

	//메시지 알림창을 띄운 후 명시한 URL로 이동하는 메소드
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script = "<script> "
							+ "alert('"+msg+"'); "
							+ "location.href='"+url+"'; "
							+ "</script>";
			out.print(script);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = "<script> "
							+ "alert('"+msg+"'); "
							+ "history.back(); "
							+ "</script>";
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
