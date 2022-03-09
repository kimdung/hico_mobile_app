import 'package:flutter/material.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';

class LanguageItem extends StatelessWidget {
  const LanguageItem({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 11),
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(27, 0, 27, 11),
                  child: Image.asset(
                    image,
                    width: 48,
                  ),
                ),
                Text(
                  title,
                  style: TextAppStyle().normalTextStype(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
