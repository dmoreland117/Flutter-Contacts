import 'package:flutter/material.dart';

/// a circular button with an icon.
///
/// [icon] the icon to putt in the button.
/// [radious] how big the button should be.
/// [color] what color the button should be, if left null it will be the accent color of the theme.
/// [outlined] if true buttons [color] wont be filled.
/// [iconsize] if null size is 25.0
///
/// Example
/// ```dart
/// CircleIconButton(
///   icon: Icons.phone,
///   radious: 40.0,
///   color: Colors.red,
///   iconsize: 40.0
///   outlined: true
///  )
/// ```
///
/// Example 2
/// ```dart
/// CircleIconButton(
///   icon: Icons.message_outlined,
///   radious: 35.0,
///   color: Theme.of(context).acentcolor,
///   iconsize: 40.0
///   outlined: false
///  )
/// ```
class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final double radious;
  final bool outlined;
  final Function ontap;
  final Color color;
  final double iconsize;
  final bool disabled;
  final Color disablecolor;

  const CircleIconButton(
      {Key key,
      @required this.icon,
      this.radious = 50.0,
      this.ontap,
      this.color,
      this.disabled = false,
      this.outlined = false,
      this.iconsize = 25.0,
      this.disablecolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: disabled == false ? ontap : null,
        child: Container(
            width: radious,
            height: radious,
            //color: Theme.of(context).primaryColor,
            child: Center(
              child: Icon(
                icon,
                color:
                    outlined == false ? Theme.of(context).primaryColor : color,
                size: iconsize,
              ),
            ),
            decoration: outlined == false
                ? BoxDecoration(
                    color:
                        color != null ? color : Theme.of(context).accentColor,
                    shape: BoxShape.circle)
                : BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: color != null
                            ? color
                            : Theme.of(context).accentColor))));
  }
}
