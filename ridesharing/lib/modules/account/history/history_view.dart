import 'package:bruno/bruno.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:ridesharing/http/response/trip.dart';

import '../../../utils/ThemeUtils.dart';
import '../../../widgets/trip_my_list_widget.dart';
import 'history_logic.dart';

class HistoryPage extends StatelessWidget {
  final logic = Get.put(HistoryLogic());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrnAppBar(
        brightness: Brightness.dark,
        backgroundColor: ThemeUtils.defaultColor,

        automaticallyImplyLeading: true,
        title: 'History',
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
                  return Slidable(
                      key: const ValueKey(0),
                      actionPane: SlidableDrawerActionPane(),
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'Delete',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () => {
                          // logic.delete(logic.items[index])
                          },
                        ),
                      ],
                      child: MyTripListItemWidget(logic.items[index]));
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
}
