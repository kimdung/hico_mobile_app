mixin ProductForm {
  final RegExp emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final RegExp phoneNumberRegex = RegExp(r'^(0)[0-9]{9}$');
  final RegExp cmnd_cccd_regex = RegExp(r'(^\d{9}$)|(^\d{12}$)');
  final int LIMIT_IDENTITY_DATE = 15 * 365; // 15 years old

  // Validator
  String? identityCardValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Không được để trống';
    } else if (!cmnd_cccd_regex.hasMatch(value)) {
      return 'Số CMND/CCCD không đúng';
    }
    return null;
  }

  String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Không được để trống';
    } else if (!phoneNumberRegex.hasMatch(value)) {
      return 'Số điện thoại này không đúng';
    }
    return null;
  }

  String? requiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Không được để trống';
    } else if (value is String) {
      return value.trim().isEmpty ? 'Không được để trống' : null;
    }
    return null;
  }

  String? emailValidator(String? value) {
    return (value == null ||
            value.toString().isEmpty ||
            emailRegex.hasMatch(value.toString()))
        ? null
        : 'Email không khả dụng';
  }
}
