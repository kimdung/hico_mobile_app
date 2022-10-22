import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../call/pickup/picker_layout.dart';
import '../controllers/chat_controller.dart';
import 'channel_header_custom.dart';

class ChatScreen extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    final customTheme = StreamChatThemeData.fromTheme(Get.theme).merge(
      StreamChatThemeData(
        channelHeaderTheme: const StreamChannelHeaderThemeData(),
        channelPreviewTheme: StreamChannelPreviewThemeData(
          avatarTheme: StreamAvatarThemeData(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        imageHeaderTheme: const StreamGalleryHeaderThemeData(),
        messageListViewTheme: StreamMessageListViewThemeData(
          backgroundColor: AppColor.secondBackgroundColorLight,
        ),
        ownMessageTheme: StreamMessageThemeData(
          messageBackgroundColor: AppColor.primaryColorLight,
          messageTextStyle: TextStyle(color: AppColor.secondTextColorLight),
        ),
        otherMessageTheme: StreamMessageThemeData(
          messageBackgroundColor: AppColor.primaryBackgroundColorLight,
          messageTextStyle: TextStyle(color: AppColor.thirdTextColorLight),
          avatarTheme: StreamAvatarThemeData(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        messageInputTheme: StreamMessageInputThemeData(
          inputBackgroundColor: AppColor.secondBackgroundColorLight,
          // activeBorderGradient:
          //     LinearGradient(colors: [AppColor.primaryBackgroundColorLight]),
          // idleBorderGradient:
          //     LinearGradient(colors: [AppColor.primaryBackgroundColorLight]),
        ),
      ),
    );

    return PickupLayout(
      controller.callMethods,
      scaffold: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, widget) => StreamChat(
          streamChatThemeData: customTheme,
          client: AppDataGlobal.client!,
          child: widget,
          onBackgroundEventReceived: (event) async {
            final currentUserId = AppDataGlobal.client?.state.currentUser?.id;
            if (![EventType.messageNew, EventType.notificationMessageNew]
                    .contains(event.type) ||
                event.user?.id == currentUserId) {
              return;
            }
            if (event.message == null) {
              return;
            }
            final flutterLocalNotificationsPlugin =
                FlutterLocalNotificationsPlugin();
            const initializationSettings = InitializationSettings(
              android: AndroidInitializationSettings('app_icon'),
              iOS: IOSInitializationSettings(),
            );
            await flutterLocalNotificationsPlugin
                .initialize(initializationSettings);
            final id = event.message?.id.hashCode;
            if (id == null) {
              return;
            }
            await flutterLocalNotificationsPlugin.show(
              id,
              event.message?.user?.name,
              event.message?.text,
              const NotificationDetails(
                android: AndroidNotificationDetails(
                  'message channel',
                  'Message channel',
                  channelDescription: 'Channel used for showing messages',
                  priority: Priority.high,
                  importance: Importance.high,
                ),
                iOS: IOSNotificationDetails(),
              ),
            );
          },
        ),
        home: StreamChannel(
          channel: controller.channel,
          child: _buildBodyContent(),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Scaffold(
      backgroundColor: AppColor.secondBackgroundColorLight,
      appBar: ChannelHeaderCustom(
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
            StreamUserAvatar(
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
        actions: controller.isNotCall
            ? []
            : [
                IconButton(
                  icon: SvgPicture.asset(
                    IconConstants.icCall,
                  ),
                  onPressed: controller.onCall,
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    IconConstants.icVideoCall,
                  ),
                  onPressed: controller.onVideo,
                ),
              ],
      ),
      body: Column(
        children: <Widget>[
          const Expanded(
            child: StreamMessageListView(
              showFloatingDateDivider: false,
            ),
          ),
          StreamMessageInput(
            showCommandsButton: false,
            // actionsLocation: ActionsLocation.rightInside,
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
