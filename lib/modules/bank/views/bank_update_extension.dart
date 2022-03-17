part of 'bank_update_screen.dart';

extension BankUpdateExtension on BankUpdateScreen {
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
      height: 47,
      border: Border.all(color: AppColor.sixTextColorLight),
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
                  style: textColor ?? TextAppStyle().smallTextGrey(),
                ),
              ),
            ),
            if (prefixIcon)
              FCoreImage(
                prefixImage ?? IconConstants.icArrowDown,
                width: 24,
              ),
            SizedBox(width: paddingRight ?? 10),
          ],
        ),
      ),
    );
  }

  Widget _buildInputBranchName() {
    return TextFormField(
      controller: controller.bankBranchName,
      keyboardType: TextInputType.text,
      cursorColor: Colors.grey,
      decoration: TextFieldDecoration.borderOutline(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.sixTextColorLight,
        labelText: 'profile.update.branch_name'.tr,
        labelStype: TextAppStyle().smallTextGrey(),
        radius: 6,
      ),
      style: TextAppStyle().smallTextGrey(),
    );
  }

  Widget _buildInputBankAccount() {
    return TextFormField(
      controller: controller.bankAccountHolder,
      keyboardType: TextInputType.text,
      cursorColor: Colors.grey,
      decoration: TextFieldDecoration.borderOutline(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.sixTextColorLight,
        labelText: 'profile.update.bank_account'.tr,
        labelStype: TextAppStyle().smallTextGrey(),
        radius: 6,
      ),
      style: TextAppStyle().smallTextGrey(),
    );
  }

  Widget _buildInputBankNumber() {
    return TextFormField(
      controller: controller.bankAccountNumber,
      keyboardType: TextInputType.text,
      cursorColor: Colors.grey,
      decoration: TextFieldDecoration.borderOutline(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.sixTextColorLight,
        labelText: 'profile.update.bank_number'.tr,
        labelStype: TextAppStyle().smallTextGrey(),
        radius: 6,
      ),
      style: TextAppStyle().smallTextGrey(),
    );
  }
}
