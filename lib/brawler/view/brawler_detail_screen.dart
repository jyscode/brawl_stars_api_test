import 'package:brawl_api/common/layout/default_layout.dart';
import 'package:brawl_api/model/brawler_model.dart';
import 'package:flutter/material.dart';

class BrawlerDetailScreen extends StatelessWidget {
  final BrawlerModel model;

  const BrawlerDetailScreen({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: model.name,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(model.name),
            ...model.starPowers.map((e) => Text(e.name.toString())).toList(),
            ...model.gadgets.map((e) => Text(e.name.toString())).toList(),
          ],
        ),
      )
    );
  }
}
