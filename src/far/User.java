package far;

public class User {
	public  String username;
	private String firstName;
	private String lastName;

	public User(String username, String firstName, String lastName) {
		this.username = username;
		this.firstName = firstName;
		this.lastName = lastName;
	}

	public String getUsername() {
		return username;
	}

	public String getFirstName() {
	       return firstName;
	}

	public String getLastName() {
		return lastName;
	}
}
