import 'package:flutter/material.dart';

/// changes the layout based on the size of the screen
///
/// [mobile] the widget to display on phone
///
/// [tablet] widget to display on tablet, if none use same as [mobile]
///
/// [desktop] widget to display on desktop, if none use the same widget as [tablet]
class Responsive extends StatelessWidget {
  Widget mobile;
  Widget tablet;
  Widget desktop;

  Responsive({this.mobile, this.tablet, this.desktop});

  /// Returns if the screen is mobile sized (anything less than 800)
  static bool ismobil(BuildContext context) =>
      MediaQuery.of(context).size.width <= 799;

  /// returns if the screen is tablet suze (anything greater that 800)
  static bool istablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800;

  /// returns if the screen is desktop suze (anything greater that 1300)
  static bool isdesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1300;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1300) {
          return desktop;
        } else if (constraints.maxWidth >= 800) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
