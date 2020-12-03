package eltag;


import model.MemberDAO;

/*
  EL에서 java클래스의 메소드 호출 절차 및 방법
  1.클래스와 메소드를 정의한다. 단, 메소드 정의시 반드시
  public static으로 선언해야한다.
 */
public class MyTagLib {
	public static boolean isNumber(String value) {
		
		/*
		메소드 설명 : 매개변수로 전달된 문자열에 숫자가 아닌 문자가
		포함되어있는지 확인한다. 전체가 숫자이면 true아니면 false반환
		EX) 1234=>true, 백20=> false
		 */
		
		char[] chArr = value.toCharArray();
		for(int i=0; i<chArr.length; i++) {
			if(!(chArr[i]>='0' && chArr[i]<='9')) {
				return false;
			}
		}
		return true;
	}
	/*
	 아이디/패스워드 , db연결의 위한 드라이버 명 ,url을 인자로전달받아
	 회원 여부를 판단하여 boolean을 반환해주는 메소드.
	 */
	public static boolean memberLogin(String userid
			,String userpw
			,String JDBCDriver
			,String ConnectionURL) {
		MemberDAO dao = new MemberDAO(JDBCDriver, ConnectionURL);

		//폼값으로 받은 아이디,패스워드를 통해 로그인 처리 함수 호출
		boolean isMember = dao.isMember(userid, userpw);
		return isMember;
	}
	
	public static String getGender(String num) {
		
		String returnStr = "";
		int beginIdx = num.indexOf("-")+1;
		String genderStr = num.substring(beginIdx,beginIdx+1);
		
		int genderInt = Integer.parseInt(genderStr);
		
		if(genderInt==1 || genderInt==3) {
			returnStr = "남자";
		}
		else if(genderInt==2|| genderInt==4) {
			returnStr = "여자";
		}
		else {
			returnStr = "?";
		}
		return returnStr;
		
	}
	
	public static void main(String[] args) {
		boolean result1 = isNumber("1234");
		boolean result2 = isNumber("백20");
		String r1 = getGender("123456-1000000");
		String r2 = getGender("123456-2000000");
		System.out.println("결과1:"+r1);
		System.out.println("결과2:"+r2);
		
		
		
		
	}
}
