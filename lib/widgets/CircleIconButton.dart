import 'package:flutter/material.dart';

/// a circular button with an icon.
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
  /// [Icondata] to display in the middle of button.
  final IconData icon;

  /// what color the icon should be default is primary color of theme
  final Color iconcolor;

  /// How big the button should be if null it = 50.0.
  final double radious;

  /// if true then there is a transeparent background with a border
  final bool outlined;
  final Function ontap;

  /// defaults to accent color of theme
  final Color color;

  /// defaults to 25.0
  final double iconsize;

  /// if true then nothing happens when tapped on
  final bool disabled;

  /// Changes the color when dissabled.
  final Color disablecolor;

  const CircleIconButton(
      {Key key,
      @required this.icon,
      this.iconcolor,
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
    if (outlined) {
      return InkWell(
          onTap: disabled == false ? ontap : null,
          child: Container(
              width: radious,
              height: radious,
              //color: Theme.of(context).primaryColor,
              child: Center(
                child: Icon(
                  icon,
                  color: iconcolor != null
                      ? disabled
                          ? disablecolor != null
                              ? disablecolor
                              : Colors.grey
                          : iconcolor
                      : color != null
                          ? disabled
                              ? disablecolor == null
                                  ? Colors.grey
                                  : disablecolor
                              : color
                          : disabled
                              ? Colors.grey
                              : Theme.of(context).accentColor,
                  size: iconsize,
                ),
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: color != null
                          ? disabled
                              ? disablecolor != null
                                  ? disablecolor
                                  : Colors.grey
                              : color
                          : disabled
                              ? disablecolor != null
                                  ? disablecolor
                                  : Colors.grey
                              : Theme.of(context).accentColor))));
    } else {
      return InkWell(
          splashColor: Colors.red,
          onTap: disabled ? null : ontap,
          child: Container(
              width: radious,
              height: radious,
              //color: Theme.of(context).primaryColor,
              child: Center(
                child: Icon(
                  icon,
                  color: iconcolor != null
                      ? iconcolor
                      : Theme.of(context).primaryColor,
                  size: iconsize,
                ),
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: disabled
                      ? disablecolor != null
                          ? disablecolor
                          : Colors.grey
                      : color != null
                          ? color
                          : Theme.of(context).accentColor)));
    }
  }
}
