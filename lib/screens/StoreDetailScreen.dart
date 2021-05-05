import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_petkon/bloc/CommonBloc.dart';
import 'package:flutter_petkon/bloc/CommonEvent.dart';
import 'package:flutter_petkon/bloc/CommonState.dart';
import 'package:flutter_petkon/inherited/StateContainer.dart';
import 'package:flutter_petkon/model/FilterData.dart';
import 'package:flutter_petkon/model/get_all_product_res.dart';
import 'package:flutter_petkon/model/login_response.dart';
import 'package:flutter_petkon/screens/FilterScreen.dart';
import 'package:flutter_petkon/utils/CommonStyles.dart';
import 'package:flutter_petkon/utils/Constants.dart';
import 'package:flutter_petkon/utils/size_config.dart';
import 'package:flutter_petkon/widgets/CommonWidget.dart';

class StoreDetailScreen extends StatefulWidget {
  var vendorId;
  StoreDetailScreen(this.vendorId);
  @override
  _StoreDetailScreenState createState() => new _StoreDetailScreenState();
}


class _StoreDetailScreenState extends State<StoreDetailScreen> {
  var scrollController = new ScrollController();
  var scrollOffset = 0.0;
  var mCurrentTab = "product";
  TextEditingController searchController = new TextEditingController();
  CommonBloc commonBloc = new CommonBloc();
  var token = "";
  LoginResponse loginResponse;
  GetAllProductRes mGetAllProductRes;
  List<Products> mProductList = List();
  var isSearchEnabled = false;


  @override
  void didChangeDependencies() {
    var selectedCurrentLoc = StateContainer.of(context).mLoginResponse;
    loginResponse = StateContainer.of(context).mLoginResponse;
    if (loginResponse != null) {
      token = loginResponse.token;
      debugPrint("ACCESSING_INHERITED ${token}");
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    scrollController.addListener(() => setState(() {}));
    super.initState();

   /* searchController.addListener(() {
      isSearchEnabled = true;
      debugPrint("Product Searching ${searchController.text}, ${mGetAllProductRes?.products?.length}");
      mProductList?.clear();
      if(searchController?.text?.isNotEmpty){
        debugPrint("Product Searching NON-EMPTY");
        mGetAllProductRes?.products?.forEach((element) {
          if(element?.productName?.toLowerCase()?.contains(searchController?.text?.toLowerCase())){
            mProductList?.add(element);
          }else if(element?.animalType?.toLowerCase()?.contains(searchController?.text?.toLowerCase())){
            mProductList?.add(element);
          }
        });
      }else{
        mProductList = mGetAllProductRes?.products;
      }
      setState(() {
        mProductList = mProductList;
      });
    });*/

  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("ARRAYPOPULATEBUILD --> ${mGetAllProductRes?.products?.length}");
    return BlocProvider(
      create: (context) => commonBloc..add(GetAllProductsEvent(token: token,vendorId: widget.vendorId)),
      child: BlocListener(
          cubit: commonBloc,
          listener: (context, state) {
            debugPrint("ARRAYPOPULATlistener --> ${mGetAllProductRes?.products?.length}");
            if (state is GetAllProductResState) {
              mGetAllProductRes = state.res;
            }
          },
          child: BlocBuilder<CommonBloc, CommonState>(
            builder: (context, state) {
              debugPrint("ARRAYPOPULATBlocBuilder --> ${mGetAllProductRes?.products?.length}");
              if (state is GetAllProductResState) {
                if(state?.res?.status){
                  return getScreenUI(state.res);
                }else{
                  return ProgressWidget();
                }
              } else {
                return ProgressWidget();
              }
            },
          )),
    );
  }

  getScreenUI(GetAllProductRes getAllProductRes) {
    if(!isSearchEnabled){
      mGetAllProductRes = getAllProductRes;
      debugPrint("ARRAYPOPULATE4 --> ${getAllProductRes?.products?.length}");
      mProductList = mGetAllProductRes?.products;
      debugPrint("ARRAYPOPULATE2 --> ${mProductList?.length}");
    }

    var offrs = mGetAllProductRes?.vendor?.offerText?.split("off");
    var percentOff = offrs[0];
    var txtOff = offrs[1];
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                new SliverAppBar(
                  expandedHeight: 200.0,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  pinned: true,
                  flexibleSpace: Transform.translate(
                    offset: const Offset(0.0, 25.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(space_25),
                          bottomRight: Radius.circular(space_25)),
                      child: new FlexibleSpaceBar(
                        background: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(space_25),
                                  bottomLeft: Radius.circular(space_25)),
                            ),
                            child: FadeInImage.assetNetwork(
                              placeholder: "assets/images/loader.jpg",
                              image: "${mGetAllProductRes?.vendor?.storeImage}",
                              fit: BoxFit.contain,
                            )),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: space_15),
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: space_50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${mGetAllProductRes?.vendor?.storeName}",
                              style: CommonStyles.getMontserratStyle(
                                  space_20,
                                  FontWeight.w800,
                                  CommonStyles.grey.withOpacity(0.8)),
                            ),
                            SizedBox(
                              height: space_8,
                            ),

