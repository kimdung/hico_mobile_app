import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../../constants/colors.dart';
import 'drop_down_widget.dart';

class DropdownModal<T> extends StatelessWidget {
  final List<DropdownItem<T>?>? items;
  final T? value;
  final String? label;

  const DropdownModal({Key? key, this.items, this.value, this.label})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [
          ListTile(
            title: Text(
              label ?? '',
              style: Get.textTheme.headline6?.copyWith(fontSize: 16),
            ),
          ),
          ...List.generate(
            items!.length,
            (index) => ListTile(
              title: Text(
                items![index]!.text,
                style: Get.textTheme.subtitle1?.copyWith(fontSize: 14),
              ),
              onTap: () {
                final value = items![index]!;
                Get.back(result: value);
                // Navigator.pop(context, value);
              },
              trailing: value == items![index]!.value
                  ? const Icon(
                      Icons.check,
                      color: AppColor.primary,
                      size: 24,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
