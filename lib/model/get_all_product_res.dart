class GetAllProductRes {
  bool status;
  List<Products> products;
  Vendor vendor;
  List<String> filterPet;

  GetAllProductRes({this.status, this.products, this.vendor, this.filterPet});

  GetAllProductRes.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    vendor =
    json['vendor'] != null ? new Vendor.fromJson(json['vendor']) : null;
    filterPet = json['filterPet'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    if (this.vendor != null) {
      data['vendor'] = this.vendor.toJson();
    }
    data['filterPet'] = this.filterPet;
    return data;
  }
}

class Products {
  List<String> productImage;
  String vendorID;
  String productName;
  String productBrand;
  String productCategory;
  String productSubcategory;
  int shelfLife;
  int sellingPrice;
  double gstInclusivePrice;
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
  dynamic discount;
  List<Null> reviews;
  String createdAt;
  String updatedAt;

  String id;

  Products(
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
        this.reviews,
        this.createdAt,
        this.updatedAt,
        this.id});

  Products.fromJson(Map<String, dynamic> json) {
    productImage = json['productImage'].cast<String>();
    vendorID = json['vendorID'];
    productName = json['productName'];
    productBrand = json['productBrand'];
    productCategory = json['productCategory'];
    productSubcategory = json['productSubcategory'];
    shelfLife = json['shelfLife'];
    sellingPrice = json['sellingPrice'];
    gstInclusivePrice = json['gstInclusivePrice'].toDouble();
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
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['id'] = this.id;
    return data;
  }
}

class Vendor {
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
  String storeImage;
  String storeEmail;
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

  Vendor(
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
        this.storeImage,
        this.storeEmail,
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

  Vendor.fromJson(Map<String, dynamic> json) {
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
    storeImage = json['storeImage'];
    storeEmail = json['storeEmail'];
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
    data['storeImage'] = this.storeImage;
    data['storeEmail'] = this.storeEmail;
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