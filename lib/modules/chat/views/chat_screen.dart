import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../controllers/chat_controller.dart';

class ChatScreen extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    final customTheme = StreamChatThemeData.fromTheme(Get.theme).merge(
      StreamChatThemeData(
        channelHeaderTheme: ChannelHeaderThemeData(),
        channelPreviewTheme: ChannelPreviewThemeData(
          avatarTheme: AvatarThemeData(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        messageListViewTheme: MessageListViewThemeData(
          backgroundColor: AppColor.secondBackgroundColorLight,
        ),
        ownMessageTheme: MessageThemeData(
          messageBackgroundColor: AppColor.primaryColorLight,
          messageTextStyle: TextStyle(color: AppColor.secondTextColorLight),
        ),
        otherMessageTheme: MessageThemeData(
          messageBackgroundColor: AppColor.primaryBackgroundColorLight,
          messageTextStyle: TextStyle(color: AppColor.thirdTextColorLight),
          avatarTheme: AvatarThemeData(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        messageInputTheme: MessageInputThemeData(
          inputBackgroundColor: AppColor.secondBackgroundColorLight,
          // activeBorderGradient:
          //     LinearGradient(colors: [AppColor.primaryBackgroundColorLight]),
          // idleBorderGradient:
          //     LinearGradient(colors: [AppColor.primaryBackgroundColorLight]),
        ),
      ),
    );

    return StreamChat(
      streamChatThemeData: customTheme,
      client: AppDataGlobal.client!,
      child: StreamChannel(
        channel: controller.channel,
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Scaffold(
      backgroundColor: AppColor.secondBackgroundColorLight,
      appBar: ChannelHeader(
        backgroundColor: AppColor.secondBackgroundColorLight,
        leading: IconButton(
          icon: SvgPicture.asset(
            IconConstants.icBack,
            width: 11,
          ),
          onPressed: Get.back,
        ),
        title: Row(
          children: [
            UserAvatar(
              user: controller.user,
              borderRadius: BorderRadius.circular(24),
              constraints: const BoxConstraints.tightFor(
                height: 48,
                width: 48,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                Text(
                  controller.user.name,
                  style: TextAppStyle().secondTextStyle().copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          ],
        ),
        subtitle: Container(),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              IconConstants.icCall,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              IconConstants.icVideoCall,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          const Expanded(
            child: MessageListView(),
          ),
          MessageInput(
            showCommandsButton: false,
            actionsLocation: ActionsLocation.rightInside,
            attachmentButtonBuilder: (context, icon) {
              return icon.copyWith(
                icon: SvgPicture.asset(IconConstants.icImage),
              );
            },
            idleSendButton: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset(IconConstants.icSend),
            ),
            activeSendButton: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset(IconConstants.icSend),
            ),
          ),
        ],
      ),
    );
  }
}
