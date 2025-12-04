import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom/core/app_cubit/base_state.dart';
import 'package:workiom/features/auth/cubits/login_information_cubit.dart';
import 'package:workiom/gen/assets.gen.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../core/routes/go_router.dart';

import '../../../../core/views/widgets/main_button.dart';
import '../../cubits/auth_cubit.dart';
import '../../models/login_information_model.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final loginInformationCubit = getIt<LoginInformationCubit>();
  final authCubit = getIt<AuthCubit>();

  @override
  void initState() {
    splashLogic();
    super.initState();
  }

  splashLogic() {
    final token = authCubit.getToken();
    if (token != null) {
      loginInformationCubit.getCurrentLoginInformation();
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        context.go(NamedRoutes.signup);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginInformationCubit, BaseState<LoginInformationModel>>(
      bloc: loginInformationCubit,
      listener: (context, state) => state.maybeWhen(
        orElse: () {},
        loaded: (data) {
          data as LoginInformationModel;
          if (data.result?.user == null) {
            context.go(NamedRoutes.signup);
          } else {
            context.go(NamedRoutes.home);
          }
        },
        error: (error) {
          showModalBottomSheet(
            context: context,
            showDragHandle: true,
            isScrollControlled: true,
            isDismissible: false,
            enableDrag: false,
            builder: (context) => PopScope(
              onPopInvokedWithResult: (value, s) {
                loginInformationCubit.getCurrentLoginInformation();
              },
              child: SizedBox(
                height: 120,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    Text(
                      'msg_not_internet'.tr(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    MainButton(
                      title: 'retry'.tr(),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      child: Scaffold(body: Center(child: Assets.images.logo.svg(height: 200))),
    );
  }
}
