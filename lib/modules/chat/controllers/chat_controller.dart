import 'package:get/get.dart';
import 'package:stream_chat/stream_chat.dart';

import '../../../base/base_controller.dart';
import '../../../shared/constants/common.dart';

class ChatController extends BaseController {
  // final InvoiceModel invoiceModel;

  // final client = StreamChatClient('qrjjtnn5hv29', logLevel: Level.INFO);
  late Channel channel;
  late User user;

  @override
  Future<void> onInit() async {
    final arguments = Get.arguments as Map;
    channel = arguments[CommonConstants.CHANNEL];
    user = arguments[CommonConstants.CHAT_USER];
    await channel.watch();
    await channel.addMembers([user.id]);

    return super.onInit();
  }
}
