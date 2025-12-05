import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom/core/di/injection_container.dart';
import 'package:workiom/core/routes/named_routes.dart';
import 'package:workiom/core/views/widgets/main_button.dart';
import 'package:workiom/features/auth/cubits/auth_cubit.dart';
import 'package:workiom/features/auth/cubits/auth_state.dart';
import 'package:workiom/features/auth/views/widgets/enter_button.dart';
import 'package:workiom/features/auth/views/widgets/stay_organized_with_workiom_widget.dart';
import 'package:workiom/features/auth/views/widgets/terms_and_privacy_text.dart';
import 'package:workiom/gen/assets.gen.dart';

import '../../../../core/utils/validators.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'create_workspace_title'.tr(),
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 4),
          Text(
            'create_workspace_subtitle'.tr(),
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          SizedBox(height: 100),
          MainButton(
            title: 'continue_with_google'.tr(),
            onPressed: () {},
            backgroundColor: Color(0xFFF4F4F4),
            icon: Assets.images.google.svg(),
            color: Colors.black,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Text(
                'or'.tr(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Color(0xFF555555)),
              ),
            ),
          ),
          EnterButton(
            title: "continue_with_email".tr(),
            onPressed: () {
              context.push(NamedRoutes.signup);
            },
          ),
          TermsAndPrivacyText()
        ],
      ),
      bottomSheet: StayOrganizedWithWorkiomWidget(),
    );
  }
}
