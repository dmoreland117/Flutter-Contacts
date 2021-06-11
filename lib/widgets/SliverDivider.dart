import 'package:flutter/material.dart';

class SliverDivider extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final double hight;

  const SliverDivider(
      {Key key,
      this.padding = const EdgeInsets.symmetric(horizontal: 10.0),
      this.hight = 1.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: padding,
        child: Divider(height: hight),
      ),
    );
  }
}