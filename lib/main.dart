import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_plant_app/views/dashboard_alt.dart';
import 'package:flutter_plant_app/views/main_screen.dart';
import 'package:flutter_plant_app/shared/assets.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var mediaWidth = MediaQuery.of(context).size.width;
    var mediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: mediaWidth,
            height: mediaHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExactAssetImage(Assets.imgLoginBg),
              ),
            ),
            // color: Colors.green,
          ),
          //Image.asset(),
          Center(
            child: Container(
              width: mediaWidth,
              height: mediaHeight,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.white,
              ),
              margin: const EdgeInsets.fromLTRB(20, 150, 20, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 50),
                            width: 120,
                            height: 120,
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blueGrey.withOpacity(0.2),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(math.pi),
                              child: Container(
                                width: 100,
                                height: 120,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: ExactAssetImage(
                                      Assets.imgLoginPage,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Tandur",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Wrap(
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Plant a ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    letterSpacing: 2),
                              ),
                              TextSpan(
                                text: 'tree, ',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 25,
                                    letterSpacing: 2),
                              ),
                              TextSpan(
                                text: 'green ',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 25,
                                    letterSpacing: 2),
                              ),
                              TextSpan(
                                text: 'the earth',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    letterSpacing: 2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DashboardAlt(),
                            ),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: mediaWidth,
                          margin: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Colors.green,
                          ),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 45),
                        child: const InkWell(
                          child: Text(
                            "Crete an Account",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
