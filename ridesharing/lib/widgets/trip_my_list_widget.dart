import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../http/response/trip.dart';
import '../http/response/trip_entity.dart';

class MyTripListItemWidget extends StatelessWidget {
  final Trip content;
  const MyTripListItemWidget(this.content, {Key? key}) : super(key: key);

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
            Text('Name:${content.name}'),
            Text('Start:${content.start}'),
            Text('End:${content.end}'),
            Text('date:${content.date}'),
            Text('Avaliable Seat:${content.seat}'),
            Text('Phone Number:${content.number}'),
          ],
        ),
      ),
    );
  }
}
