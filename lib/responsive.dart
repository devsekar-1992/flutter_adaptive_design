import 'package:flutter/material.dart';

class AdaptiveLayoutDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return buildCenter(constraints);
        } else {
          return buildCenter(constraints);
        }
      },
    );
  }

  Center buildCenter(BoxConstraints constraints) {
    return Center(
      child: Container(
        child: Text(
          'Size' +
              constraints.maxWidth.toString() +
              '*' +
              constraints.maxHeight.toString(),
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
