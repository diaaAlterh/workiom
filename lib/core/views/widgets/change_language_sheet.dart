import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom/core/utils/constants.dart';

class ChangeLanguageSheet extends StatefulWidget {
  const ChangeLanguageSheet({super.key});

  @override
  State<ChangeLanguageSheet> createState() => _ChangeLanguageSheetState();
}

class _ChangeLanguageSheetState extends State<ChangeLanguageSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Column(
        children: Language.values
            .map(
              (e) => TextButton(
                onPressed: () {
                  context.setLocale(Locale(e.name));
                  context.pop();
                },
                style: TextButton.styleFrom(padding: EdgeInsets.zero,shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                child: ListTile(
                  leading: SvgPicture.asset('assets/images/${e.name}.svg'),
                  title: Text(e.name.tr()),
                  trailing: context.locale.languageCode == e.name
                      ? Icon(Icons.check_circle, color: Theme.of(context).primaryColor)
                      : null,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
