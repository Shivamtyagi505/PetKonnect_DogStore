class GetProductDetailRes {
  bool status;
  Product product;

  GetProductDetailRes({this.status, this.product});

  GetProductDetailRes.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}

class Product {
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
  int discount;
  String createdAt;
  String updatedAt;
  Null deliveryType;
  Null ean;
  Null rating;
  String id;

  Product(
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
        this.createdAt,
        this.updatedAt,
        this.deliveryType,
        this.ean,
        this.rating,
        this.id});

  Product.fromJson(Map<String, dynamic> json) {
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
    deliveryType = json['deliveryType'];
    ean = json['ean'];
    rating = json['rating'];
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
    data['deliveryType'] = this.deliveryType;
    data['ean'] = this.ean;
    data['rating'] = this.rating;
    data['id'] = this.id;
    return data;
  }
}