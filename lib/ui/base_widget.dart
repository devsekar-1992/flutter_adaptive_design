import 'package:adaptive_design/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import './sizing_information.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;
  const ResponsiveBuilder({required this.builder});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return builder(
            context,
            SizingInformation(
              orientation: mediaQuery.orientation,
              deviceScreenType: getDeviceType(mediaQuery),
              screenSize: mediaQuery.size,
              localWidgetSize:
                  Size(constraints.maxWidth, constraints.maxHeight),
            ));
      },
    );
  }
}
