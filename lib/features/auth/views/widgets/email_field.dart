import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/validators.dart';
import '../../../../gen/assets.gen.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;

  const EmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'your_work_email'.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Row(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Assets.images.iconEmail.svg(),
            ),
            Expanded(
              child: TextFormField(
                style: Theme.of(context).textTheme.titleLarge,
                keyboardType: TextInputType.emailAddress,
                validator: Validators.validateEmail,
                textInputAction: TextInputAction.next,
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'email'.tr(),
                  suffixIcon: Focus(
                    canRequestFocus: false,
                    descendantsAreFocusable: false,
                    child: IconButton(
                      tooltip: 'clear'.tr(),
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        controller.clear();
                      },
                      padding: EdgeInsets.zero,
                      icon: Assets.images.iconClear.svg(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
