part of 'support_screen.dart';

extension SupportExtension on SupportScreen {
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColor.fifthTextColorLight,
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColor.fifthTextColorLight,
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

  Widget _buildInputContent() {
    return TextFormField(
      controller: controller.contents,
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColor.fifthTextColorLight,
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
