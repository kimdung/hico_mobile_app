part of 'account_screen.dart';

extension AccountExtension on AccountScreen {
  Widget buildItem({
    required String icon,
    required String title,
    Function()? onPress,
    Color? titleColor,
    int? allowArrow = 1,
  }) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColorLight.withOpacity(0.8),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
                child: Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 14),
                    child: FCoreImage(icon)),
                Text(
                  title,
                  style: TextAppStyle().genaralTextStyle().copyWith(
                        color: titleColor ?? Colors.black,
                      ),
                ),
              ],
            )),
            (allowArrow == 1)
                ? FCoreImage(IconConstants.icArrowForward)
                : Container()
          ],
        ),
      ),
    );
  }
}
