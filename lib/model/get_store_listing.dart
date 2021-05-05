class StorelistingResponse {
  bool status;
  List<Vendors> vendors;

  StorelistingResponse({this.status, this.vendors});

  StorelistingResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['vendors'] != null) {
      vendors = new List<Vendors>();
      json['vendors'].forEach((v) {
        vendors.add(new Vendors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.vendors != null) {
      data['vendors'] = this.vendors.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vendors {
  DeliveryType deliveryType;
  bool allowAccess;
  List<int> deliveryPincodes;
  String vendorName;
  int vendorPhonenumber;
  String vendorEmail;
  String vendorPassword;
  String vendorType;
  String storeName;
  String storeAddress;
  int storeContactNo;
  String storeEmail;
  String storeImage;
  String storeLogo;
  Null storeRating;
  String storeDescription;
  String beneficiaryName;
  String bankName;
  String branch;
  String accountNo;
  String ifsc;
  Null cin;
  Null aadharNo;
  Null panNo;
  Null storeGst;
  String vendorCategory;
  String vendorSubcategory;
  String vendorBuilding;
  String vendorStreet;
  String vendorCity;
  String vendorState;
  Null vendorZip;
  String offerText;
  int shippingCharges;
  String createdAt;
  String updatedAt;
  String id;

  Vendors(
      {this.deliveryType,
        this.allowAccess,
        this.deliveryPincodes,

        this.vendorName,
        this.vendorPhonenumber,
        this.vendorEmail,
        this.vendorPassword,
        this.vendorType,
        this.storeName,
        this.storeAddress,
        this.storeContactNo,
        this.storeEmail,
        this.storeImage,
        this.storeLogo,
        this.storeRating,
        this.storeDescription,
        this.beneficiaryName,
        this.bankName,
        this.branch,
        this.accountNo,
        this.ifsc,
        this.cin,
        this.aadharNo,
        this.panNo,
        this.storeGst,
        this.vendorCategory,
        this.vendorSubcategory,
        this.vendorBuilding,
        this.vendorStreet,
        this.vendorCity,
        this.vendorState,
        this.vendorZip,
        this.offerText,
        this.shippingCharges,
        this.createdAt,
        this.updatedAt,
        this.id});

  Vendors.fromJson(Map<String, dynamic> json) {
    deliveryType = json['deliveryType'] != null
        ? new DeliveryType.fromJson(json['deliveryType'])
        : null;
    allowAccess = json['allowAccess'];
    deliveryPincodes = json['deliveryPincodes'].cast<int>();

    vendorName = json['vendorName'];
    vendorPhonenumber = json['vendorPhonenumber'];
    vendorEmail = json['vendorEmail'];
    vendorPassword = json['vendorPassword'];
    vendorType = json['vendorType'];
    storeName = json['storeName'];
    storeAddress = json['storeAddress'];
    storeContactNo = json['storeContactNo'];
    storeEmail = json['storeEmail'];
    storeImage = json['storeImage'];
    storeLogo = json['storeLogo'];
    storeRating = json['storeRating'];
    storeDescription = json['storeDescription'];
    beneficiaryName = json['beneficiaryName'];
    bankName = json['bankName'];
    branch = json['branch'];
    accountNo = json['accountNo'];
    ifsc = json['ifsc'];
    cin = json['cin'];
    aadharNo = json['aadharNo'];
    panNo = json['panNo'];
    storeGst = json['storeGst'];
    vendorCategory = json['vendorCategory'];
    vendorSubcategory = json['vendorSubcategory'];
    vendorBuilding = json['vendorBuilding'];
    vendorStreet = json['vendorStreet'];
    vendorCity = json['vendorCity'];
    vendorState = json['vendorState'];
    vendorZip = json['vendorZip'];
    offerText = json['offerText'];
    shippingCharges = json['shippingCharges'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.deliveryType != null) {
      data['deliveryType'] = this.deliveryType.toJson();
    }
    data['allowAccess'] = this.allowAccess;
    data['deliveryPincodes'] = this.deliveryPincodes;

    data['vendorName'] = this.vendorName;
    data['vendorPhonenumber'] = this.vendorPhonenumber;
    data['vendorEmail'] = this.vendorEmail;
    data['vendorPassword'] = this.vendorPassword;
    data['vendorType'] = this.vendorType;
    data['storeName'] = this.storeName;
    data['storeAddress'] = this.storeAddress;
    data['storeContactNo'] = this.storeContactNo;
    data['storeEmail'] = this.storeEmail;
    data['storeImage'] = this.storeImage;
    data['storeLogo'] = this.storeLogo;
    data['storeRating'] = this.storeRating;
    data['storeDescription'] = this.storeDescription;
    data['beneficiaryName'] = this.beneficiaryName;
    data['bankName'] = this.bankName;
    data['branch'] = this.branch;
    data['accountNo'] = this.accountNo;
    data['ifsc'] = this.ifsc;
    data['cin'] = this.cin;
    data['aadharNo'] = this.aadharNo;
    data['panNo'] = this.panNo;
    data['storeGst'] = this.storeGst;
    data['vendorCategory'] = this.vendorCategory;
    data['vendorSubcategory'] = this.vendorSubcategory;
    data['vendorBuilding'] = this.vendorBuilding;
    data['vendorStreet'] = this.vendorStreet;
    data['vendorCity'] = this.vendorCity;
    data['vendorState'] = this.vendorState;
    data['vendorZip'] = this.vendorZip;
    data['offerText'] = this.offerText;
    data['shippingCharges'] = this.shippingCharges;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
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

