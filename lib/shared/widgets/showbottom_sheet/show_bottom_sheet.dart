import 'package:flutter/material.dart';

class ShowBottomSheet {
  Future<void> showBottomSheet(
      {required Widget child,
      required BuildContext context,
      required Function(dynamic) onValue}) async {
    await showModalBottomSheet<dynamic>(
        useRootNavigator: false,
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        builder: (BuildContext bc) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [child],
          );
        }).then((value) => onValue(value));
  }
}
