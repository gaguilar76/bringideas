class User {
  final String? userMail;
  final String? userPass;
  final String? userName;

  User({this.userMail, this.userPass, this.userName});

  User.fromJson(Map<String, dynamic> json)
      : userMail = json['userMail'].toString(),
        userPass = json['userPass'].toString(),
        userName = json['userName'].toString();

  Map<String, dynamic> toMap() {
    return {'userMail': userMail, 'userPass': userPass, 'userName': userName};
  }
}
