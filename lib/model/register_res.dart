class RegisterRes {
  bool status;
  String id;
  String name;
  String email;
  bool allowAccess;
  List<dynamic> cart;

  RegisterRes({
      this.status,
      this.id,
      this.name,
      this.email, 
      this.allowAccess, 
      this.cart});

  RegisterRes.fromJson(dynamic json) {
    status = json["status"];
    id = json["id"];
    name = json["name"];
    email = json["email"];
    allowAccess = json["allowAccess"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["id"] = id;
    map["name"] = name;
    map["email"] = email;
    map["allowAccess"] = allowAccess;
    if (cart != null) {
      map["cart"] = cart.map((v) => v.toJson()).toList();
    }
    return map;
  }

}