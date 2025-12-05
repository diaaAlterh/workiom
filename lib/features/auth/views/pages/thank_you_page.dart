import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom/core/di/injection_container.dart';
import 'package:workiom/core/routes/named_routes.dart';
import 'package:workiom/features/auth/cubits/auth_cubit.dart';

import '../../../../gen/assets.gen.dart';
import '../widgets/stay_organized_with_workiom_widget.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(32),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: Theme.of(context).textTheme.displayLarge,
                children: [
                  TextSpan(text: 'thank_you'.tr()),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Assets.images.logo.svg(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
              onPressed: () {
                getIt<AuthCubit>().logout();
                context.go(NamedRoutes.auth);
              },
              child: Row(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout, color: Theme.of(context).colorScheme.tertiary),
                  Text(
                    'logout'.tr(),
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.tertiary),
                  ),
                ],
              ),
            ),
          ),
          StayOrganizedWithWorkiomWidget(),
        ],
      ),
    );
  }
}
