import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../constants/colors.dart';
import '../../theme/theme_decoration.dart';
import 'drop_down_input_page.dart';
import 'drop_down_modal.dart';

class DropdownItem<T> {
  final String text;
  final T value;

  DropdownItem(this.text, this.value);
}

class DropdownInput<T> extends StatefulWidget {
  final List<DropdownItem<T>?>? items;

  final Function(T value)? onChanged;
  final T? value;
  final String? labelText;
  final String? errorText;
  final Widget? suffixIcon;
  final String? placeholder;
  final EdgeInsets? contentPadding;
  final bool isRequired;
  final FormFieldValidator<String>? validator;
  const DropdownInput({
    Key? key,
    this.items = const [],
    this.onChanged,
    this.value,
    this.labelText,
    this.errorText,
    this.placeholder,
    this.suffixIcon,
    this.contentPadding,
    this.isRequired = false,
    this.validator,
  }) : super(key: key);

  @override
  _DropdownInputState<T> createState() => _DropdownInputState<T>();
}

class _DropdownInputState<T> extends State<DropdownInput<T>> {
  static const int MAX_ITEMS_IN_MODAL_BOTTOM_ALLOWED = 5;
  TextEditingController controller = TextEditingController();
  T? _currentValue;

  T? get currentValue => _currentValue;
  set currentValue(T? value) {
    _currentValue = value;

    setState(() {
      final text = _getSelectedItem(_currentValue)?.text ??
          widget.items?.first?.text ??
          '';
      controller.text = text;
    });
  }

  List<DropdownItem<T>?>? get sortedItem {
    final listItem = widget.items ?? [];
    if (listItem.isNotEmpty) {
      listItem.sort((a, b) {
        return a?.text.compareTo(b?.text ?? '') ?? 0;
      });
    }
    return listItem;
  }

  DropdownItem? _getSelectedItem(T? value) {
    return sortedItem?.firstWhereOrNull((element) => element?.value == value);
  }

  @override
  void initState() {
    super.initState();

    currentValue = widget.value;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currentValue = widget.value;
  }

  @override
  void didUpdateWidget(covariant DropdownInput<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      currentValue = widget.value;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ThemeDecoration.textFieldWithShadow,
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 12),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.labelText,
                    style: ThemeDecoration.textLabelForm,
                  ),
                  widget.isRequired
                      ? TextSpan(
                          text: ' *',
                          style:
                              Theme.of(context).textTheme.subtitle1?.copyWith(
                                    color: AppColor.accent,
                                  ),
                        )
                      : const TextSpan(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextFormField(
              readOnly: true,
              controller: controller,
              validator: widget.validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: ThemeDecoration.inputNoneBorder.copyWith(
                hintText: widget.placeholder,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: AppColor.gray1),
                suffixIconConstraints: const BoxConstraints(
                  maxHeight: 32,
                  minHeight: 32,
                ),
                suffixIcon: Container(
                  width: 24,
                  child: _buildSuffix(),
                ),
                errorText: widget.errorText,
              ),
              onTap: _onInputPressed,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuffix() {
    return widget.suffixIcon ??
        const Icon(
          Icons.keyboard_arrow_down,
          color: AppColor.textBlack,
        );
  }

  Future<void> _onInputPressed() async {
    final value = await _showDialogPicker();

    if (value != null) {
      final selectedValue = value as DropdownItem<T>;

      currentValue = selectedValue.value;
      widget.onChanged!(selectedValue.value);
    }
  }

  Future<dynamic> _showDialogPicker() {
    if ((sortedItem?.length ?? 0) < MAX_ITEMS_IN_MODAL_BOTTOM_ALLOWED) {
      return Get.bottomSheet(
        DropdownModal(
          items: sortedItem,
          value: widget.value,
          label: widget.labelText,
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        backgroundColor: AppColor.primaryBackgroundColorLight,
        enableDrag: true,
        isDismissible: true,
      );
    }
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DropdownPage<T>(
                items: sortedItem,
                value: widget.value,
                label: widget.labelText)));
  }
}
