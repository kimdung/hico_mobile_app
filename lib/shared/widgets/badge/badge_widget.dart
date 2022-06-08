import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../styles/text_style/app_text_style.dart';

class BadgeWidget extends StatelessWidget {
  final int badge;
  final bool isDart;

  const BadgeWidget({Key? key, this.badge = 0, this.isDart = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return badge == 0
        ? Container()
        : ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 15,
              minWidth: 15,
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDart
                      ? AppColor.primaryColorLight
                      : AppColor.accentColorLight,
                ),
                color: isDart
                    ? AppColor.accentColorLight
                    : AppColor.primaryColorLight,
              ),
              child: Center(
                child: Text(
                  badge.toString(),
                  style: AppTextStyle.secondTextStyle.copyWith(
                      color: isDart
                          ? AppColor.primaryColorLight
                          : AppColor.accentColorLight,
                      fontSize: 8,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          );
  }
}
