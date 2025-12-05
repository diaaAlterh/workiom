import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsAndPrivacyText extends StatelessWidget {
  const TermsAndPrivacyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(color: Color(0xFF555555)),
          children: [
            TextSpan(text: '${"by_signing".tr()} '),
            TextSpan(
              text: "terms".tr(),
              style: const TextStyle(decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchUrl(Uri.parse('https://workiom.com/terms-conditions'));
                },
            ),
            TextSpan(text: " ${'and'.tr()} "),
            TextSpan(
              text: "privacy".tr(),
              style: const TextStyle(decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()..onTap = () {
                launchUrl(Uri.parse('https://workiom.com/privacy-policy'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
