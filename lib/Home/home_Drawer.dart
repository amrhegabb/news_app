// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeDrawer extends StatelessWidget {
  static const int settings = 2;
  static const int category = 1;
  Function onitemClick;
  HomeDrawer(
    this.onitemClick,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 64),
          color: Theme.of(context).primaryColor,
          child: const Text(
            "News App!",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        InkWell(
          onTap: () {
            onitemClick(category);
          },
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const ImageIcon(
                AssetImage("assets/images/IC_1.png"),
                size: 48,
              ),
              const Text(
                "Categories",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            onitemClick(settings);
          },
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const ImageIcon(
                AssetImage("assets/images/IC_2.png"),
                size: 48,
              ),
              const Text(
                "Settings",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    );
  }
}
