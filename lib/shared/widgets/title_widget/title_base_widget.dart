import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final EdgeInsets? padding;
  final Color? color;
  const TitleWidget({Key? key, required this.title, this.padding, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 8, top: 5),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: color ?? Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
