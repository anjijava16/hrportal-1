package testing;

import java.util.Scanner;

import com.sapta.hr.web.util.CommonUtil;

public class LoginTest {

	private static Scanner sc;

	public static void main(String[] args) throws Exception {
		sc = new Scanner(System.in);
		
		System.out.println("Enter Your Password");
		String password = sc.next();
        System.out.println("encryptstring ::"+CommonUtil.encrypt("sapta", password));
       
	}
}

