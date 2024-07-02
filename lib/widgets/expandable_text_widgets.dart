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
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
