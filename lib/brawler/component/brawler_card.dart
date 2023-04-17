import 'package:brawl_api/model/brawler_model.dart';
import 'package:flutter/material.dart';

class BrawlerCard extends StatelessWidget {
  final Widget image;
  final String name;

  const BrawlerCard({
    required this.image,
    required this.name,
    Key? key,
  }) : super(key: key);

  factory BrawlerCard.fromModel({
    required BrawlerModel model,
  }) {
    return BrawlerCard(
      image: Image.asset('asset/img/${model.id}'),
      name: model.name,
    );
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        image,
        Text(name.toString()),
      ],
    );
  }
}
