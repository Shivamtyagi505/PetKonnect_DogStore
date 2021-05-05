class ViewCartResponse {
  bool status;
  List<Cart> cart;


  ViewCartResponse({this.status, this.cart});

  ViewCartResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['cart'] != null) {
      cart = new List<Cart>();
      json['cart'].forEach((v) {
        cart.add(new Cart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.cart != null) {
      data['cart'] = this.cart.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cart {
  String vendorID;
  String userID;
  List<CartProduct> products;
  List<int> quantities;
  int shippingCharges;
  double subTotal;

  Cart(
      {this.vendorID,
        this.userID,
        this.products,
        this.quantities,
        this.shippingCharges,
        this.subTotal});

  Cart.fromJson(Map<String, dynamic> json) {
    vendorID = json['vendorID'];
    userID = json['userID'];
    if (json['products'] != null) {
      products = new List<CartProduct>();
      json['products'].forEach((v) {
        products.add(new CartProduct.fromJson(v));
      });
    }
    quantities = json['quantities'].cast<int>();
    shippingCharges = json['shippingCharges'];
    subTotal = json['subTotal'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendorID'] = this.vendorID;
    data['userID'] = this.userID;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    data['quantities'] = this.quantities;
    data['shippingCharges'] = this.shippingCharges;
    data['subTotal'] = this.subTotal;
    return data;
  }
}

class CartProduct {
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
  List<Null> reviews;
  String createdAt;
  String updatedAt;
  Null deliveryType;
  Null ean;
  Null rating;
  String id;

  CartProduct(
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
        this.deliveryType,
        this.ean,
        this.rating,
        this.id});

  CartProduct.fromJson(Map<String, dynamic> json) {
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