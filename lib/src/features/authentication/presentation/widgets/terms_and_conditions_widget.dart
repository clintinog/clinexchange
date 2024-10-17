import 'package:clinexchange/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TermsAndConditionsCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onTermsTap;
  const TermsAndConditionsCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    required this.onTermsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTermsTap,
          child: Checkbox(value: isChecked, onChanged: onChanged),
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'I agree to ',
                style: Theme.of(context).textTheme.bodyMedium),
            TextSpan(
              text: 'Terms and Conditions',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColor.secondaryColor),
            ),
          ]),
        ),
      ],
    );
  }
}
