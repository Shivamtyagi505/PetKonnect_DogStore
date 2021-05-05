class OrderHistoryResponse {
  bool status;
  List<Order> order;

  OrderHistoryResponse({this.status, this.order});

  OrderHistoryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['order'] != null) {
      order = new List<Order>();
      json['order'].forEach((v) {
        order.add(new Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.order != null) {
      data['order'] = this.order.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Order {
  DispatchForm dispatchForm;
  ShippingAddress shippingAddress;
  List<ProductIDs> productIDs;
  List<String> productNames;
  List<dynamic> quantities;
  List<dynamic> netPrice;
  String orderStatus;
  String confirmationDate;
  String cancellationDate;
  String dispatchedDate;
  String deliveredDate;
  VendorID vendorID;
  dynamic shippingCharges;
  UserID userID;
  dynamic finalTotal;
  String createdAt;
  String updatedAt;
  String id;
  String description;

  Order(
      {this.dispatchForm,
        this.shippingAddress,
        this.productIDs,
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
        this.id,
        this.description});

  Order.fromJson(Map<String, dynamic> json) {
    dispatchForm = json['dispatchForm'] != null
        ? new DispatchForm.fromJson(json['dispatchForm'])
        : null;
    if (json['productIDs'] != null) {
      productIDs = new List<ProductIDs>();
      json['productIDs'].forEach((v) {
        productIDs.add(new ProductIDs.fromJson(v));
      });
    }
    shippingAddress = json['shippingAddress'] != null
        ? new ShippingAddress.fromJson(json['shippingAddress'])
        : null;
    productNames = json['productNames'].cast<String>();
    quantities = json['quantities'].cast<dynamic>();
    netPrice = json['netPrice'].cast<dynamic>();
    orderStatus = json['orderStatus'];
    confirmationDate = json['confirmationDate'];
    cancellationDate = json['cancellationDate'];
    dispatchedDate = json['dispatchedDate'];
    deliveredDate = json['deliveredDate'];
    vendorID = json['vendorID'] != null
        ? new VendorID.fromJson(json['vendorID'])
        : null;
    shippingCharges = json['shippingCharges'];
    userID =
    json['userID'] != null ? new UserID.fromJson(json['userID']) : null;
    finalTotal = json['finalTotal'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dispatchForm != null) {
      data['dispatchForm'] = this.dispatchForm.toJson();
    }
    if (this.productIDs != null) {
      data['productIDs'] = this.productIDs.map((v) => v.toJson()).toList();
    }
    if (this.shippingAddress != null) {
      data['shippingAddress'] = this.shippingAddress.toJson();
    }
    data['productNames'] = this.productNames;
    data['quantities'] = this.quantities;
    data['netPrice'] = this.netPrice;
    data['orderStatus'] = this.orderStatus;
    data['confirmationDate'] = this.confirmationDate;
    data['cancellationDate'] = this.cancellationDate;
    data['dispatchedDate'] = this.dispatchedDate;
    data['deliveredDate'] = this.deliveredDate;
    if (this.vendorID != null) {
      data['vendorID'] = this.vendorID.toJson();
    }
    data['shippingCharges'] = this.shippingCharges;
    if (this.userID != null) {
      data['userID'] = this.userID.toJson();
    }
    data['finalTotal'] = this.finalTotal;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['id'] = this.id;
    data['description'] = this.description;
    return data;
  }
}

class ShippingAddress {

  String doorNo;
  String street;
  String building;
  String city;
  String state;
  int zip;

  ShippingAddress(
  {this.doorNo,
  this.street,
  this.building,
  this.city,
  this.state,
  this.zip});

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    doorNo = json['doorNo'];
    street = json['street'];
    building = json['building'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doorNo'] = this.doorNo;
    data['street'] = this.street;
    data['building'] = this.building;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    return data;
  }
}

class DispatchForm {
  bool sendInvoice;

  DispatchForm({this.sendInvoice});

  DispatchForm.fromJson(Map<String, dynamic> json) {
    sendInvoice = json['sendInvoice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sendInvoice'] = this.sendInvoice;
    return data;
  }
}

class ProductIDs {
  List<String> productImage;
  String vendorID;
  String productName;
  String productBrand;
  String productCategory;
  String productSubcategory;
  int shelfLife;
  int sellingPrice;
  dynamic gstInclusivePrice;
  String gst;
  String igst;
  String cgst;
  String productDescription;
  int availableQuantity;
  int mrp;
  String vegNonVeg;
  String unit;
  int subUnit;
  String petType;
  String country;
  String perishable;
  int discount;
  bool isLowStock;
  String createdAt;
  String updatedAt;
  String id;

  ProductIDs(
      {this.productImage,
        this.vendorID,
        this.productName,
        this.productBrand,
        this.productCategory,
        this.productSubcategory,
        this.shelfLife,
        this.sellingPrice,
        this.gstInclusivePrice,
        this.gst,
        this.igst,
        this.cgst,
        this.productDescription,
        this.availableQuantity,
        this.mrp,
        this.vegNonVeg,
        this.unit,
        this.subUnit,
        this.petType,
        this.country,
        this.perishable,
        this.discount,
        this.isLowStock,
        this.createdAt,
        this.updatedAt,
        this.id});

  ProductIDs.fromJson(Map<String, dynamic> json) {
    productImage = json['productImage'].cast<String>();
    vendorID = json['vendorID'];
    productName = json['productName'];
    productBrand = json['productBrand'];
    productCategory = json['productCategory'];
    productSubcategory = json['productSubcategory'];
    shelfLife = json['shelfLife'];
    sellingPrice = json['sellingPrice'];
    gstInclusivePrice = json['gstInclusivePrice'];
    gst = json['gst'];
    igst = json['igst'];
    cgst = json['cgst'];
    productDescription = json['productDescription'];
    availableQuantity = json['availableQuantity'];
    mrp = json['mrp'];
    vegNonVeg = json['vegNonVeg'];
    unit = json['unit'];
    subUnit = json['subUnit'];
    petType = json['petType'];
    country = json['country'];
    perishable = json['perishable'];
    discount = json['discount'];
    isLowStock = json['isLowStock'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productImage'] = this.productImage;
    data['vendorID'] = this.vendorID;
    data['productName'] = this.productName;
    data['productBrand'] = this.productBrand;
    data['productCategory'] = this.productCategory;
    data['productSubcategory'] = this.productSubcategory;
    data['shelfLife'] = this.shelfLife;
    data['sellingPrice'] = this.sellingPrice;
    data['gstInclusivePrice'] = this.gstInclusivePrice;
    data['gst'] = this.gst;
    data['igst'] = this.igst;
    data['cgst'] = this.cgst;
    data['productDescription'] = this.productDescription;
    data['availableQuantity'] = this.availableQuantity;
    data['mrp'] = this.mrp;
    data['vegNonVeg'] = this.vegNonVeg;
    data['unit'] = this.unit;
    data['subUnit'] = this.subUnit;
    data['petType'] = this.petType;
    data['country'] = this.country;
    data['perishable'] = this.perishable;
    data['discount'] = this.discount;
    data['isLowStock'] = this.isLowStock;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['id'] = this.id;
    return data;
  }
}

class VendorID {
  DeliveryType deliveryType;
  bool allowAccess;
  List<int> deliveryPincodes;
  List<String> products;
  String vendorName;
  int vendorPhonenumber;
  String vendorEmail;
  String vendorPassword;
  String createdAt;
  String updatedAt;
  Null aadharNo;
  String accountNo;
  String bankName;
  String beneficiaryName;
  String branch;
  Null cin;
  String ifsc;
  String offerText;
  Null panNo;
  int shippingCharges;
  String storeAddress;
  int storeContactNo;
  String storeDescription;
  String storeEmail;
  Null storeGst;
  String storeImage;
  String storeName;
  Null storeRating;
  String vendorBuilding;
  String vendorCategory;
  String vendorCity;
  String vendorState;
  String vendorStreet;
  String vendorSubcategory;
  String vendorType;
  Null vendorZip;
  String id;

  VendorID(
      {this.deliveryType,
        this.allowAccess,
        this.deliveryPincodes,
        this.products,
        this.vendorName,
        this.vendorPhonenumber,
        this.vendorEmail,
        this.vendorPassword,
        this.createdAt,
        this.updatedAt,
        this.aadharNo,
        this.accountNo,
        this.bankName,
        this.beneficiaryName,
        this.branch,
        this.cin,
        this.ifsc,
        this.offerText,
        this.panNo,
        this.shippingCharges,
        this.storeAddress,
        this.storeContactNo,
        this.storeDescription,
        this.storeEmail,
        this.storeGst,
        this.storeImage,
        this.storeName,
        this.storeRating,
        this.vendorBuilding,
        this.vendorCategory,
        this.vendorCity,
        this.vendorState,
        this.vendorStreet,
        this.vendorSubcategory,
        this.vendorType,
        this.vendorZip,
        this.id});

  VendorID.fromJson(Map<String, dynamic> json) {
    deliveryType = json['deliveryType'] != null
        ? new DeliveryType.fromJson(json['deliveryType'])
        : null;
    allowAccess = json['allowAccess'];
    deliveryPincodes = json['deliveryPincodes'].cast<int>();
    products = json['products'].cast<String>();
    vendorName = json['vendorName'];
    vendorPhonenumber = json['vendorPhonenumber'];
    vendorEmail = json['vendorEmail'];
    vendorPassword = json['vendorPassword'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    aadharNo = json['aadharNo'];
    accountNo = json['accountNo'];
    bankName = json['bankName'];
    beneficiaryName = json['beneficiaryName'];
    branch = json['branch'];
    cin = json['cin'];
    ifsc = json['ifsc'];
    offerText = json['offerText'];
    panNo = json['panNo'];
    shippingCharges = json['shippingCharges'];
    storeAddress = json['storeAddress'];
    storeContactNo = json['storeContactNo'];
    storeDescription = json['storeDescription'];
    storeEmail = json['storeEmail'];
    storeGst = json['storeGst'];
    storeImage = json['storeImage'];
    storeName = json['storeName'];
    storeRating = json['storeRating'];
    vendorBuilding = json['vendorBuilding'];
    vendorCategory = json['vendorCategory'];
    vendorCity = json['vendorCity'];
    vendorState = json['vendorState'];
    vendorStreet = json['vendorStreet'];
    vendorSubcategory = json['vendorSubcategory'];
    vendorType = json['vendorType'];
    vendorZip = json['vendorZip'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.deliveryType != null) {
      data['deliveryType'] = this.deliveryType.toJson();
    }
    data['allowAccess'] = this.allowAccess;
    data['deliveryPincodes'] = this.deliveryPincodes;
    data['products'] = this.products;
    data['vendorName'] = this.vendorName;
    data['vendorPhonenumber'] = this.vendorPhonenumber;
    data['vendorEmail'] = this.vendorEmail;
    data['vendorPassword'] = this.vendorPassword;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['aadharNo'] = this.aadharNo;
    data['accountNo'] = this.accountNo;
    data['bankName'] = this.bankName;
    data['beneficiaryName'] = this.beneficiaryName;
    data['branch'] = this.branch;
    data['cin'] = this.cin;
    data['ifsc'] = this.ifsc;
    data['offerText'] = this.offerText;
    data['panNo'] = this.panNo;
    data['shippingCharges'] = this.shippingCharges;
    data['storeAddress'] = this.storeAddress;
    data['storeContactNo'] = this.storeContactNo;
    data['storeDescription'] = this.storeDescription;
    data['storeEmail'] = this.storeEmail;
    data['storeGst'] = this.storeGst;
    data['storeImage'] = this.storeImage;
    data['storeName'] = this.storeName;
    data['storeRating'] = this.storeRating;
    data['vendorBuilding'] = this.vendorBuilding;
    data['vendorCategory'] = this.vendorCategory;
    data['vendorCity'] = this.vendorCity;
    data['vendorState'] = this.vendorState;
    data['vendorStreet'] = this.vendorStreet;
    data['vendorSubcategory'] = this.vendorSubcategory;
    data['vendorType'] = this.vendorType;
    data['vendorZip'] = this.vendorZip;
    data['id'] = this.id;
    return data;
  }
}

class DeliveryType {
  bool shiprocket;
  bool wefast;
  bool self;

  DeliveryType({this.shiprocket, this.wefast, this.self});

  DeliveryType.fromJson(Map<String, dynamic> json) {
    shiprocket = json['shiprocket'];
    wefast = json['wefast'];
    self = json['self'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shiprocket'] = this.shiprocket;
    data['wefast'] = this.wefast;
    data['self'] = this.self;
    return data;
  }
}

class UserID {
  Address address;
  bool allowAccess;
  String name;
  String email;
  String password;
  String createdAt;
  String updatedAt;
  String id;

  UserID(
      {this.address,
        this.allowAccess,
        this.name,
        this.email,
        this.password,
        this.createdAt,
        this.updatedAt,
        this.id});

  UserID.fromJson(Map<String, dynamic> json) {
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
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
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
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

class Address {
  String doorNo;
  String street;
  String building;
  String city;
  String state;
  int zip;

  Address({this.doorNo,
    this.street,
    this.building,
    this.city,
    this.state,
    this.zip});

  Address.fromJson(Map<String, dynamic> json) {
    doorNo = json['doorNo'];
    street = json['street'];
    building = json['building'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doorNo'] = this.doorNo;
    data['street'] = this.street;
    data['building'] = this.building;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    return data;
  }
}