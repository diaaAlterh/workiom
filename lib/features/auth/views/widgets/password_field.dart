import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workiom/core/app_cubit/base_state.dart';
import 'package:workiom/features/auth/views/widgets/password_validation_widget.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../core/utils/validators.dart';
import '../../../../gen/assets.gen.dart';
import '../../cubits/password_complexity_cubit.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordField({super.key, required this.controller});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isPasswordVisible = false;
  final passwordComplexityCubit = getIt<PasswordComplexityCubit>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'your_password'.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Row(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Assets.images.iconPassword.svg(),
            ),
            Expanded(
              child: TextFormField(
                style: Theme.of(context).textTheme.titleLarge,
                keyboardType: TextInputType.visiblePassword,
                onChanged: passwordComplexityCubit.validate,
                textInputAction: TextInputAction.done,
                obscureText: !isPasswordVisible,
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: 'password'.tr(),
                  suffixIcon: Focus(
                    canRequestFocus: false,
                    descendantsAreFocusable: false,
                    child: IconButton(
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      padding: EdgeInsets.zero,
                      tooltip: !isPasswordVisible
                          ? 'show_password'.tr()
                          : 'hide_password'.tr(),
                      icon: AnimatedCrossFade(
                        firstChild: Icon(
                          CupertinoIcons.eye,
                          color: Color(0xFF747474),
                        ),
                        secondChild: Icon(
                          CupertinoIcons.eye_slash,
                          color: Color(0xFF747474),
                        ),
                        crossFadeState: !isPasswordVisible
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: Duration(milliseconds: 300),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        BlocBuilder<PasswordComplexityCubit, BaseState>(
          bloc: passwordComplexityCubit,
          builder: (context, state) => state.maybeWhen(
            orElse: () => SizedBox(),
            loaded: (data) => PasswordValidationWidget(
              rules: data as List<PasswordRuleResult>,
            ),
          ),
        ),
      ],
    );
  }
}
