import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final double width;
  final double hight;
  final double iconsize;
  final double radius;
  final String label;
  final Function ontap;
  final Color color;
  final IconData icon;

  const RoundedIconButton(
      {Key key,
      this.iconsize = 20.0,
      this.width = 90.0,
      this.hight = 25.0,
      this.ontap,
      @required this.color,
      this.radius = 25.0,
      @required this.label,
      @required this.icon})
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: color,
                  size: iconsize,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(label, style: TextStyle(color: color))
              ],
            )));
  }
}