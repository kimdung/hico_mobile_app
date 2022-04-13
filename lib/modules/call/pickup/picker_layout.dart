import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ui_api/models/call/call_model.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';
import '../../../../shared/methods/call_methods.dart';
import 'pickup_view.dart';

class PickupLayout extends GetView<BaseController> {
  final Widget scaffold;
  final CallMethods callMethods;

  PickupLayout(
    this.callMethods, {
    required this.scaffold,
  });

  @override
  Widget build(BuildContext context) {
    final userInfo = AppDataGlobal.userInfo;
    return (userInfo != null && userInfo.id != null)
        ? StreamBuilder<DocumentSnapshot>(
            stream: callMethods.callStream(uid: userInfo.id.toString()),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.data?.data() != null &&
                  snapshot.data?.data() is Map<String, dynamic>) {
                final data = snapshot.data!.data() as Map<String, dynamic>;
                try {
                  final call = CallModel.fromJson(data);
                  if (call.hasDialled != null && !call.hasDialled!) {
                    return PickupView(call: call);
                  }
                } catch (e) {
                  print(e.toString());
                }
              }
              return scaffold;
            },
          )
        : const Scaffold(
            body: Center(),
          );
  }
}
