import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workiom/core/di/injection_container.dart';
import 'package:workiom/core/views/widgets/main_button.dart';
import 'package:workiom/features/auth/cubits/auth_cubit.dart';
import 'package:workiom/features/auth/cubits/auth_state.dart';
import 'package:workiom/features/auth/views/widgets/enter_button.dart';
import 'package:workiom/features/auth/views/widgets/stay_organized_with_workiom_widget.dart';
import 'package:workiom/gen/assets.gen.dart';

import '../../../../core/utils/validators.dart';

class CreateWorkspacePage extends StatelessWidget {
  const CreateWorkspacePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = getIt<AuthCubit>();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
            SizedBox(height: 64),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'your_company'.tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Assets.images.iconWorkspace.svg(),
                    ),
                    Expanded(
                      child: TextFormField(
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.text,
                        validator: Validators.validateWorkspace,
                        textInputAction: TextInputAction.next,
                        controller: authCubit.controllerWorkspace,
                        decoration: InputDecoration(
                          hintText: 'workspace_name'.tr(),
                          suffixIcon: Padding(
                            padding: EdgeInsetsDirectional.only(
                              top: 16,
                              end: 16,
                            ),
                            child: Text(
                              '.workiom.com',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(color: Color(0xFF747474)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'your_first_name'.tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Assets.images.iconText.svg(),
                    ),
                    Expanded(
                      child: TextFormField(
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.name,
                        validator: Validators.validateName,
                        textInputAction: TextInputAction.next,
                        controller: authCubit.controllerFirstName,
                        decoration: InputDecoration(
                          hintText: 'enter_your_first_name'.tr(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'your_last_name'.tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Assets.images.iconText.svg(),
                    ),
                    Expanded(
                      child: TextFormField(
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.text,
                        validator: Validators.validateName,
                        textInputAction: TextInputAction.done,
                        controller: authCubit.controllerLastName,
                        decoration: InputDecoration(
                          hintText: 'enter_your_last_name'.tr(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            BlocConsumer<AuthCubit, AuthState>(
              bloc: authCubit,
              listener: (context, state) => state.maybeWhen(orElse: () {}),
              builder: (context, state) => state.maybeWhen(
                orElse: () => EnterButton(
                  title: "create_workspace".tr(),
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                    } else {
                      HapticFeedback.vibrate();
                    }
                  },
                ),
                loading: () => MainButton(onPressed: () {}, isLoading: true),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: StayOrganizedWithWorkiomWidget(),
    );
  }
}
