class OrderDetailResponse {
  bool status;
  Order order;

  OrderDetailResponse({this.status, this.order});

  OrderDetailResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.order != null) {
      data['order'] = this.order.toJson();
    }
    return data;
  }
}

class Order {
  DispatchForm dispatchForm;
  Address address;

  List<String> productNames;
  List<int> quantities;
  List<int> netPrice;
  String orderStatus;
  String confirmationDate;
  Null cancellationDate;
  String dispatchedDate;
  String deliveredDate;
  String vendorID;
  dynamic shippingCharges;
  UserID userID;
  dynamic finalTotal;
  String createdAt;
  String updatedAt;
  String id;

  Order(
      {this.dispatchForm,
        this.address,
        this.productNames,
        this.quantities,
        this.netPrice,
        this.orderStatus,
        this.confirmationDate,
        this.cancellationDate,
        this.dispatchedDate,
        this.deliveredDate,
        this.vendorID,
        this.shippingCharges,
        this.userID,
        this.finalTotal,
        this.createdAt,
        this.updatedAt,
        this.id});

  Order.fromJson(Map<String, dynamic> json) {
    dispatchForm = json['dispatchForm'] != null
        ? new DispatchForm.fromJson(json['dispatchForm'])
        : null;
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;

    productNames = json['productNames'].cast<String>();
    quantities = json['quantities'].cast<int>();
    netPrice = json['netPrice'].cast<int>();
    orderStatus = json['orderStatus'];
    confirmationDate = json['confirmationDate'];
    cancellationDate = json['cancellationDate'];
    dispatchedDate = json['dispatchedDate'];
    deliveredDate = json['deliveredDate'];
    vendorID = json['vendorID'];
    shippingCharges = json['shippingCharges'];
    userID =
    json['userID'] != null ? new UserID.fromJson(json['userID']) : null;
    finalTotal = json['finalTotal'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dispatchForm != null) {
      data['dispatchForm'] = this.dispatchForm.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['productNames'] = this.productNames;
    data['quantities'] = this.quantities;
    data['netPrice'] = this.netPrice;
    data['orderStatus'] = this.orderStatus;
    data['confirmationDate'] = this.confirmationDate;
    data['cancellationDate'] = this.cancellationDate;
    data['dispatchedDate'] = this.dispatchedDate;
    data['deliveredDate'] = this.deliveredDate;
    data['vendorID'] = this.vendorID;
    data['shippingCharges'] = this.shippingCharges;
    if (this.userID != null) {
      data['userID'] = this.userID.toJson();
    }
    data['finalTotal'] = this.finalTotal;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['id'] = this.id;
    return data;
  }
}

class DispatchForm {
  bool sendInvoice;
  String courierName;
  String parcelId;
  int courierPhonenumber;
  String estimatedDateArrival;

  DispatchForm(
      {this.sendInvoice,
        this.courierName,
        this.parcelId,
        this.courierPhonenumber,
        this.estimatedDateArrival});

  DispatchForm.fromJson(Map<String, dynamic> json) {
    sendInvoice = json['sendInvoice'];
    courierName = json['courier_Name'];
    parcelId = json['parcel_Id'];
    courierPhonenumber = json['courier_Phonenumber'];
    estimatedDateArrival = json['estimated_date_arrival'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sendInvoice'] = this.sendInvoice;
    data['courier_Name'] = this.courierName;
    data['parcel_Id'] = this.parcelId;
    data['courier_Phonenumber'] = this.courierPhonenumber;
    data['estimated_date_arrival'] = this.estimatedDateArrival;
    return data;
  }
}

class Address {
  String doorNo;
  String building;
  String street;
  String city;
  String state;
  int zip;

  Address(
      {this.doorNo,
        this.building,
        this.street,
        this.city,
        this.state,
        this.zip});

  Address.fromJson(Map<String, dynamic> json) {
    doorNo = json['doorNo'];
    building = json['building'];
    street = json['street'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doorNo'] = this.doorNo;
    data['building'] = this.building;
    data['street'] = this.street;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    return data;
  }
}

class UserID {
  Address address;
  bool allowAccess;
  String name;
  String email;
  int phoneNumber;
  String password;
  List<Null> cart;
  String createdAt;
  String updatedAt;
  String id;

  UserID(
      {this.address,
        this.allowAccess,
        this.name,
        this.email,
        this.phoneNumber,
        this.password,
        this.cart,
        this.createdAt,
        this.updatedAt,
        this.id});

  UserID.fromJson(Map<String, dynamic> json) {
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    allowAccess = json['allowAccess'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['allowAccess'] = this.allowAccess;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['id'] = this.id;
    return data;
  }
}