import 'package:flutter/material.dart';

import '../../../../core/views/widgets/main_button.dart';
import '../../../../gen/assets.gen.dart';

class EnterButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  const EnterButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MainButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Assets.images.iconEnter.svg(color: Colors.transparent),
          Spacer(),
          Text(title),
          Spacer(),
          Assets.images.iconEnter.svg(),
        ],
      ),
    );
  }
}
