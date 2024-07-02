import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widgets.dart';
import 'small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
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
    );
  }
}
