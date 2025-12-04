import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app_cubit/theme_cubit.dart';
import 'core/app_cubit/theme_state.dart';
import 'core/di/injection_container.dart';
import 'core/routes/go_router.dart';
import 'core/theme/light_theme.dart';
import 'core/utils/constants.dart';

init() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await configure();
  } catch (e) {}
}

Future<void> main() async {
  await init();
  runApp(
    EasyLocalization(
      supportedLocales: Language.values.map((e) => Locale(e.name)).toList(),
      path: 'assets/translations',
      fallbackLocale: Locale(Language.en.name),
      startLocale: Locale(Language.en.name),
      useOnlyLangCode: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = getIt<ThemeCubit>();

    return BlocBuilder<ThemeCubit, ThemeState>(
      bloc: themeCubit,
      builder: (context, state) {
        return SafeArea(
          top: false,
          left: false,
          right: false,
          child: MaterialApp.router(
            routerConfig: goRouter,
            debugShowCheckedModeBanner: false,
            title: Constants.appName,
            theme: buildLightTheme(context),
            themeMode: themeCubit.themeMode,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          ),
        );
      },
    );
  }
}
