import 'package:flutter/material.dart';

class SliverTextBox extends StatelessWidget {
  final String text;
  final double hight;

  const SliverTextBox({Key key, @required this.text, this.hight = 15.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: hight,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
