import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_petkon/bloc/CommonBloc.dart';
import 'package:flutter_petkon/bloc/CommonEvent.dart';
import 'package:flutter_petkon/bloc/CommonState.dart';
import 'package:flutter_petkon/model/DeleteCartResponse.dart';
import 'package:flutter_petkon/model/get_all_product_res.dart';
import 'package:flutter_petkon/model/get_store_listing.dart';
import 'package:flutter_petkon/model/view_cart.dart';

import 'package:flutter_petkon/screens/MyCart.dart';
import 'package:flutter_petkon/screens/ProductDetailScreen.dart';
import 'package:flutter_petkon/screens/StoreDetailScreen.dart';
import 'package:flutter_petkon/utils/CommonStyles.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_petkon/utils/Constants.dart';
import 'package:flutter_petkon/utils/size_config.dart';

class CommonAppbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}

class CardItemWidget extends StatelessWidget {
  List<String> productId = List();
  CartProduct product;
  CommonBloc commonBloc;
  var token;
  int quantitiy;
  CardItemWidget(this.product, this.quantitiy,this.commonBloc, this.token);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Row(
        children: [
          Expanded(
            flex: 9,
            child: Card(
              color: Colors.white,
              elevation: space_3,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(space_15)),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: space_15, horizontal: space_15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(space_15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/loader.jpg",
                        image: product.productImage[0],
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),),
                    SizedBox(width: space_15,),
                    Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.productName.toString(), style: CommonStyles.getMontserratStyle(space_15, FontWeight.w500, CommonStyles.grey),),
                            SizedBox(height: space_5,),
                            Text(product.productBrand.toString(), style: CommonStyles.getMontserratStyle(space_12, FontWeight.w300, CommonStyles.grey),),
                            SizedBox(height: space_5,),
                            Text("Size:", style: CommonStyles.getMontserratStyle(space_12, FontWeight.w300, CommonStyles.grey),),
                            SizedBox(height: space_5,),
                            Text("\u20B9 "+product.sellingPrice.toString(), style: CommonStyles.getMontserratStyle(space_20, FontWeight.w500, CommonStyles.darkAmber),),
                          ],
                        )),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: space_26,
                                height: space_26,
                                child: Card(
                                  color: CommonStyles.amber,
                                  elevation: space_1,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: CommonStyles.amber),
                                      borderRadius: BorderRadius.circular(space_11)
                                  ),
                                  child: Center(
                                    child: Text("-", style: CommonStyles.getMontserratStyle(space_12, FontWeight.w600, Colors.white),),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(space_8),
                                child: Text(quantitiy.toString(), style: CommonStyles.getMontserratStyle(space_18, FontWeight.w500, CommonStyles.grey),),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: space_26,
                                height: space_26,
                                child: Card(
                                  color: CommonStyles.amber,
                                  elevation: space_1,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: CommonStyles.amber),
                                      borderRadius: BorderRadius.circular(space_11)
                                  ),
                                  child: Center(
                                    child: Text("+", style: CommonStyles.getMontserratStyle(space_12, FontWeight.w600, Colors.white),),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              productId.clear();
              productId.add("\""+product.id+"\"");
              print("prdocut IDD "+productId.toString());
              print("token "+token);
              commonBloc..add(DeleteCartEvent(token: token,productId: productId));
            },
            child: Expanded(
              flex: 1,
              child: Container(
                  margin: EdgeInsets.only(left: space_5),
                  height: space_26,
                  width: space_26,
                  padding: EdgeInsets.all(space_5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(space_13),
                      border: Border.all(color: CommonStyles.red)
                  ),
                  child: Center(child: Icon(Icons.close, color: CommonStyles.red, size: space_15,))),
            ),
          )
        ],
      ),
    );
  }
}

class DashedLine extends StatelessWidget {
  final double height;
  final double dashWidth;
  final Color color;
  const DashedLine(
      {this.height = 1, this.color = Colors.black, this.dashWidth = 5.0});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          final dashHeight = height;
          final dashCount = (boxWidth / (2 * dashWidth)).floor();
          return Flex(
            children: List.generate(dashCount, (index) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              );
            }),
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            direction: Axis.horizontal,
          );
        });
  }
}

class TextInputWidget extends StatelessWidget {
  TextEditingController textEditingController;
  bool isPassword;
  TextInputType textInputType;

  TextInputWidget(this.textEditingController, this.isPassword, this.textInputType);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      controller: textEditingController,
      keyboardType: textInputType,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.all(space_10),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(space_10)),
        filled: true,
        hintText: "Enter",
        focusColor: CommonStyles.blue,
        fillColor: CommonStyles.secondarygrey.withOpacity(0.2),
      ),
    );
  }
}


class SearchTextInputWidget extends StatelessWidget {
  TextEditingController textEditingController;
  bool isPassword;
  TextInputType textInputType;

