import 'package:flutter/material.dart';
import '../theme/colors.dart';

// Thin wrapper kept for backward compatibility with older migrated screens.
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
      backgroundColor: backgroundColor ?? kWhite,
      body: SafeArea(child: body),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
