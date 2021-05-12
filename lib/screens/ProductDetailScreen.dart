import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_petkon/Kconstants.dart';
import 'package:flutter_petkon/bloc/CommonBloc.dart';
import 'package:flutter_petkon/bloc/CommonEvent.dart';
import 'package:flutter_petkon/bloc/CommonState.dart';
import 'package:flutter_petkon/inherited/StateContainer.dart';
import 'package:flutter_petkon/model/get_product_detail_res.dart';
import 'package:flutter_petkon/model/myCartResponse.dart';
import 'package:flutter_petkon/screens/MyCart.dart';
import 'package:flutter_petkon/screens/OrdersScreen.dart';
import 'package:flutter_petkon/utils/CommonStyles.dart';
import 'package:flutter_petkon/utils/ReadMoreText.dart';
import 'package:flutter_petkon/widgets/CommonWidget.dart';
import 'package:flutter_petkon/utils/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailScreen extends StatefulWidget {
  var prodId;
  var vendorId;
  var token;
  ProductDetailScreen(this.prodId, this.vendorId, this.token);
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  TextEditingController searchController = new TextEditingController();
  var bannerlist = List<String>();
  var mCurrentTab = "detail";
  CommonBloc commonBloc = new CommonBloc();
  var loginResponse;
  var mHightToLow = "";
  var mLowToHigh = "";
  GetProductDetailRes mGetProductDetailRes;
  SharedPreferences prefs;
  var mQuantity = 1;
  MycartResponse addToCart;
  getsharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  @override
  void didChangeDependencies() {
    var selectedCurrentLoc = StateContainer.of(context).mLoginResponse;

    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => commonBloc
        ..add(
            GetProductDetailEvent(token: widget.token, prodId: widget.prodId)),
      child: BlocListener(
          cubit: commonBloc,
          listener: (context, state) {
            if (state is GetAllProductResState) {
              mGetProductDetailRes = state.res;
            } else if (state is AddCartResState) {
              addToCart = state.res;
              if (addToCart.status) {
                print("teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyCartScreen(
                            widget.token,
                          )),
                );
              }
            }
          },
          child: BlocBuilder<CommonBloc, CommonState>(
            builder: (context, state) {
              if (state is ProductDetailResState) {
                return getScreenUI(state.res);
              } else {
                return ProgressWidget();
              }
            },
          )),
    );
  }

  getScreenUI(GetProductDetailRes getProductDetailRes) {
    mGetProductDetailRes = getProductDetailRes;
    print("aaaaaaaaaaaaaaaaaaaa " +
        mGetProductDetailRes?.product?.productImage.length.toString());
    if (mGetProductDetailRes?.product?.productImage != null) {
      for (int i = 0;
          i < mGetProductDetailRes?.product?.productImage.length;
          i++) {
        print("aaaaaaaaaaaaaaaaaaaa " +
            mGetProductDetailRes?.product?.productImage[i]);
        bannerlist.add(mGetProductDetailRes?.product?.productImage[i]);
      }
    }

    // bannerlist[0] = mGetProductDetailRes?.product?.productImage!=null?"${mGetProductDetailRes?.product?.productImage}":"";
    return SafeArea(
      child: Scaffold(
        body: new Stack(
          children: <Widget>[
            NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  new SliverAppBar(
                    automaticallyImplyLeading: false,
                    expandedHeight:
                        getProportionateScreenHeight(context, space_250),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    pinned: true,
                    flexibleSpace: Transform.translate(
                      offset: const Offset(0.0, 0.0),
                      child: new FlexibleSpaceBar(
                        background: Container(
                            color: Colors.white,
                            child: Stack(
                              children: [
                                ProductDetailImgCarousalWidget(
                                    bannerList: bannerlist),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: space_15, vertical: space_10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          height: space_30,
                                          width: space_30,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.transparent,
                                          ),
                                          child: Center(
                                              child:
                                                  Icon(Icons.arrow_back_ios)),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                ];
              },
              body: Container(
                color: Colors.white,
                height: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: space_15),
                child: ListView(
                  children: [
                    SizedBox(
                      height: space_25,
                    ),
                    RichText(
                      text: new TextSpan(
                        text: '${mGetProductDetailRes?.product?.productName}',
                        style: CommonStyles.getMontserratStyle(
                            space_18, FontWeight.w600, Colors.black),
                        children: <TextSpan>[
                          new TextSpan(
                            text: ' ${mGetProductDetailRes?.product?.petType}',
                            style: CommonStyles.getMontserratStyle(
                                space_12,
                                FontWeight.w500,
                                CommonStyles.grey.withOpacity(0.8)),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "4.5",
                            style: CommonStyles.getMontserratStyle(
                                space_10,
                                FontWeight.w500,
                                CommonStyles.grey.withOpacity(0.8)),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: space_8),
                            child: RatingBarByRatingWidget(4.5, space_12)),
                      ],
                    ),
                    SizedBox(
                      height: space_8,
                    ),
                    Text(
                      "\u20B9${mGetProductDetailRes?.product?.sellingPrice}",
                      style: CommonStyles.getMontserratStyle(
                          space_20, FontWeight.w600, kPrimarycolor),
                    ),
                    SizedBox(
                      height: space_8,
                    ),
                    Text(
                      "${mGetProductDetailRes?.product?.productDescription}",
                      style: CommonStyles.getMontserratStyle(space_14,
                          FontWeight.w500, CommonStyles.grey.withOpacity(0.8)),
                    ),

                    SizedBox(
                      height: space_25,
                    ),
//                    ListView.builder(
//                        primary: false,
//                        shrinkWrap: true,
//                        itemCount: mGetProductDetailRes?.product?.unit!=null && mGetProductDetailRes?.product?.unit?.length>0? mGetProductDetailRes?.product?.unit?.length:0,
//                        itemBuilder: (context, index){
//                      return Row(
//                        children: [
//                          Expanded(
//                              flex: 3,
//                              child: Text(
//                                mGetProductDetailRes?.product?.unit[index]?.unitName,
//                                style: CommonStyles.getMontserratStyle(
//                                    space_15,
//                                    FontWeight.w600,
//                                    CommonStyles.grey.withOpacity(0.8)),
//                              )),
//                          Expanded(
//                              flex: 6,
//                              child: Wrap(
//                                direction: Axis.horizontal,
//                                children:
//                                  mGetProductDetailRes?.product?.unit[index]?.units.map((item) =>  Container(
//                                    width: space_80,
//                                    height: space_40,
//                                    child: Card(
//                                      elevation: space_3,
//                                      color: Colors.white,
//                                      shape: RoundedRectangleBorder(
//                                          borderRadius:
//                                          BorderRadius.circular(space_5)),
//                                      child: Container(
//                                        child: Center(
//                                          child: Text(
//                                            "${item?.name}",
//                                            style:
//                                            CommonStyles.getMontserratStyle(
//                                                space_14,
//                                                FontWeight.w500,
//                                                CommonStyles.grey),
//                                          ),
//                                        ),
//                                      ),
//                                    ),
//                                  )).toList().cast<Widget>()
//                              ))
//                        ],
//                      );
//                    }),
                    SizedBox(
                      height: space_15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(
                              "Quantity",
                              style: CommonStyles.getMontserratStyle(
                                  space_15,
                                  FontWeight.w600,
                                  CommonStyles.grey.withOpacity(0.8)),
                            )),
                        Expanded(
                            flex: 6,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (mQuantity > 1) {
                                      setState(() {
                                        mQuantity = mQuantity - 1;
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: space_36,
                                    height: space_36,
                                    child: Card(
                                      color: kPrimarycolor,
                                      elevation: space_1,
                                      shape: RoundedRectangleBorder(
                                          side:
                                              BorderSide(color: kPrimarycolor),
                                          borderRadius:
                                              BorderRadius.circular(space_18)),
                                      child: Center(
                                        child: Text(
                                          "-",
                                          style:
                                              CommonStyles.getMontserratStyle(
                                                  space_20,
                                                  FontWeight.w600,
                                                  Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(space_8),
                                  child: Text(
                                    "${mQuantity}",
                                    style: CommonStyles.getMontserratStyle(
                                        space_18,
                                        FontWeight.w500,
                                        CommonStyles.grey),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      mQuantity = mQuantity + 1;
                                    });
                                  },
                                  child: Container(
                                    width: space_36,
                                    height: space_36,
                                    child: Card(
                                      color: kPrimarycolor,
                                      elevation: space_1,
                                      shape: RoundedRectangleBorder(
                                          side:
                                              BorderSide(color: kPrimarycolor),
                                          borderRadius:
                                              BorderRadius.circular(space_18)),
                                      child: Center(
                                        child: Text(
                                          "+",
                                          style:
                                              CommonStyles.getMontserratStyle(
                                                  space_20,
                                                  FontWeight.w600,
                                                  Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                    SizedBox(
                      height: space_15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(
                              "Total",
                              style: CommonStyles.getMontserratStyle(
                                  space_18,
                                  FontWeight.w600,
                                  CommonStyles.grey.withOpacity(0.8)),
                            )),
                        Expanded(
                            flex: 6,
                            child: Text(
                              "\u20B9${mGetProductDetailRes?.product?.sellingPrice * mQuantity}",
                              style: CommonStyles.getMontserratStyle(
                                  space_22, FontWeight.w600, kPrimarycolor),
                            ))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: space_15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  mCurrentTab = "detail";
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: space_15,
                                    left: 0,
                                    right: space_15,
                                    bottom: space_8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(
                                            top: space_15, bottom: space_8),
                                        child: Text(
                                          "Details",
                                          style:
                                              CommonStyles.getMontserratStyle(
                                                  space_15,
                                                  FontWeight.w600,
                                                  mCurrentTab == "detail"
                                                      ? kPrimarycolor
                                                      : CommonStyles.grey
                                                          .withOpacity(0.5)),
                                        )),
                                    mCurrentTab == "detail"
                                        ? Container(
                                            height: space_3,
                                            width: space_80,
                                            color: mCurrentTab == "detail"
                                                ? kPrimarycolor
                                                : CommonStyles.grey
                                                    .withOpacity(0.5),
                                          )
                                        : Container(
                                            height: 0,
                                            width: 0,
                                          )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  mCurrentTab = "review";
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: space_15,
                                    left: space_15,
                                    right: space_35,
                                    bottom: space_8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(
                                            top: space_15, bottom: space_8),
                                        child: Text(
                                          "Review",
                                          style:
                                              CommonStyles.getMontserratStyle(
                                                  space_15,
                                                  FontWeight.w600,
                                                  mCurrentTab == "review"
                                                      ? kPrimarycolor
                                                      : CommonStyles.grey
                                                          .withOpacity(0.5)),
                                        )),
                                    mCurrentTab == "review"
                                        ? Container(
                                            height: space_3,
                                            width: space_80,
                                            color: mCurrentTab == "review"
                                                ? kPrimarycolor
                                                : CommonStyles.grey
                                                    .withOpacity(0.5),
                                          )
                                        : Container(
                                            height: 0,
                                            width: 0,
                                          )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: space_15,
                    ),
                    Text(
                      "Product information",
                      style: CommonStyles.getMontserratStyle(space_15,
                          FontWeight.w600, CommonStyles.grey.withOpacity(0.8)),
                    ),
                    SizedBox(
                      height: space_8,
                    ),
                    Text(
                      "Vendor : ${mGetProductDetailRes?.product?.productBrand}",
                      style: CommonStyles.getMontserratStyle(space_12,
                          FontWeight.w600, CommonStyles.grey.withOpacity(0.8)),
                    ),
                    SizedBox(
                      height: space_8,
                    ),
                    Text(
                      "Food type : ${mGetProductDetailRes?.product?.vegNonVeg}",
                      style: CommonStyles.getMontserratStyle(space_12,
                          FontWeight.w600, CommonStyles.grey.withOpacity(0.8)),
                    ),
                    SizedBox(
                      height: space_8,
                    ),
                    ReadMoreText(
                        "${mGetProductDetailRes?.product?.productDescription}",
                        colorClickableText: CommonStyles.amber,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '...read more ',
                        trimExpandedText: '...read less',
                        trimLines: 3,
//                          linkColor: Colors.blue,
                        style: CommonStyles.getMontserratStyle(
                            space_12,
                            FontWeight.w500,
                            CommonStyles.grey.withOpacity(0.8))),
                    SizedBox(
                      height: space_25,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            commonBloc
                              ..add(AddCartEvent(
                                  token: widget.token,
                                  vendorId: widget.vendorId,
                                  prodId: mGetProductDetailRes?.product?.id,
                                  qunatity: mQuantity.toString()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(space_15),
                            margin: EdgeInsets.all(space_15),
                            decoration: BoxDecoration(
                                border: Border.all(color: CommonStyles.grey),
                                borderRadius: BorderRadius.circular(space_10)),
                            child: Center(
                              child: Text(
                                "Add to cart",
                                style: CommonStyles.getMontserratStyle(space_15,
                                    FontWeight.w600, CommonStyles.grey),
                              ),
                            ),
                          ),
                        )),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyCartScreen(
                                        widget.token,
                                      )),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(space_15),
                            margin: EdgeInsets.all(space_15),
                            decoration: BoxDecoration(
                                color: kPrimarycolor,
                                border: Border.all(color: kPrimarycolor),
                                borderRadius: BorderRadius.circular(space_10)),
                            child: Center(
                              child: Text(
                                "Buy Now",
                                style: CommonStyles.getMontserratStyle(
                                    space_15, FontWeight.w600, Colors.white),
                              ),
                            ),
                          ),
                        )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  addProductToCart() async* {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
  }
}