  SearchTextInputWidget(this.textEditingController, this.isPassword, this.textInputType);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(context, space_40),
      child: TextFormField(
        obscureText: isPassword,
        controller: textEditingController,
        keyboardType: textInputType,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.all(space_5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(space_25)),
          filled: true,
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          focusColor: CommonStyles.blue,
          fillColor: CommonStyles.secondarygrey.withOpacity(0.2),
        ),
      ),
    );
  }
}

class TextInputWithIconWidget extends StatelessWidget {
  TextEditingController textEditingController;
  bool isPassword;
  TextInputType textInputType;
  String iconname;
  String hintText;

  TextInputWithIconWidget(this.textEditingController, this.isPassword, this.textInputType, this.iconname, this.hintText);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageIcon(AssetImage(iconname,), size: space_20, color: CommonStyles.amber,),
        Expanded(
          child: TextFormField(
            obscureText: isPassword,
            controller: textEditingController,
            keyboardType: textInputType,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(horizontal: space_10, vertical: space_3),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: CommonStyles.grey.withOpacity(0.5)),
              ),
              filled: false,
              hintText: hintText,
              focusColor: CommonStyles.blue,
            ),
          ),
        ),
      ],
    );
  }
}

class RatingBarByRatingWidget extends StatelessWidget {
  double rating;
  double size;

  RatingBarByRatingWidget(this.rating, this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: space_3),
            child: Icon(
              rating == 0.5 ? Icons.star_half : Icons.star,
              color: rating >= 0.5 ? CommonStyles.amber : CommonStyles.secondarygrey,
              size: size,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: space_3),
            child: Icon(
              rating == 1.5 ? Icons.star_half : Icons.star,
              color: rating >= 1.5 ? CommonStyles.amber : CommonStyles.secondarygrey,
              size: size,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: space_3),
            child: Icon(
              rating == 2.5 ? Icons.star_half : Icons.star,
              color: rating >= 2.5 ? CommonStyles.amber : CommonStyles.secondarygrey,
              size: size,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: space_3),
            child: Icon(
              rating == 3.5 ? Icons.star_half : Icons.star,
              color: rating >= 3.5 ? CommonStyles.amber : CommonStyles.secondarygrey,
              size: size,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: space_3),
            child: Icon(
              rating == 4.5 ? Icons.star_half : Icons.star,
              color: rating >= 4.5 ? CommonStyles.amber : CommonStyles.secondarygrey,
              size: size,
            ),
          ),
        ],
      ),
    );
  }
}



class ItemCardNoMarginWidget extends StatefulWidget {

  Vendors mVendors;
  ItemCardNoMarginWidget(this.mVendors);

  @override
  _ItemCardNoMarginWidgetState createState() => _ItemCardNoMarginWidgetState();
}

