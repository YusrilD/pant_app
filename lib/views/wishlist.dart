import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_plant_app/model/category_list.dart';
import 'package:flutter_plant_app/service/preferences/preferences.dart';

class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final List<CategoryList> _wishlist = <CategoryList>[];

  @override
  void initState() {
    Preferences.getWishlist().then((value) {
      print("Checking value of wishlist 1 : $value");
      if (value != null && value is String) {
        var result = jsonDecode(value) as List;
        setState(() {
          for (var item in result) {
            _wishlist.add(
              CategoryList.fromJson(item),
            );
            _wishlist.reversed.toList();
          }
          // result.forEach((element) {
          //   _wishlist.add(
          //     CategoryList.fromJson(element),
          //   );
          //   _wishlist.reversed.toList();
          // });
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Checking value of wishlist after proses ${_wishlist.length}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Wishlist",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_backspace,
            color: Colors.grey,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.topCenter,
        child: ListView.builder(
          itemCount: _wishlist.length,
          shrinkWrap: true,
          reverse: true,
          itemBuilder: (context, index) {
            return InkWell(
              child: Card(
                margin: EdgeInsets.fromLTRB(
                  16,
                  index == _wishlist.length - 1 ? 20 : 0,
                  16,
                  20,
                ),
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            '${_wishlist[index].image}',
                            width: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _wishlist[index].title.toString(),
                              ),
                              Text(
                                _wishlist[index].type.toString(),
                              ),
                              Text(
                                '\$${_wishlist[index].price.toString()}',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        height: 70,
                        child: IconButton(
                            icon: Icon(
                              Icons.close,
                              size: 18,
                            ),
                            onPressed: () {
                              _wishlist.removeWhere((element) =>
                                  element.title == _wishlist[index].title);
                              Preferences.setWishlist(jsonEncode(_wishlist));
                              setState(() {});
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
