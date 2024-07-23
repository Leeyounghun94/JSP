package common;

public class Person {
	/*
	 * 자바 빈즈 규약 
	 * 1. 기본패키지(default) 이외에 패키지가 만들어야한다. 
	 * 2. 세터/게터가 있어야한다. 
	 * 3. 기본생성자가 있어야한다.
	 * 4. 세터/게터는 Public으로 선언 되어야 한다.
	 * 5. 필드 생성자를 Private 으로 지정해야 한다.
	 */
	
	
	
	private String name;	//필드
	private int age;
	
	
	
	//생성자
	
	public Person() {
		
	}// 기본 생성자
	
	
	
	
	public Person(String name, int age) {
		//super();
		this.name = name;
		this.age = age;
	}
	//커스텀 생성자
	



	
	//메서드
	
	public String getName() {
		return name;
	}

	
	


	public void setName(String name) {
		this.name = name;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}
	
	//게터, 세터
}