class _ItemCardNoMarginWidgetState extends State<ItemCardNoMarginWidget> {
  bool isLiked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
//    isLiked = widget.
    }

    return InkWell(
      onTap: () {
        Navigator.push(
         context,
         MaterialPageRoute(
             builder: (context) =>
                 StoreDetailScreen(widget.mVendors?.id)),
       );
      },
      child: Container(
        height: space_250,
        width: space_180,
        child: Stack(
          children: [
            Container(
              child: Card(
                elevation: space_3,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(space_10)),
                child: Container(
                  padding: EdgeInsets.all(space_8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(space_10),
                                topLeft: Radius.circular(space_10)),
                            child: Container(
                              width: space_200,
                              height: space_110,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(space_10)),
                              child: FadeInImage.assetNetwork(
                                placeholder: "assets/images/loader.jpg",
                                image: "${widget.mVendors?.storeImage}",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: space_10,
                      ),
                      Container(
                        child: Text(
                          "${widget.mVendors?.storeName}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CommonStyles.getRalewayStyle(
                              space_14, FontWeight.w800, CommonStyles.grey),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



//4
class ItemDetailImgCarousalWidget extends StatefulWidget {
  List<String> bannerList;

  ItemDetailImgCarousalWidget({this.bannerList});

  @override
  _ItemDetailImgCorousalWidgetState createState() =>
      _ItemDetailImgCorousalWidgetState();
}

class _ItemDetailImgCorousalWidgetState extends State<ItemDetailImgCarousalWidget> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(context, space_140),
      child: Stack(
        children: [
          Container(
              width: double.infinity,
              height: getProportionateScreenHeight(context, space_140),
              child: Stack(
                children: [
                  Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                            height: getProportionateScreenHeight(
                                context, space_100),
                            viewportFraction: 1.0,
                            enlargeCenterPage: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                        carouselController: _controller,
                        items: widget.bannerList
                            .map((item) => Stack(
                          children: [
                            Container(
                              width: double.infinity,

                              height: getProportionateScreenHeight(
                                  context, space_250),
                              child: Image(image: AssetImage(widget.bannerList[_current])),
                            ),
                          ],
                        ))
                            .toList(),
                      ),
                      new DotsIndicator(
                        dotsCount: 3,
                        position: _current.toDouble(),
                        decorator: DotsDecorator(
                          color: Colors.grey, // Inactive color
                          activeColor: CommonStyles.amber,
                        ),
                      )
                    ],
                  ),
                ],
              )),

        ],
      ),
    );
  }
}


class ProductItemCardNoMarginWidget extends StatefulWidget {
Products mProducts;
var vendorId;
ProductItemCardNoMarginWidget(this.mProducts,this.vendorId);

@override
_ProductItemCardNoMarginWidgetState createState() => _ProductItemCardNoMarginWidgetState();
}

class _ProductItemCardNoMarginWidgetState extends State<ProductItemCardNoMarginWidget> {
  bool isLiked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    if (widget.category_adslist != null &&
//        widget.category_adslist.is_wishlist != null) {
//      isLiked = widget.category_adslist.is_wishlist;
//    }
  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
//    isLiked = widget.
    }

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ProductDetailScreen(widget.mProducts?.id,widget.vendorId)),
        );
      },
      child: Container(
        height: space_250,
        width: space_180,
        child: Stack(
          children: [
            Container(
              child: Card(
                elevation: space_3,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(space_10)),
                child: Container(
                  padding: EdgeInsets.all(space_8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(space_10),
                                topLeft: Radius.circular(space_10)),
                            child: Container(
                              width: space_200,
                              height: space_110,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(space_10)),
                              child: FadeInImage.assetNetwork(
                                placeholder: "assets/images/loader.jpg",
                                image: "${widget.mProducts?.productImage[0]}",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0.0,
                            right: 0.0,
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: Container(
                                height: space_30,
                                width: space_30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: CommonStyles.amber,
                                ),
                                child: Center(
                                    child: Icon(Icons.add, color: Colors.white,)
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: space_10,
                      ),
                      Container(
                        child: Text(
                          "${widget.mProducts?.productName}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CommonStyles.getRalewayStyle(
                              space_14, FontWeight.w800, CommonStyles.grey),
                        ),
                      ),
                      SizedBox(
                        height: space_5,
                      ),
                      RatingBarByRatingWidget(4.5, space_10),
                      SizedBox(
                        height: space_5,
                      ),
                      Text(
                        "Brand : ${widget.mProducts?.productBrand}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: CommonStyles.getRalewayStyle(
                            space_14, FontWeight.w500, CommonStyles.grey.withOpacity(0.8)),
                      ),
                      SizedBox(height: space_5,),
                      RichText(
                        text: new TextSpan(
                          text: '\u20B9${"${widget.mProducts?.sellingPrice}"}',
                          style: CommonStyles.getMontserratStyle(space_18, FontWeight.w600, CommonStyles.darkAmber),
                          children: <TextSpan>[
                            new TextSpan(
                              text: '+ \u20B950 delivery charges',
                              style: CommonStyles.getMontserratStyle(space_12, FontWeight.w600, CommonStyles.grey.withOpacity(0.6)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ProductDetailImgCarousalWidget extends StatefulWidget {
  List<String> bannerList;

  ProductDetailImgCarousalWidget({this.bannerList});

  @override
  _ProductDetailImgCarousalWidget createState() =>
      _ProductDetailImgCarousalWidget();
}

class _ProductDetailImgCarousalWidget
    extends State<ProductDetailImgCarousalWidget> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(context, space_250),
      child: Stack(
        children: [
          Container(
              width: double.infinity,
              height: getProportionateScreenHeight(context, space_250),
              child: Stack(
                children: [
                  Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                            height: getProportionateScreenHeight(
                                context, space_250),
                            viewportFraction: 1.0,
                            enlargeCenterPage: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                        carouselController: _controller,
                        items: widget.bannerList
                            .map((item) => Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: CommonStyles.lightGrey,
                              ),
                              height: getProportionateScreenHeight(
                                  context, space_250),
                              child: FadeInImage.assetNetwork(
                                placeholder:
                                "assets/images/loader.jpg",
                                image: widget.bannerList[_current],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ))
                            .toList(),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: space_15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              _controller.previousPage();
                            },
                            child: Card(
                              elevation: space_3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(space_20),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(space_5),
                                width: space_40,
                                height: space_40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: CommonStyles.darkAmber,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _controller.nextPage();
                            },
                            child: Card(
                              elevation: space_3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(space_20),
                              ),
                              child: Container(
                                width: space_40,
                                height: space_40,
                                padding: EdgeInsets.all(space_5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Transform.rotate(
                                    angle: 135,
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: CommonStyles.darkAmber,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.bannerList.map((url) {
                  int index = widget.bannerList.indexOf(url);
                  return _current == index
                      ? Container(
                    width: space_8,
                    height: space_8,
                    margin: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                        color: CommonStyles.amber,
                        border: Border.all(color: Colors.white),
                        shape: BoxShape.circle),
                  )
                      : Container(
                    width: space_8,
                    height: space_8,
                    margin: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CommonStyles.grey,
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}


class ProgressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

