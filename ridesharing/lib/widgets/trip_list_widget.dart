import 'package:bruno/bruno.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../http/response/trip.dart';

class TripListItemWidget extends StatelessWidget {
  final Trip content;
  final VoidCallback onPressed;
  const TripListItemWidget(this.content, this.onPressed, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.only(left: 15),
        width: double.infinity,
        height: 140,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name:${content.name}'),
                Text('Start:${content.start}'),
                Text('End:${content.end}'),
                Text('date:${content.date}'),
                Text('Avaliable Seat:${content.seat}'),
                Text('Phone Number:${content.number}'),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
