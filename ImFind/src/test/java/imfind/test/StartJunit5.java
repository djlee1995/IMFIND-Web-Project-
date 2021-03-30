package imfind.test;
import org.junit.jupiter.api.Test;

public class StartJunit5 {
	
	
	@Test
	void create() {
		Member member = new Member(19);
		System.out.println("create member");
	}
	
	class Member{
		int age;
		
		public Member(int age) {
			this.age = age;
		}
	}
}
