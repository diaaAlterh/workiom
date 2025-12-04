import 'package:flutter/material.dart';

class HideChildWhenKeyboardOpened extends StatelessWidget {
  final Widget child;

  const HideChildWhenKeyboardOpened({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      crossFadeState: MediaQuery.of(context).viewInsets.bottom == 0
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      firstChild: child,
      secondChild: const SizedBox(),
    );
  }
}
