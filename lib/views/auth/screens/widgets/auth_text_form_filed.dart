import 'package:fireshop/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AuthTextFormField extends StatefulWidget {
  const AuthTextFormField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.textEditingController,
    this.showToggle = false,
    this.validator,
    this.keyboardType,
    this.textInputAction,
  });

  final String hintText;
  final IconData prefixIcon;
  final bool showToggle;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  @override
  State<AuthTextFormField> createState() => _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends State<AuthTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return TextFormField(
      controller: widget.textEditingController,
      validator: widget.validator,
      obscureText: widget.showToggle ? _obscureText : false,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      autocorrect: !widget.showToggle,
      enableSuggestions: !widget.showToggle,
      style: textTheme.bodyMedium?.copyWith(
        color: Colors.black,
        letterSpacing: 0.5,
        height: 1.2,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.authFillColor.withAlpha(122),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.authBorderColor.withAlpha(80),
            width: 1.4,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.authBorderColor.withAlpha(180),
            width: 1.8,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 1.8),
        ),
        prefixIcon: Icon(widget.prefixIcon, color: AppColors.bodyTextColor),
        hintText: widget.hintText,
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: AppColors.bodyTextColor,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.2,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: widget.showToggle
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.primaryColor.withAlpha(180),
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
