import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:workiom/core/utils/validators.dart';
import '../../../../gen/assets.gen.dart';

class PasswordValidationWidget extends StatelessWidget {
  final List<PasswordRuleResult> rules;

  const PasswordValidationWidget({super.key, required this.rules});

  @override
  Widget build(BuildContext context) {
    bool isValid = rules.every((e) => e.isValid);
    double percent = calculatePasswordStrength(rules);

    if (rules.isEmpty) {
      return SizedBox();
    }
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
              width: MediaQuery.of(context).size.width * percent,
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
        SizedBox(height: 4),
        Column(
          children: rules
              .map(
                (e) => Row(
                  children: [
                    AnimatedCrossFade(
                      firstChild: Assets.images.iconCheck.svg(),
                      secondChild: Assets.images.iconWarning.svg(),
                      crossFadeState: e.isValid
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: Duration(milliseconds: 300),
                    ),
                    SizedBox(width: 8),
                    Text(
                      e.rule,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Color(0xFF555555),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  double calculatePasswordStrength(List<PasswordRuleResult> rules) {
    if (rules.isEmpty) return 1;

    final validCount = rules.where((r) => r.isValid).length;
    return (validCount / rules.length);
  }
}