                            SizedBox(
                              height: space_8,
                            ),
                            Text(
                              "${mGetAllProductRes?.vendor?.storeDescription}",
                              style: CommonStyles.getMontserratStyle(
                                  space_14,
                                  FontWeight.w600,
                                  CommonStyles.grey.withOpacity(0.8)),
                            ),
                            SizedBox(
                              height: space_8,
                            ),
                            RichText(
                              text: new TextSpan(
                                text: '${percentOff}OFF ',
                                style: CommonStyles.getMontserratStyle(space_18,
                                    FontWeight.w600, CommonStyles.darkAmber),
                                children: <TextSpan>[
                                  new TextSpan(
                                    text: '${txtOff}',
                                    style: CommonStyles.getMontserratStyle(
                                        space_12,
                                        FontWeight.w600,
                                        CommonStyles.grey.withOpacity(0.8)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/heart.png",
                              width: space_25,
                              height: space_25,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: space_20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              mCurrentTab = "product";
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: space_15,
                                left: space_35,
                                right: space_15,
                                bottom: space_8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(
                                        top: space_15, bottom: space_8),
                                    child: Text(
                                      "Products",
                                      style: CommonStyles.getMontserratStyle(
                                          space_15,
                                          FontWeight.w600,
                                          mCurrentTab == "product"
                                              ? CommonStyles.darkAmber
                                              : CommonStyles.grey
                                                  .withOpacity(0.5)),
                                    )),
                                mCurrentTab == "product"
                                    ? Container(
                                        height: space_3,
                                        width: space_80,
                                        color: mCurrentTab == "product"
                                            ? CommonStyles.darkAmber
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
                        GestureDetector(
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
                                      style: CommonStyles.getMontserratStyle(
                                          space_15,
                                          FontWeight.w600,
                                          mCurrentTab == "review"
                                              ? CommonStyles.darkAmber
                                              : CommonStyles.grey
                                                  .withOpacity(0.5)),
                                    )),
                                mCurrentTab == "review"
                                    ? Container(
                                        height: space_3,
                                        width: space_80,
                                        color: mCurrentTab == "review"
                                            ? CommonStyles.darkAmber
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
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: space_20,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                            flex: 8,
                            child: Container(
                              child: SearchTextInputWidget(
                                  searchController, false, TextInputType.name),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                                child: IconButton(
                                    icon: Icon(
                                      Icons.filter_list,
                                      color: CommonStyles.amber,
                                    ),
                                    onPressed: () {
                                      openFilter(mGetAllProductRes?.filterPet);
                                    }))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: space_25,
                  ),
//                  Text(
//                    "Foods",
//                    style: CommonStyles.getMontserratStyle(space_15,
//                        FontWeight.w600, CommonStyles.grey.withOpacity(0.8)),
//                  ),
//                  SizedBox(
//                    height: space_15,
//                  ),
//                  Container(
//                    child: Container(
//                      child: GridView.builder(
//                        shrinkWrap: true,
//                        primary: false,
//                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                          childAspectRatio: getWidthToHeightRatio(context),
//                          crossAxisCount: 2,
//                          crossAxisSpacing: 5.0,
//                          mainAxisSpacing: 5.0,
//                        ),
//                        itemCount: 2,
//                        itemBuilder: (context, index) {
//                          return ItemCardNoMarginWidget();
//                        },
//                      ),
//                    ),
//                  ),
                  SizedBox(
                    height: space_20,
                  ),
                  Text(
                    "Products",
                    style: CommonStyles.getMontserratStyle(space_15,
                        FontWeight.w600, CommonStyles.grey.withOpacity(0.8)),
                  ),
                  SizedBox(
                    height: space_15,
                  ),
                  Container(
                    child: Container(
                      child: GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: getProductsWidthToHeightRatio(context),
                          crossAxisCount: 2,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                        ),
                        itemCount: mProductList?.length,
                        itemBuilder: (context, index) {
                          return ProductItemCardNoMarginWidget(
                              mProductList[index],widget.vendorId);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
//          _buildFloatingActionButton(),
        ],
      ),
    );
  }

  openFilter(List<String> filterPet) async {
    var res = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FilterScreen(filterPet)),
    );
    isSearchEnabled = false;
    if (res != null && res is FilterData) {
      //commonBloc..add(GetAllProductsEvent(token: token, lowToHigh: res?.sortBy=="low"?"true":"false", highToLow: res?.sortBy=="high"?"true":"false", animalType: res?.foods));
    }
  }

  Positioned _buildFloatingActionButton() {
    final defaultTopMargin = 200.0 - 4.0;
    final startScale = 96.0;
    final endScale = startScale / 2;

    var top = defaultTopMargin;
    var scale = 1.0;

    if (scrollController.hasClients) {
      final offset = scrollOffset;
      top -= offset;
      if (offset < defaultTopMargin - startScale) {
        scale = 1.0;
      } else if (offset < defaultTopMargin - endScale) {
        scale = (defaultTopMargin - endScale - offset) / endScale;
      } else {
        scale = 0.0;
      }
    }
    debugPrint("OFFSET--> ${scale}");

    return new Positioned(
      child: new Transform.scale(
        scale: scale,
        child: Container(
          height: 80,
          width: 80,
          child: new FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {},
            child: Icon(Icons.photo),
          ),
        ),
      ),
      top: top,
      left: (MediaQuery.of(context).size.width / 2) - 40,
      right: (MediaQuery.of(context).size.width / 2) - 40,
    );
  }
}
