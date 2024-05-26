class User {
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String mobileNumber;
  final String profileImage;

  User({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.mobileNumber,
    required this.profileImage,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first_name'],
      lastName: json['last_name'],
      username: json['username'],
      email: json['email'],
      mobileNumber: json['mobile_number'],
      profileImage: json['profile_image'],
    );
  }
}
