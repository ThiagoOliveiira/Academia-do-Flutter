import 'package:flutter/material.dart';

import 'styles.dart';

class AppStyles {
  static AppStyles? _instance;

  AppStyles._();

  static AppStyles get i => _instance ??= AppStyles._();

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: ColorsApp.i.primary,
        textStyle: TextStyles.i.textButtonLabel,
      );
}

extension AppStylesExtension on BuildContext {
  AppStyles get appStyles => AppStyles.i;
}
