import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app_with_push_notification/utils/dimensions.dart';
import 'package:ecommerce_app_with_push_notification/widgets/big_text.dart';
import 'package:ecommerce_app_with_push_notification/widgets/icon_and_text_widgets.dart';
import 'package:ecommerce_app_with_push_notification/widgets/small_text.dart';
import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0;

  double _scaleFactor = 0.8;

  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!.toInt();
        print("Current Value is " + _currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: Colors.blue,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(
            left: Dimensions.width30,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: "-",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food Pairing"),
              ),
            ],
          ),
        ),
        Container(
          height: 900,
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: Dimensions.height10,
                      top: Dimensions.height10),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius20,
                            ),
                            color: Colors.white38,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/food_1.1.png"),
                            )),
                      ),
                      Container(
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();

    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven ? Color(0XFF69c5df) : Color(0XFF9294cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/food_1.1.png",
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0XFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Color(0XFFe8e8e8),
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Color(0XFFe8e8e8),
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: 15.0,
                  left: 15.0,
                  right: 15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: 'Chinese Side'),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) {
                              return Icon(
                                Icons.star,
                                color: Colors.blueAccent,
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        SmallText(text: "4.5"),
                        SizedBox(
                          width: 7,
                        ),
                        SmallText(text: "1287"),
                        SizedBox(
                          width: 7,
                        ),
                        SmallText(text: "Comments"),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          text: "Normal",
                          iconColor: Colors.blueAccent,
                        ),
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          text: "1.7km",
                          iconColor: Colors.blueAccent,
                        ),
                        IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          text: "32min",
                          iconColor: Colors.blueAccent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
