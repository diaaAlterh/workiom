import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class PasswordValidationWidget extends StatefulWidget {
  const PasswordValidationWidget({super.key});

  @override
  State<PasswordValidationWidget> createState() =>
      _PasswordValidationWidgetState();
}

class _PasswordValidationWidgetState extends State<PasswordValidationWidget> {
  @override
  Widget build(BuildContext context) {
    bool isValid = false;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 8,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            AnimatedContainer(
              height: 8,
              duration: Duration(milliseconds: 300),
              width: MediaQuery.of(context).size.width * (isValid ? 1 : 0.5),
              decoration: BoxDecoration(
                color: isValid ? Color(0xFF5BD77E) : Color(0xFFF5C044),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 250),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          child: isValid
              ? Row(
            key: ValueKey('valid'),
            children: [
              Assets.images.iconCheck.svg(),
              SizedBox(width: 8),
              Text(
                'password_validation_success'.tr(),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
              : Row(
            key: ValueKey('invalid'),
            children: [
              Assets.images.iconWarning.svg(),
              SizedBox(width: 8),
              Text(
                'password_validation_error'.tr(),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4,),
        Row(
          children: [
            Assets.images.iconWarning.svg(),
            SizedBox(width: 8),
            Text(
              'password_validation_error_1'.tr(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Color(0xFF555555)
              ),
            ),
          ],
        ),
        Row(
          children: [
            Assets.images.iconWarning.svg(),
            SizedBox(width: 8),
            Text(
              'password_validation_error_2'.tr(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Color(0xFF555555)
              ),
            ),
          ],
        ),
      ],
    );
  }
}
