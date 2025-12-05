import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom/core/app_cubit/base_state.dart';
import 'package:workiom/core/di/injection_container.dart';
import 'package:workiom/core/routes/named_routes.dart';
import 'package:workiom/features/auth/cubits/auth_cubit.dart';
import 'package:workiom/features/auth/cubits/password_complexity_cubit.dart';
import 'package:workiom/features/auth/views/widgets/email_field.dart';
import 'package:workiom/features/auth/views/widgets/enter_button.dart';
import 'package:workiom/features/auth/views/widgets/password_field.dart';
import 'package:workiom/features/auth/views/widgets/stay_organized_with_workiom_widget.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final authCubit = getIt<AuthCubit>();
    final passwordComplexityCubit = getIt<PasswordComplexityCubit>();

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.all(16),
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
            SizedBox(height: 64),
            EmailField(controller: authCubit.controllerEmail),
            SizedBox(height: 16),
            PasswordField(controller: authCubit.controllerPassword),
            SizedBox(height: 24),
            BlocBuilder<PasswordComplexityCubit, BaseState>(
              bloc: passwordComplexityCubit,
              builder: (context, state) {
                bool isPasswordValid = passwordComplexityCubit.rules.every(
                  (e) => e.isValid,
                );
                return EnterButton(
                  title: 'confirm_password'.tr(),
                  onPressed: isPasswordValid&&passwordComplexityCubit.rules.isNotEmpty
                      ? () {
                          if (formKey.currentState?.validate() ?? false) {
                            context.push(NamedRoutes.createWorkspace);
                          } else {
                            HapticFeedback.vibrate();
                          }
                        }
                      : null,
                );
              },
            ),
          ],
        ),
      ),
      bottomSheet: StayOrganizedWithWorkiomWidget(),
    );
  }
}
