
class VerifyUserOtpRequest
{
   String userId;
   String otp;

  VerifyUserOtpRequest({required this.userId,required this.otp});
  factory VerifyUserOtpRequest.fromJson(Map<String, dynamic> json) => VerifyUserOtpRequest(
      userId: json['userId'],
      otp: json['otp'],
    );


}
