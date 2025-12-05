import 'package:easy_localization/easy_localization.dart';

import '../../features/auth/models/password_complexity_model.dart';

class Validators {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "email_error".tr();
    }

    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(email)) {
      return "email_error".tr();
    }

    return null; // Valid email
  }

  static String? validateWorkspace(String? name) {
    if (name == null || name.isEmpty) {
      return "workspace_error".tr();
    }

    final RegExp nameRegex = RegExp(r'^[A-Za-z][A-Za-z0-9-]*$');

    if (!nameRegex.hasMatch(name)) {
      return "workspace_error".tr();
    }

    return null; // Valid tenant name
  }

  static String? validateName(String? name) {
    if ((name?.length ?? 0) < 3) {
      return "name_error".tr();
    }

    return null; // Valid email
  }

  static String? validateEmpty(String? name) {
    if (name?.isEmpty ?? true) {
      return "field_error".tr();
    }

    return null; // Valid email
  }
}

class PasswordRuleResult {
  final String rule;
  final bool isValid;

  PasswordRuleResult(this.rule, this.isValid);
}

extension PasswordValidator on Setting {
  List<PasswordRuleResult> validatePassword(String password) {
    final List<PasswordRuleResult> results = [];

    // Required length
    if (requiredLength != null && requiredLength! > 0) {
      results.add(
        PasswordRuleResult(
          "password_min_length".tr(
            namedArgs: {'length': '$requiredLength'},
          ),
          password.length >= requiredLength!,
        ),
      );
    }

    // Require digit
    if (requireDigit == true) {
      final hasDigit = RegExp(r'[0-9]').hasMatch(password);
      results.add(PasswordRuleResult("password_digit".tr(), hasDigit));
    }

    // Require lowercase
    if (requireLowercase == true) {
      final hasLower = RegExp(r'[a-z]').hasMatch(password);
      results.add(PasswordRuleResult("password_lowercase".tr(), hasLower));
    }

    // Require uppercase
    if (requireUppercase == true) {
      final hasUpper = RegExp(r'[A-Z]').hasMatch(password);
      results.add(PasswordRuleResult("password_uppercase".tr(), hasUpper));
    }

    // Require non-alphanumeric
    if (requireNonAlphanumeric == true) {
      final hasSymbol = RegExp(r'[^a-zA-Z0-9]').hasMatch(password);
      results.add(PasswordRuleResult("password_symbol", hasSymbol));
    }

    return results;
  }
}
