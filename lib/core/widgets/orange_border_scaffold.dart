import 'package:flutter/material.dart';

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
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFEDEBE5), Color(0xFFDCC7A4)],
          ),
        ),
        child: SafeArea(child: body),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
