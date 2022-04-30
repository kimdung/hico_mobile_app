import 'package:get/get.dart';
import '../../resource/config/config_environment.dart';

class ConfigService {
  Future<EnvConfiguration> init(String environment) async {
    // Get.lazyPut<EnvConfiguration>(
    //     () => EnvConfiguration(environment: environment));
    // return EnvConfiguration(environment: environment);

    final envConfiguration = EnvConfiguration(environment: environment);
    Get.put<EnvConfiguration>(envConfiguration);
    return envConfiguration;
  }
}
