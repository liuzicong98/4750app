import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';

import '../../utils/ThemeUtils.dart';
import '../../widgets/message_list_widget.dart';
import 'message_logic.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final MessageLogic logic = Get.put(MessageLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrnAppBar(
        brightness: Brightness.dark,
        backgroundColor: ThemeUtils.defaultColor,

        automaticallyImplyLeading: false,
        title: 'message',
      ),
      body: Obx(() {
        return EasyRefresh.custom(
          controller: logic.controller.value,
          enableControlFinishRefresh: true,
          enableControlFinishLoad: false,
          header: BallPulseHeader(),
          footer: BallPulseFooter(),
          firstRefresh: true,
          firstRefreshWidget: Center(
              child: LoadingFlipping.square(
            borderColor: Colors.cyan,
            size: 30.0,
          )),
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return MessageListItemWidget(logic.items[index], () {});
                },
                childCount: logic.items.length,
              ),
            ),
          ],
          onRefresh: logic.onRefresh,
          onLoad: logic.onLoad,
        );
      }),
    );
  }

  @override
  void dispose() {
    Get.delete<MessageLogic>();
    super.dispose();
  }
}
