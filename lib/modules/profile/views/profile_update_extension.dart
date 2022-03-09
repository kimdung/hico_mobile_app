part of 'profile_update_screen.dart';

extension ProfileUpdateExtension on ProfileUpdateScreen {
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
        hintText: 'support.hint_name'.tr,
        hintStype: TextAppStyle().smallTextGrey(),
        radius: 6,
      ),
      style: TextAppStyle().smallTextGrey(),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'support.hint_name'.tr : null,
    );
  }

  Widget _buildInputBirthDay(BuildContext context) {
    return BoxDecorationWidget(
      height: 42,
      border: Border.all(color: AppColor.borderGrayColorLight),
      radius: 6,
      child: InkWell(
        onTap: () {
          controller.showDate(context);
        },
        child: Row(
          children: [
            Expanded(
              child: Container(
                width: Get.width,
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  controller.birthDay.value != ''
                      ? controller.birthDay.value
                      : 'MM/DD/YYYY',
                  style: TextAppStyle().smallTextGrey(),
                ),
              ),
            ),
            FCoreImage(
              IconConstants.icCalendar,
              width: 24,
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );

    // Stack(
    //   children: [
    //     TextFormField(
    //       keyboardType: TextInputType.text,
    //       autovalidateMode: AutovalidateMode.onUserInteraction,
    //       decoration: TextFieldDecoration.borderOutline(
    //         backgroundColor: AppColor.primaryBackgroundColorLight,
    //         borderColor: AppColor.sixTextColorLight,
    //         hintText: 'MM/DD/YYYY',
    //         hintStype: TextAppStyle().smallTextGrey(),
    //         radius: 6,
    //       ),
    //       style: TextAppStyle().smallTextGrey(),
    //       validator: (value) =>
    //           (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    //     ),
    //     Positioned(
    //       right: 8,
    //       top: 11,
    //       child: FCoreImage(IconConstants.icCalendar),
    //     ),
    //   ],
    // );
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
        hintText: 'support.hint_email'.tr,
        hintStype: TextAppStyle().smallTextGrey(),
        radius: 6,
      ),
      style: TextAppStyle().smallTextGrey(),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'support.hint_email'.tr : null,
    );
  }

  Widget _buildInputPhone() {
    return TextFormField(
      controller: controller.phone,
      keyboardType: TextInputType.text,
      cursorColor: AppColor.fifthTextColorLight,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: TextFieldDecoration.borderOutline(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.sixTextColorLight,
        hintText: 'support.hint_phone'.tr,
        hintStype: TextAppStyle().smallTextGrey(),
        radius: 6,
      ),
      style: TextAppStyle().smallTextGrey(),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'support.hint_phone'.tr : null,
    );
  }

  Widget _buildInputBankName() {
    return TextFormField(
      controller: controller.bankName,
      keyboardType: TextInputType.text,
      cursorColor: AppColor.fifthTextColorLight,

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
      cursorColor: AppColor.fifthTextColorLight,

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
      cursorColor: AppColor.fifthTextColorLight,

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
          cursorColor: AppColor.fifthTextColorLight,

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
        // Positioned(
        //   right: 8,
        //   top: 11,
        //   child: FCoreImage(IconConstants.icBankIcon),
        // ),
      ],
    );
  }

  Widget _buildInputRadio() {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: GeneralButton(
              onPressed: () {
                if (controller.genderId.value != CommonConstants.male) {
                  controller.selectGender(CommonConstants.male);
                }
              },
              borderRadius: BorderRadius.circular(4),
              borderColor: AppColor.primaryColorLight,
              backgroundColor: controller.genderId.value == CommonConstants.male
                  ? AppColor.primaryColorLight
                  : null,
              height: 31,
              child: Text(
                'profile.male'.tr,
                style: controller.genderId.value == CommonConstants.male
                    ? TextAppStyle().titleButtonStyle()
                    : TextAppStyle().titleButtonPinkStyle(),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: GeneralButton(
              onPressed: () {
                if (controller.genderId.value != CommonConstants.female) {
                  controller.selectGender(CommonConstants.female);
                }
              },
              borderRadius: BorderRadius.circular(4),
              borderColor: AppColor.primaryColorLight,
              backgroundColor:
                  controller.genderId.value == CommonConstants.female
                      ? AppColor.primaryColorLight
                      : null,
              height: 31,
              child: Text(
                'profile.female'.tr,
                style: controller.genderId.value == CommonConstants.female
                    ? TextAppStyle().titleButtonStyle()
                    : TextAppStyle().titleButtonPinkStyle(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonGradient({required String title, Function()? onPress}) {
    return AppGradientButton(
      onPressed: onPress,
      borderRadius: BorderRadius.circular(4),
      height: 31,
      shadow: 0,
      child: Text(
        title,
        style: TextAppStyle().titleButtonStyle(),
      ),
    );
  }

  Widget _buildButtonBorder({required String title, Function()? onPress}) {
    return AppGradientBorderButton(
      onPressed: onPress,
      borderRadius: BorderRadius.circular(4),
      height: 31,
      child: Text(
        title,
        style: TextAppStyle().titleButtonStyle().copyWith(
              color: AppColor.primaryTextColorLight,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }

  Widget buildImageList({
    required String firstImage,
    String? firstImageTitle,
    Function()? onPressBefore,
    required String secondImage,
    String? secondImageTitle,
    Function()? onPressAfter,
  }) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: _buildImageItem(
                image: firstImage,
                title: firstImageTitle,
                onPress: onPressBefore),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildImageItem(
                image: secondImage,
                title: secondImageTitle,
                onPress: onPressAfter),
          ),
        ],
      ),
    );
  }

  Widget _buildImageItem(
      {required String image, String? title, Function()? onPress}) {
    return Column(
      children: [
        InkWell(
          onTap: onPress,
          child: Container(
            height: 119,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FCoreImage(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        if (title != null)
          Text(
            title,
            style: TextAppStyle().genaralTextStyle(),
          ),
        const SizedBox(height: 12),
      ],
    );
  }
}
