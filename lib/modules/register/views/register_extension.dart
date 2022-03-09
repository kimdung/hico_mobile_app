part of 'register_screen.dart';

extension _RegisterExtension on RegisterScreen {
  Widget _buildUsername() {
    return TextFormField(
      controller: controller.usernameController,
      autofocus: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      cursorColor: AppColor.fifthTextColorLight,
      style: TextAppStyle().genaralTextStyle(),
      decoration: TextFieldDecoration.borderLogin(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.dividerColorLight,
        hintText: ' Email',
        hintStype: TextAppStyle().genaralTextStyle(),
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
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    );
  }

  Widget _buildConfirmPassword() {
    return TextFormField(
        controller: controller.confirmPasswordController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: !controller.showPassword,
        cursorColor: AppColor.fifthTextColorLight,
        style: TextAppStyle().genaralTextStyle(),
        decoration: TextFieldDecoration.borderLogin(
          backgroundColor: AppColor.primaryBackgroundColorLight,
          borderColor: AppColor.dividerColorLight,
          hintText: ' ${'confirm_password'.tr}',
          hintStype: TextAppStyle().genaralTextStyle(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'data_requied'.tr;
          }
        });
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
