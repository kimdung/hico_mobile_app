import 'package:get/get.dart';

import '../shared/network/bindings/network_binding.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get
      ..put(NetworkBinding(),
          permanent: true); // keep the class in memory with "permanent:true"
  }
}
