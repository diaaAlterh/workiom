import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:workiom/core/di/injection_container.dart';
import 'package:workiom/core/views/widgets/hide_child_when_keyboard_opened.dart';
import 'package:workiom/core/views/widgets/main_button.dart';
import 'package:workiom/features/auth/cubits/auth_cubit.dart';
import 'package:workiom/features/auth/views/widgets/email_field.dart';
import 'package:workiom/features/auth/views/widgets/password_field.dart';
import 'package:workiom/features/auth/views/widgets/password_validation_widget.dart';
import 'package:workiom/gen/assets.gen.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = getIt<AuthCubit>();
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: authCubit.formKey,
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            Text(
              'login_title'.tr(),
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: 4),
            Text(
              'login_subtitle'.tr(),
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            SizedBox(height: 100),
            EmailField(controller: authCubit.controllerEmail),
            SizedBox(height: 16),
            PasswordField(controller: authCubit.controllerPassword),
            SizedBox(height: 16),
            PasswordValidationWidget(),
            SizedBox(height: 24),
            MainButton(
              onPressed: () {},
              child: Row(
                children: [
                  Spacer(),
                  Text("confirm_password".tr()),
                  Spacer(),
                  Assets.images.iconEnter.svg(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: HideChildWhenKeyboardOpened(
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
                Assets.images.logoWithTitle.svg(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
