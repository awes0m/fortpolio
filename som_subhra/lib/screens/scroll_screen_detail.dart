import 'package:flutter/material.dart';

class ScrollScreenDetail extends StatelessWidget {
  const ScrollScreenDetail({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        SizedBox(height: height),
        Container(
          height: height,
          width: width,
          color: Colors.blueAccent,
        ),
      ]),
    );
  }
}
