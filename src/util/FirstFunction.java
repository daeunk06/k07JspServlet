package util;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

public class FirstFunction {

	public static void srcGuGudan(JspWriter out) {
		try{
			out.print("<table border='1'>");
			for(int dan=2; dan<=9; dan++){
					//수만큼 반복
				out.print("<tr>");
				for(int su=1; su<=9; su++){
					out.println("<td>"+dan+"*"+su+"="+(su*dan)+"</td>");
				}
				out.print("</tr>");
			}
			out.print("</table>");
		}
		catch(IOException e){
			
		}	
	}

	public void tempFunc(JspWriter out) {
		String str = "나는 문자열";
		try {
			out.println(str);
		} catch (IOException e) {}
	}


























}