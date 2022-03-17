part of 'consulting_screen.dart';

extension ConsultingExtension on ConsultingScreen {
  Widget _buildLabel({required String title, int? required = 0}) {
    return Row(
      children: [
        Text(
          title,
          style: TextAppStyle().genaralTextStyle().copyWith(
                color: Colors.black,
                fontSize: 16,
              ),
        ),
        required == 1
            ? Text(
                ' *',
                style: TextAppStyle().genaralTextStyle().copyWith(
                      color: AppColor.primaryColorLight,
                      fontSize: 16,
                    ),
              )
            : Container(),
      ],
    );
  }

  Widget _buildInputFullname() {
    return TextFormField(
      controller: controller.name,
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColor.fifthTextColorLight,
      decoration: TextFieldDecoration.borderOutline(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.sixTextColorLight,
        hintText: ' ${'support.hint_name'.tr}',
        hintStype: TextAppStyle().normalTextGrey(),
        radius: 6,
      ),
      style: TextAppStyle().normalTextGrey(),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'support.hint_name'.tr : null,
    );
  }

  Widget _buildInputEmail() {
    return TextFormField(
      controller: controller.email,
      keyboardType: TextInputType.text,
      cursorColor: AppColor.fifthTextColorLight,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: TextFieldDecoration.borderOutline(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.sixTextColorLight,
        hintText: ' ${'support.hint_email'.tr}',
        hintStype: TextAppStyle().normalTextGrey(),
        radius: 6,
      ),
      style: TextAppStyle().normalTextGrey(),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'support.hint_email'.tr : null,
    );
  }

  Widget _buildInputPhone() {
    return TextFormField(
      controller: controller.phone,
      keyboardType: TextInputType.number,
      cursorColor: AppColor.fifthTextColorLight,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: TextFieldDecoration.borderOutline(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.sixTextColorLight,
        hintText: ' ${'support.hint_phone'.tr}',
        hintStype: TextAppStyle().normalTextGrey(),
        radius: 6,
      ),
      style: TextAppStyle().normalTextGrey(),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'support.hint_phone'.tr : null,
    );
  }

  Widget buildSelectComponent({
    required String title,
    bool prefixIcon = false,
    String? prefixImage,
    double? paddingRight,
    bool shadow = false,
    bool border = true,
    TextStyle? textColor,
    double? padding,
    double? height,
    Function()? onPress,
  }) {
    return BoxDecorationWidget(
      height: height ?? 50,
      shadow: shadow,
      border: Border.all(color: Colors.grey),
      radius: 6,
      child: InkWell(
        onTap: onPress,
        child: Row(
          children: [
            Expanded(
              child: Container(
                width: Get.width,
                padding: EdgeInsets.only(left: padding ?? 6),
                child: Text(
                  title,
                  style: textColor ?? TextAppStyle().normalTextGrey(),
                ),
              ),
            ),
            if (prefixIcon)
              FCoreImage(
                prefixImage ?? IconConstants.icArrowDown,
                width: 24,
              ),
            SizedBox(width: paddingRight ?? 16),
          ],
        ),
      ),
    );
  }

  Widget _buildInputService() {
    return TextFormField(
      controller: controller.service,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: TextFieldDecoration.borderOutline(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.sixTextColorLight,
        hintText: ' ${'support.hint_service'.tr}',
        hintStype: TextAppStyle().normalTextGrey(),
        radius: 6,
      ),
      style: TextAppStyle().normalTextGrey(),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    );
  }

  Widget _buildInputContent() {
    return TextFormField(
      controller: controller.contents,
      keyboardType: TextInputType.text,
      cursorColor: AppColor.sixTextColorLight,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: 4,
      decoration: TextFieldDecoration.borderOutline(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.sixTextColorLight,
        hintText: ' ${'support.hint_content'.tr}',
        hintStype: TextAppStyle().normalTextGrey(),
        radius: 6,
      ),
      style: TextAppStyle().normalTextGrey(),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'support.hint_content'.tr : null,
    );
  }
}
