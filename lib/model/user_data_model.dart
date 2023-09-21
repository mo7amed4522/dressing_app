class UserData {
  String? status;
  String? msg;
  DataUser? data;

  UserData({this.status, this.msg, this.data});

  UserData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? DataUser.fromJson(json['data']) : null;
  }
}

class DataUser {
  int? userId;
  String? name;
  String? email;
  String? password;
  String? phone;
  int? age;
  String? place;
  String? confirmPhone;
  int? type;
  int? verfiyCode;

  DataUser({this.userId, this.name, this.email, this.password, this.phone, this.age, this.place, this.confirmPhone, this.type, this.verfiyCode});

  DataUser.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    age = json['age'];
    place = json['place'];
    confirmPhone = json['confirm_phone'];
    type = json['type'];
    verfiyCode = json['verfiyCode'];
  }
}
