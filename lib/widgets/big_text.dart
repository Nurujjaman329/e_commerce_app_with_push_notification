import 'package:ecommerce_app_with_push_notification/utils/dimensions.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow textOverFlow;
  BigText({
    super.key,
    this.color = const Color(0XFF332d3b),
    required this.text,
    this.size = 0,
    this.textOverFlow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverFlow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size == 0 ? Dimensions.font20 : size,
      ),
    );
  }
}
