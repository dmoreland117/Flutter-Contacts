import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final double width;
  final double hight;
  final Function ontap;
  final Color color;
  final double radius;
  final String label;

  const RoundedButton(
      {Key key,
      this.width = 90.0,
      this.hight = 25.0,
      this.ontap,
      @required this.color,
      this.radius = 25.0,
      @required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        splashColor: color,
        onTap: ontap,
        child: Container(
          height: hight,
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: color),
              borderRadius: BorderRadius.all(Radius.circular(radius))),
          child: Center(
              child: Text(
            label,
            style: TextStyle(color: color),
          )),
        ));
  }
}