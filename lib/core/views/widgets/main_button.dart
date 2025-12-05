import 'dart:ffi';

import 'package:flutter/material.dart';
import 'loader_widget.dart';

class MainButton extends StatelessWidget {
  final String? title;
  final Widget? child;
  final VoidCallback? onPressed;
  final bool isLoading;
  final ButtonType buttonType;
  final Widget? icon;
  final Color? color;
  final Color? borderColor;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final double? elevation;
  final OutlinedBorder? shape;

  const MainButton({
    super.key,
    this.title,
    required this.onPressed,
    this.isLoading = false,
    this.buttonType = ButtonType.elevated,
    this.icon,
    this.color,
    this.borderColor,
    this.padding,
    this.shape,
    this.backgroundColor,
    this.elevation,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case ButtonType.elevated:
        return SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: elevation,
              backgroundColor:
                  backgroundColor ?? Theme.of(context).colorScheme.primary,
              padding: padding,
              shape: shape,
              shadowColor: elevation == null ? null : Colors.transparent,
              foregroundColor: color ?? Colors.white,
            ),
            onPressed: onPressed,
            child: isLoading
                ? const LoaderWidget(color: Colors.white)
                : child ??
                      Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if(icon!=null) icon!,
                          if (title?.isNotEmpty ?? false) Text(title ?? ''),
                        ],
                      ),
          ),
        );
      case ButtonType.outlined:
        return SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: padding,
              shape: shape,
              foregroundColor: color,
              backgroundColor: backgroundColor,
              side: BorderSide(
                color: borderColor ?? Theme.of(context).colorScheme.secondary,
              ),
            ),
            onPressed: onPressed,
            child: isLoading
                ? LoaderWidget(color: borderColor)
                : child ??
                      Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if(icon!=null) icon!,
                          if (title?.isNotEmpty ?? false) Text(title ?? ''),
                        ],
                      ),
          ),
        );
    }
  }
}

enum ButtonType { elevated, outlined }
