import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_plant_app/app/shared/global.dart';
import 'package:flutter_plant_app/model/category_list.dart';
import 'package:flutter_plant_app/model/image_detail_model.dart';
import 'package:flutter_plant_app/service/preferences/preferences.dart';
import 'package:flutter_plant_app/shared/assets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailCategory extends StatefulWidget {
  var title, price, description, image, type;
  var listImage = <ImageList>[];

  DetailCategory(
      {Key? key,
      this.title,
      this.price,
      this.description,
      this.image,
      required this.listImage,
      this.type})
      : super(key: key);

  @override
  _DetailCategoryState createState() => _DetailCategoryState();
}

class _DetailCategoryState extends State<DetailCategory> {
  int _sideList = 0;
  late int selectedIndex;
  bool isBecomeFavorite = false;
  int indexStatusChanger = 0;
  final List<CategoryList> _wishlist = <CategoryList>[];

  @override
  void initState() {
    Preferences.getWishlist().then((value) {
      if (value != null && value is String) {
        var result = jsonDecode(value) as List;
        setState(() {
          result.forEach((element) {
            _wishlist.add(
              CategoryList.fromJson(element),
            );
          });
          _wishlist.forEach((element) {
            print("Check ya ya : ${element.title} ");
            if (element.title == widget.title) {
              isBecomeFavorite = true;
            }
          });
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.grey.withOpacity(0.1),
        ),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 81,
                    ),
                    Stack(
                      children: [
                        Container(
                          // color: Colors.grey[100],
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: ExactAssetImage(
                                  '${_sideList == 0 ? widget.image : widget.listImage[selectedIndex].image}'),
                            ),
                          ),
                          // child: Text(widget.image),
                          alignment: Alignment.center,
                        ),
                        Positioned(
                          right: 0,
                          top: -30,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 1.2,
                            width: 60,
                            child: ListView.builder(
                              itemCount: widget.listImage.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      _sideList = 1;
                                      selectedIndex = index;
                                      indexStatusChanger = 1;
                                    });
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(5),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          color: indexStatusChanger == 0
                                              ? index == 0
                                                  ? Colors.white
                                                  : Colors.grey.withOpacity(0.1)
                                              : index == selectedIndex
                                                  ? Colors.white
                                                  : Colors.grey
                                                      .withOpacity(0.1),
                                          boxShadow: [
                                            BoxShadow(
                                              color: indexStatusChanger == 0
                                                  ? index == 0
                                                      ? Colors.grey
                                                      : Colors.transparent
                                                  : index == selectedIndex
                                                      ? Colors.grey
                                                      : Colors.transparent,

                                              //Colors.grey,
                                              blurRadius: 09,
                                              offset: Offset.zero,
                                            ),
                                          ],
                                          // image: DecorationImage(image: ExactAssetImage('${widget.listImage[index].image}')),
                                        ),
                                        child: Image.asset(
                                          '${widget.listImage[index].image}',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            margin: EdgeInsets.all(5),
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              color: indexStatusChanger == 0
                                                  ? index == 0
                                                      ? Colors.transparent
                                                      : Colors.white
                                                          .withOpacity(0.6)
                                                  : index == selectedIndex
                                                      ? Colors.transparent
                                                      : Colors.white
                                                          .withOpacity(0.6),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 16),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(
                              () {
                                if (isBecomeFavorite) {
                                  isBecomeFavorite = false;
                                  print("Siap siap atas : ${_wishlist.length}");
                                  _wishlist.removeWhere((element) =>
                                      element.title == widget.title);

                                  Preferences.setWishlist(
                                      jsonEncode(_wishlist));
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Berhasil ditambahkan ke wishtlist",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  isBecomeFavorite = true;

                                  //sharedPref
                                  var check = _wishlist.where((element) =>
                                      element.title == widget.title);
                                  if (check.isEmpty) {
                                    _wishlist.add(
                                      CategoryList(
                                        image: widget.image,
                                        title: widget.title,
                                        description: widget.description,
                                        price: widget.price,
                                        type: widget.type,
                                        imageList: widget.listImage,
                                      ),
                                    );
                                    Preferences.setWishlist(
                                        jsonEncode(_wishlist));
                                  }
                                }
                              },
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 20, right: 16),
                            child: Icon(
                              !isBecomeFavorite
                                  ? Icons.favorite_border
                                  : Icons.favorite,
                              color:
                                  !isBecomeFavorite ? Colors.grey : Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 16),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.type,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 16),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "\$" + widget.price.toString() + ".00",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 16, right: 16),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              top: 24.8,
              // kToolbarHeight - MediaQuery.of(context).padding.top + 8,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  height: kToolbarHeight,
                  color: Colors.grey.withOpacity(0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.keyboard_backspace,
                        color: Colors.grey,
                      ),
                      Icon(
                        Icons.more_vert,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        // color: Colors.white.withOpacity(0.8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white.withOpacity(0.2),
                              Colors.white,
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 0,
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 95,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 40,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange.withOpacity(0.2),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                                child: SvgPicture.asset(
                                  '${Assets.imgConversation}',
                                  width: 15,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                height: 40,
                                padding: EdgeInsets.all(2),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Text(
                                  "Add To Cart",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // child: Container(
                //   padding: EdgeInsets.symmetric(horizontal: 0),
                //   height: 115,
                //   child: Column(
                //     children: [
                //       Container(
                //         height: 55,
                //         width: MediaQuery.of(context).size.width,
                //         color: Colors.green,
                //       ),
                //       Container(
                //         color: Colors.white,
                //         alignment: Alignment.center,
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             InkWell(
                //               child: Container(
                //                 width: 55,
                //                 height: 55,
                //                 decoration: BoxDecoration(
                //                   color: Colors.deepOrange[200],
                //                   borderRadius: BorderRadius.all(
                //                     Radius.circular(5),
                //                   ),
                //                 ),
                //                 child: Icon(
                //                   Icons.chat,
                //                   color: Colors.brown[600],
                //                 ),
                //               ),
                //             ),
                //             SizedBox(
                //               width: 10,
                //             ),
                //             MaterialButton(
                //               elevation: 3,
                //               /*shape: RoundedRectangleBorder(
                // borderRadius: BorderRadius.circular(borderRadius ?? 5),
                // side: border != null
                //     ? BorderSide(
                //         color: borderColor ?? IzColor.purpleNew.withOpacity(0.8),
                //         width: 2)
                //     : BorderSide.none),*/
                //               color: Colors.green,
                //               child: Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Container(
                //                     width: 185,
                //                     child: Center(
                //                       child: Text(
                //                         "Lalalala",
                //                         style: TextStyle(
                //                           color: Colors.black,
                //                           fontSize: 16,
                //                           fontWeight: FontWeight.bold,
                //                           fontFamily: "OpenSans",
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               onPressed: () {},
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
