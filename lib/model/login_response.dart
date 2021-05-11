class LoginResponse {
  User vendor;
  String token;
  String message;
  bool status;

  LoginResponse({this.status, this.vendor, this.token, this.message});

  LoginResponse.fromJson(dynamic json) {
    vendor = json["vendor"] != null ? User.fromJson(json["vendor"]) : null;
    token = json["token"];
    status = json["status"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (vendor != null) {
      map["vendor"] = vendor.toJson();
    }
    map["token"] = token;
    map["status"] = status;
    map["message"] = message;
    return map;
  }
}

class User {
  String id;
  String name;
  String email;
  bool allowAccess;
  String createdAt;
  String updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.allowAccess,
      this.createdAt,
      this.updatedAt});

  User.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    allowAccess = json["allowAccess"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["email"] = email;
    map["allowAccess"] = allowAccess;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    return map;
  }
}
