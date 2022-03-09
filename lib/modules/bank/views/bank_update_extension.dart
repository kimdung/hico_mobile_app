part of 'bank_update_screen.dart';

extension BankUpdateExtension on BankUpdateScreen {
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

  Widget _buildInputBankName() {
    return TextFormField(
      controller: controller.bankName,
      keyboardType: TextInputType.text,
      decoration: TextFieldDecoration.borderOutline(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.sixTextColorLight,
        labelText: 'profile.update.bank_name'.tr,
        labelStype: TextAppStyle().smallTextGrey(),
        //hintText: 'profile.update.bank_name'.tr,
        // hintStype: TextAppStyle().secondTextStyle().copyWith(
        //       color: AppColor.dividerColorLight,
        //     ),
        radius: 6,
      ),
      style: TextAppStyle().smallTextGrey(),
      // validator: (value) =>
      //     (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    );
  }

  Widget _buildInputBranchName() {
    return TextFormField(
      controller: controller.bankBranchName,
      keyboardType: TextInputType.text,
      decoration: TextFieldDecoration.borderOutline(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.sixTextColorLight,
        labelText: 'profile.update.branch_name'.tr,
        labelStype: TextAppStyle().smallTextGrey(),
        radius: 6,
      ),
      style: TextAppStyle().smallTextGrey(),
      // validator: (value) =>
      //     (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    );
  }

  Widget _buildInputBankAccount() {
    return TextFormField(
      controller: controller.bankAccountHolder,
      keyboardType: TextInputType.text,
      decoration: TextFieldDecoration.borderOutline(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.sixTextColorLight,
        labelText: 'profile.update.bank_account'.tr,
        labelStype: TextAppStyle().smallTextGrey(),
        radius: 6,
      ),
      style: TextAppStyle().smallTextGrey(),
      // validator: (value) =>
      //     (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    );
  }

  Widget _buildInputBankNumber() {
    return Stack(
      children: [
        TextFormField(
          controller: controller.bankAccountNumber,
          keyboardType: TextInputType.text,
          decoration: TextFieldDecoration.borderOutline(
            backgroundColor: AppColor.primaryBackgroundColorLight,
            borderColor: AppColor.sixTextColorLight,
            labelText: 'profile.update.bank_number'.tr,
            labelStype: TextAppStyle().smallTextGrey(),
            radius: 6,
          ),
          style: TextAppStyle().smallTextGrey(),
          // validator: (value) =>
          //     (value == null || value.isEmpty) ? 'data_requied'.tr : null,
        ),
        Positioned(
          right: 8,
          top: 11,
          child: FCoreImage(IconConstants.icBankIcon),
        ),
      ],
    );
  }
}
