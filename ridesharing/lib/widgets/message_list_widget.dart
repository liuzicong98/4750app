import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../http/response/trip_entity.dart';

class MessageListItemWidget extends StatelessWidget {
  final TripData content;
  final VoidCallback onPressed;
  const MessageListItemWidget(this.content, this.onPressed, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.only(left: 15),
        width: double.infinity,
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name:${content.trip!.name}'),
            Text('Phone Number:${content.trip!.number}'),
            Text('join name:${content.user!.username}'),
            Text('join user Number:${content.user!.number}')
          ],
        ),
      ),
    );
  }
}
