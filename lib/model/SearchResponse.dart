class SearchResponse {
  bool status;
  List<SearchProducts> products;

  SearchResponse({this.status, this.products});

  SearchResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['products'] != null) {
      products = new List<SearchProducts>();
      json['products'].forEach((v) {
        products.add(new SearchProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchProducts {
  List<String> productImage;
  int availableQuantity;
  String productName;
  dynamic gstInclusivePrice;
  dynamic sellingPrice;
  String igst;
  String cgst;
  String gst;
  VendorID vendorID;
  bool isLowStock;
  dynamic discount;
  dynamic mrp;
  String productBrand;
  String productDescription;
  String petType;
  String vegNonVeg;
  String productCategory;
  String productSubcategory;
  dynamic shelfLife;
  String unit;
  dynamic subUnit;
  String country;
  String perishable;
  List<Null> reviews;
  String createdAt;
  String updatedAt;
  String id;

  SearchProducts(
      {this.productImage,
        this.availableQuantity,
        this.productName,
        this.gstInclusivePrice,
        this.sellingPrice,
        this.igst,
        this.cgst,
        this.gst,
        this.vendorID,
        this.isLowStock,
        this.discount,
        this.mrp,
        this.productBrand,
        this.productDescription,
        this.petType,
        this.vegNonVeg,
        this.productCategory,
        this.productSubcategory,
        this.shelfLife,
        this.unit,
        this.subUnit,
        this.country,
        this.perishable,
        this.reviews,
        this.createdAt,
        this.updatedAt,
        this.id});

  SearchProducts.fromJson(Map<String, dynamic> json) {
    productImage = json['productImage'].cast<String>();
    availableQuantity = json['availableQuantity'];
    productName = json['productName'];
    gstInclusivePrice = json['gstInclusivePrice'];
    sellingPrice = json['sellingPrice'];
    igst = json['igst'];
    cgst = json['cgst'];
    gst = json['gst'];
    vendorID = json['vendorID'] != null
        ? new VendorID.fromJson(json['vendorID'])
        : null;
    isLowStock = json['isLowStock'];
    discount = json['discount'];
    mrp = json['mrp'];
    productBrand = json['productBrand'];
    productDescription = json['productDescription'];
    petType = json['petType'];
    vegNonVeg = json['vegNonVeg'];
    productCategory = json['productCategory'];
    productSubcategory = json['productSubcategory'];
    shelfLife = json['shelfLife'];
    unit = json['unit'];
    subUnit = json['subUnit'];
    country = json['country'];
    perishable = json['perishable'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productImage'] = this.productImage;
    data['availableQuantity'] = this.availableQuantity;
    data['productName'] = this.productName;
    data['gstInclusivePrice'] = this.gstInclusivePrice;
    data['sellingPrice'] = this.sellingPrice;
    data['igst'] = this.igst;
    data['cgst'] = this.cgst;
    data['gst'] = this.gst;
    if (this.vendorID != null) {
      data['vendorID'] = this.vendorID.toJson();
    }
    data['isLowStock'] = this.isLowStock;
    data['discount'] = this.discount;
    data['mrp'] = this.mrp;
    data['productBrand'] = this.productBrand;
    data['productDescription'] = this.productDescription;
    data['petType'] = this.petType;
    data['vegNonVeg'] = this.vegNonVeg;
    data['productCategory'] = this.productCategory;
    data['productSubcategory'] = this.productSubcategory;
    data['shelfLife'] = this.shelfLife;
    data['unit'] = this.unit;
    data['subUnit'] = this.subUnit;
    data['country'] = this.country;
    data['perishable'] = this.perishable;
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