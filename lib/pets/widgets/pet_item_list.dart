import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class PetItemList extends StatelessWidget {
  final String name;
  final String breed;
  PetItemList({
    Key? key, required this.name, required this.breed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.pets, size: 60),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: CustomTextStyle.header),
              Text(breed, style: CustomTextStyle.subheadergrey),
            ],
          ),
        ],
      ),
    );
  }
}
