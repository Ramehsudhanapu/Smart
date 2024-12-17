class UserPassword {
 String userId;
 String password;
  UserPassword({required this.userId,required this.password});
 // Factory constructor to parse the response data
 factory UserPassword.fromJson(Map<String, dynamic> json) {
   return UserPassword(
     userId: json['userId'],
     password: json['password'] );
 }
}

