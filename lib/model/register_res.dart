class RegisterRes {
  bool status;
  User user;
  String message;

  RegisterRes({this.status, this.user, this.message});

  RegisterRes.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class User {
  bool allowAccess;
  String name;
  String email;
  String password;
  List<Null> cart;
  String createdAt;
  String updatedAt;
  String id;

  User(
      {this.allowAccess,
        this.name,
        this.email,
        this.password,
        this.cart,
        this.createdAt,
        this.updatedAt,
        this.id});

  User.fromJson(Map<String, dynamic> json) {
    allowAccess = json['allowAccess'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allowAccess'] = this.allowAccess;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['id'] = this.id;
    return data;
  }
}