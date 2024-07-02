import 'package:ecommerce_app_with_push_notification/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class ExpandableTextWidgets extends StatefulWidget {
  final String text;
  const ExpandableTextWidgets({super.key, required this.text});

  @override
  State<ExpandableTextWidgets> createState() => _ExpandableTextWidgetsState();
}

class _ExpandableTextWidgetsState extends State<ExpandableTextWidgets> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              color: Colors.grey, size: Dimensions.font16, text: firstHalf)
          : Column(
              children: [
                SmallText(
                  height: 1.8,
                  color: Colors.grey,
                  size: Dimensions.font16,
                  text: hiddenText
                      ? (firstHalf + "....")
                      : (firstHalf + secondHalf),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: "Show More",
                        color: Color(0XFF89dad0),
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: Color(0XFF89dad0),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
