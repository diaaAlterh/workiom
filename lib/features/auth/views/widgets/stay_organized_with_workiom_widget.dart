import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workiom/core/views/widgets/hide_child_when_keyboard_opened.dart';

import '../../../../gen/assets.gen.dart';

class StayOrganizedWithWorkiomWidget extends StatelessWidget {
  const StayOrganizedWithWorkiomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HideChildWhenKeyboardOpened(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 16, bottom: 48),
        child: Hero(
          tag: 'stay_organized_with',
          child: Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'stay_organized_with'.tr(),
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: Color(0xFF555555)),
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                  onPressed: (){
                launchUrl(Uri.parse('https://workiom.com'));
              },child: Assets.images.logoWithTitle.svg()),
            ],
          ),
        ),
      ),
    );
  }
}
