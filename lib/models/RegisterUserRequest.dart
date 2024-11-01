
class RegistrationRequest {
  String firstName;
  String lastName;
  String email;
  String phone;
  String password;
  String gender;
  String city;

  // Constructor to initialize the fields
  RegistrationRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.gender,
    required this.city,
  });

  // A method to display the registration request data (optional)
  @override
  String toString() {
    return 'First Name: $firstName\nLast Name: $lastName\nEmail: $email\nPhone: $phone\nPassword: $password\nGender: $gender\nCity: $city';
  }
}