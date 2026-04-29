import 'package:flutter/material.dart';
import '../theme/colors.dart';

class OrangeBorderScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;

  const OrangeBorderScaffold({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: kOrange, width: 5.0),
          ),
          child: body,
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
