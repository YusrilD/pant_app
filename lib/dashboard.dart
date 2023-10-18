import 'package:flutter/material.dart';
import 'package:flutter_plant_app/controller/dashboard_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_plant_app/app/shared/constant.dart';
import 'package:flutter_plant_app/shared/assets.dart';
import 'package:flutter_plant_app/views/detail_page.dart';
import 'package:flutter_plant_app/views/wishlist.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  final ctrl = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.01),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: Card(
                        elevation: 0,
                        child: TextField(
                          controller: ctrl.searchBarController.value,
                          autofocus: false,
                          style: const TextStyle(
                              // fontFamily:  "OpenSans400",
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              letterSpacing: -0.33,
                              color: Colors.grey),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            counterText: '',
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            hintText: "Search here...",
                            hintStyle: const TextStyle(fontSize: 14),
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.5),
                            ),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WishlistPage(),
                          ),
                        );
                        // setState(() {
                        //   if (isFavoriteClicked) {
                        //     isFavoriteClicked = false;
                        //   } else {
                        //     isFavoriteClicked = true;
                        //   }
                        // });
                      },
                      child: Icon(
                        !ctrl.isFavoriteClicked.value
                            ? Icons.favorite_border
                            : Icons.favorite,
                        color: !ctrl.isFavoriteClicked.value
                            ? Colors.grey
                            : Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          '${Assets.imgNotification}',
                          width: 20,
                          height: 20,
                          color: Colors.grey,
                        ),
                        Positioned(
                          right: 1,
                          top: 0,
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            child: const Text(
                              "2",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
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
            const SizedBox(
              height: 0,
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 35,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      const Radius.circular(10),
                    ),
                    color: Color(0xFFfeeeb3),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        decoration: const BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            shape: BoxShape.rectangle,
                            color: Colors.white),
                        alignment: Alignment.center,
                        child: Image.asset('${Assets.imgHomeProfile}'),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Today tips",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Wrap(
                              children: [
                                const Text(
                                  "Give enough water to maximize plant growth",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 10,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('${Assets.imgHomeDialog}'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 100.0,
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) => Container(
                  margin: const EdgeInsets.only(left: 16, right: 10),
                  child: InkWell(
                    onTap: () {
                      ctrl.indexSelectedMenu.value = index;
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: index == ctrl.indexSelectedMenu.value
                                ? Colors.white
                                : ctrl.upperMenuColor[index],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: index == ctrl.indexSelectedMenu.value
                                    ? Colors.grey.withOpacity(0.5)
                                    : Colors.white,
                                blurRadius: 9,
                                offset: Offset.zero,
                              ),
                            ],
                          ),
                          child: SvgPicture.asset(
                            ctrl.menuImages[index],
                            color: ctrl.iconMenuColor[index],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          ctrl.upperMenu[index],
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: index == 0
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 20),
              height: 50.0,
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) => Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: InkWell(
                    onTap: () {
                      ctrl.indexSelectedCategory.value = index;
                    },
                    child: Column(
                      children: [
                        Text(
                          ctrl.middleMenu[index],
                          style: TextStyle(
                            fontSize: 14,
                            color: index == ctrl.indexSelectedCategory.value
                                ? Colors.green
                                : Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (index == ctrl.indexSelectedCategory.value)
                          Container(
                            width: 7,
                            height: 7,
                            margin: const EdgeInsets.only(
                              top: 5,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            categoryListWidget1(context),
          ],
        ),
      ),
    );
  }

  Widget categoryListWidget1(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listCategory.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              ctrl.indexSelectedItems.value = index;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailCategory(
                    title: listCategory[index].title,
                    price: listCategory[index].price,
                    description: listCategory[index].description,
                    image: listCategory[index].image,
                    listImage: listCategory[index].imageList!,
                    type: listCategory[index].type,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(
                left: 16,
              ),
              child: Stack(
                children: [
                  Container(width: 150, height: 230),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 6.5,
                      width: 140,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: index == ctrl.indexSelectedItems.value
                            ? Colors.white
                            : Colors.blueGrey.withOpacity(0.09),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: index == ctrl.indexSelectedItems.value
                                ? Colors.grey
                                : Colors.white,
                            blurRadius:
                                index == ctrl.indexSelectedItems.value ? 09 : 0,
                            offset: Offset.zero,
                          ),
                        ],
                      ),
                      child: Container(
                        margin:
                            const EdgeInsets.only(left: 10, right: 10, top: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listCategory[index].title!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  listCategory[index].type!,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "\$" + listCategory[index].price.toString(),
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    top: 0,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 155,
                        width: 140,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: ExactAssetImage(listCategory[index].image!),
                          ),
                        ),
                        // child: Text(listCategory[index].image),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
