import 'package:chop_gang/core/variables/app_inset.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    this.bottomNavigationBar,
    this.appbar,

    this.padding = true,
    this.safeArea = true,
    super.key,
    this.backgroundColor,
  });

  final Widget body;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appbar;
  final bool padding;
  final Color? backgroundColor;
  final bool safeArea;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: true,
      body: padding
          ? Padding(
              padding: AppInset.screenSymmetric,
              child: body,
            )
          : body,
    );
  }
}
