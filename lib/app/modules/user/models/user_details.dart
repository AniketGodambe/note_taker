class UserDetails {
  String? username;
  String? password;
  String? firstname;
  String? lastname;
  int? mobile;
  String? email;

  UserDetails({
    this.username,
    this.password,
    this.firstname,
    this.lastname,
    this.mobile,
    this.email,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        username: json['username'] as String?,
        password: json['password'] as String?,
        firstname: json['firstname'] as String?,
        lastname: json['lastname'] as String?,
        mobile: json['mobile'] as int?,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'firstname': firstname,
        'lastname': lastname,
        'mobile': mobile,
        'email': email,
      };
}
