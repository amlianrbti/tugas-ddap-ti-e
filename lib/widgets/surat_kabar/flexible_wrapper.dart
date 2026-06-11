import 'package:flutter/material.dart';

class FlexibleWrapper extends StatelessWidget {
  final bool isDesktop;
  final int flex;
  final Widget child;

  const FlexibleWrapper({
    super.key,
    required this.isDesktop,
    required this.child,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return isDesktop
        ? Expanded(
            flex: flex,
            child: child,
          )
        : child;
  }
}