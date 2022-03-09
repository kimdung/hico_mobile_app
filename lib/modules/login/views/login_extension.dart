part of 'login_screen.dart';

extension _LoginExtension on LoginScreen {
  Widget _buildUsername() {
    return TextFormField(
      controller: controller.usernameController,
      autofocus: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      style: TextAppStyle().genaralTextStyle(),
      cursorColor: AppColor.fifthTextColorLight,
      decoration: TextFieldDecoration.borderLogin(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.dividerColorLight,
        hintText: ' Email',
        hintStype: TextAppStyle().genaralTextStyle(),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(15),
          child: FCoreImage(
            IconConstants.icShape,
          ),
        ),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      controller: controller.passwordController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: !controller.showPassword,
      cursorColor: AppColor.fifthTextColorLight,
      style: TextAppStyle().genaralTextStyle(),
      decoration: TextFieldDecoration.borderLogin(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.dividerColorLight,
        hintText: ' ${'password'.tr}',
        hintStype: TextAppStyle().genaralTextStyle(),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(15),
          child: FCoreImage(
            IconConstants.icLock,
          ),
        ),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    );
  }

  InkWell _buildSocialBtn(Function()? onPress, String icon) {
    return InkWell(
      onTap: onPress,
      child: Container(
        child: Image.asset(
          icon,
          width: 48,
        ),
      ),
    );
  }
}
