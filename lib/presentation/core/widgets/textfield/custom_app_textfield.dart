import 'package:sayarti_mobile/generated/l10n.dart';
import 'package:sayarti_mobile/presentation/core/constants/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ValidationType {
  required,
  email,
  password,
  phone,
  text,
  arabic,
  optional,
  price,
  number,
}

enum ObscureTextOption { none, plainObscure, toggleVisibility }

enum AppTextDirectionMode { auto, ltr, rtl, inherit }

enum AppTextFieldBorderType { underline, outline, none }

class CustomAppTextField extends StatefulWidget {
  const CustomAppTextField({
    required this.labelText,
    super.key,

    // Content
    this.title,
    this.isRequired,
    this.hintText,
    this.helperText,
    this.noteMessage,
    this.errorText,
    this.prefixText,
    this.suffixText,

    // Controller and focus
    this.controller,
    this.initialValue,
    this.focusNode,

    // Widgets
    this.label,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,

    // Validation
    this.validator,
    this.validationType,
    this.enableValidation = true,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,

    // Events
    this.onChanged,
    this.onTap,
    this.onTapOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,

    // Input behavior
    this.keyboardType,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.autoFormatByValidationType = true,
    this.autofillHints,

    // Password behavior
    this.obscureText = false,
    this.obscureTextOption = ObscureTextOption.none,
    this.obscuringCharacter = '•',

    // Field behavior
    this.readOnly = false,
    this.enabled = true,
    this.autofocus = false,
    this.autocorrect = false,
    this.enableSuggestions = true,
    this.enableInteractiveSelection = true,
    this.showCursor,
    this.canRequestFocus = true,
    this.ignorePointers,

    // Lines and length
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.showCounter = false,

    // Direction
    this.textDirectionMode = AppTextDirectionMode.auto,
    this.textDirection,
    this.hintTextDirection,
    this.textAlign,
    this.textAlignVertical,
    this.isNumber = false,
    this.isArabic = false,

    // Styles
    this.style,
    this.labelStyle,
    this.titleStyle,
    this.hintStyle,
    this.helperStyle,
    this.noteStyle,
    this.errorStyle,
    this.prefixStyle,
    this.suffixStyle,
    this.counterStyle,
    this.fontSize,

    // Colors
    this.textColor,
    this.labelColor,
    this.hintColor,
    this.cursorColor,
    this.cursorErrorColor,

    // Cursor
    this.cursorHeight = 17,
    this.cursorWidth = 2,
    this.cursorRadius,

    // Border
    this.borderType = AppTextFieldBorderType.underline,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.disabledBorderColor,
    this.borderRadius = 8,
    this.borderWidth = 1,
    this.focusedBorderWidth = 1,

    // Decoration
    this.filled = false,
    this.fillColor,
    this.contentPadding = const EdgeInsetsDirectional.only(top: 8, bottom: 8),
    this.prefixIconPadding = const EdgeInsetsDirectional.only(
      start: 4,
      end: 12,
    ),
    this.suffixIconPadding = const EdgeInsetsDirectional.only(
      start: 12,
      end: 4,
    ),

    this.prefixIconConstraints = const BoxConstraints(
      minWidth: 10,
      minHeight: 10,
    ),
    this.suffixIconConstraints = const BoxConstraints(
      minWidth: 10,
      minHeight: 10,
    ),
    this.errorMaxLines,
    this.helperMaxLines,
    this.counterText = '',
    this.isDense = true,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.alignLabelWithHint,

    // Layout
    this.height,
    this.hasBottomPadding = false,

    // Scroll
    this.scrollPadding = const EdgeInsets.all(20),
    this.scrollPhysics,
    this.scrollController,

    // Platform behavior
    this.keyboardAppearance,
    this.magnifierConfiguration = TextMagnifierConfiguration.disabled,
    this.contextMenuBuilder,
    this.mouseCursor,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.dismissKeyboardOnTapOutside = true,
  }) : assert(
         controller == null || initialValue == null,
         'controller and initialValue cannot both be provided.',
       ),
       assert(
         !expands || (minLines == null && maxLines == null),
         'minLines and maxLines must be null when expands is true.',
       ),
       assert(
         obscuringCharacter.length == 1,
         'obscuringCharacter must contain exactly one character.',
       );

  // Content

  final String labelText;
  final String? title;
  final bool? isRequired;

  final String? hintText;
  final String? helperText;
  final String? noteMessage;
  final String? errorText;

  final String? prefixText;
  final String? suffixText;

  // Controller and focus

  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;

  // Widgets

  final Widget? label;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  // Validation

  final FormFieldValidator<String>? validator;
  final ValidationType? validationType;
  final bool enableValidation;
  final AutovalidateMode autovalidateMode;

  // Events

  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;

  // Input behavior

  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;

  final List<TextInputFormatter>? inputFormatters;
  final bool autoFormatByValidationType;
  final Iterable<String>? autofillHints;

  // Password behavior

  final bool obscureText;
  final ObscureTextOption obscureTextOption;
  final String obscuringCharacter;

  // Field behavior

  final bool readOnly;
  final bool enabled;
  final bool autofocus;
  final bool autocorrect;
  final bool enableSuggestions;
  final bool enableInteractiveSelection;
  final bool? showCursor;
  final bool canRequestFocus;
  final bool? ignorePointers;

  // Lines and length

  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final bool showCounter;

  // Direction

  final AppTextDirectionMode textDirectionMode;
  final TextDirection? textDirection;
  final TextDirection? hintTextDirection;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;

  final bool isNumber;
  final bool isArabic;

  // Styles

  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? titleStyle;
  final TextStyle? hintStyle;
  final TextStyle? helperStyle;
  final TextStyle? noteStyle;
  final TextStyle? errorStyle;
  final TextStyle? prefixStyle;
  final TextStyle? suffixStyle;
  final TextStyle? counterStyle;

  final double? fontSize;

  // Colors

  final Color? textColor;
  final Color? labelColor;
  final Color? hintColor;
  final Color? cursorColor;
  final Color? cursorErrorColor;

  // Cursor

  final double? cursorHeight;
  final double cursorWidth;
  final Radius? cursorRadius;

  // Border

  final AppTextFieldBorderType borderType;

  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? disabledBorderColor;

  final double borderRadius;
  final double borderWidth;
  final double focusedBorderWidth;

  // Decoration

  final bool filled;
  final Color? fillColor;
  final EdgeInsetsGeometry contentPadding;

  final BoxConstraints prefixIconConstraints;
  final BoxConstraints suffixIconConstraints;
  final EdgeInsetsGeometry prefixIconPadding;
  final EdgeInsetsGeometry suffixIconPadding;
  final int? errorMaxLines;
  final int? helperMaxLines;

  final String counterText;
  final bool isDense;

  final FloatingLabelBehavior floatingLabelBehavior;
  final bool? alignLabelWithHint;

  // Layout

  final double? height;
  final bool hasBottomPadding;

  // Scroll

  final EdgeInsets scrollPadding;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;

  // Platform behavior

  final Brightness? keyboardAppearance;
  final TextMagnifierConfiguration magnifierConfiguration;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final MouseCursor? mouseCursor;
  final String? restorationId;
  final Clip clipBehavior;

  final bool dismissKeyboardOnTapOutside;

  @override
  State<CustomAppTextField> createState() => _CustomAppTextFieldState();
}

class _CustomAppTextFieldState extends State<CustomAppTextField> {
  TextEditingController? _internalController;
  FocusNode? _internalFocusNode;

  late TextDirection _detectedDirection;
  late bool _isPasswordObscured;

  bool _dependenciesInitialized = false;

  TextEditingController get _effectiveController {
    return widget.controller ?? _internalController!;
  }

  FocusNode get _effectiveFocusNode {
    return widget.focusNode ?? (_internalFocusNode ??= FocusNode());
  }

  String get _currentText => _effectiveController.text;

  @override
  void initState() {
    super.initState();

    if (widget.controller == null) {
      _internalController = TextEditingController(text: widget.initialValue);
    }

    _detectedDirection = widget.textDirection ?? TextDirection.ltr;

    _isPasswordObscured = switch (widget.obscureTextOption) {
      ObscureTextOption.none => widget.obscureText,
      ObscureTextOption.plainObscure => true,
      ObscureTextOption.toggleVisibility => true,
    };

    _effectiveController.addListener(_handleTextChanged);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final direction = _resolveDirection(
      _currentText,
      fallbackDirection: Directionality.of(context),
    );

    if (!_dependenciesInitialized || direction != _detectedDirection) {
      _dependenciesInitialized = true;
      _detectedDirection = direction;
    }
  }

  @override
  void didUpdateWidget(covariant CustomAppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?.removeListener(_handleTextChanged);
      _internalController?.removeListener(_handleTextChanged);

      if (widget.controller == null) {
        _internalController = TextEditingController(
          text: oldWidget.controller?.text ?? widget.initialValue ?? '',
        );
      } else {
        _internalController?.dispose();
        _internalController = null;
      }

      _effectiveController.addListener(_handleTextChanged);
    }

    if (oldWidget.obscureTextOption != widget.obscureTextOption ||
        oldWidget.obscureText != widget.obscureText) {
      _isPasswordObscured = switch (widget.obscureTextOption) {
        ObscureTextOption.none => widget.obscureText,
        ObscureTextOption.plainObscure => true,
        ObscureTextOption.toggleVisibility => true,
      };
    }

    if (oldWidget.textDirectionMode != widget.textDirectionMode ||
        oldWidget.textDirection != widget.textDirection ||
        oldWidget.isArabic != widget.isArabic ||
        oldWidget.isNumber != widget.isNumber) {
      final direction = _resolveDirection(
        _currentText,
        fallbackDirection: Directionality.of(context),
      );

      if (direction != _detectedDirection) {
        setState(() {
          _detectedDirection = direction;
        });
      }
    }
  }

  // Direction

void _handleTextChanged() {
  if (widget.textDirectionMode != AppTextDirectionMode.auto) {
    return;
  }

  final direction = _resolveDirection(
    _currentText,
    fallbackDirection: Directionality.of(context),
  );

  if (direction == _detectedDirection) {
    return;
  }

  setState(() {
    _detectedDirection = direction;
  });
}
  TextDirection _resolveDirection(
    String value, {
    required TextDirection fallbackDirection,
  }) {
    if (widget.isNumber) {
      return TextDirection.ltr;
    }

    switch (widget.textDirectionMode) {
      case AppTextDirectionMode.ltr:
        return TextDirection.ltr;

      case AppTextDirectionMode.rtl:
        return TextDirection.rtl;

      case AppTextDirectionMode.inherit:
        return widget.textDirection ?? fallbackDirection;

      case AppTextDirectionMode.auto:
        return _detectTextDirection(
          value,
          fallbackDirection: fallbackDirection,
        );
    }
  }

TextDirection _detectTextDirection(
  String value, {
  required TextDirection fallbackDirection,
}) {
  if (value.trim().isEmpty) {
    return widget.textDirection ?? fallbackDirection;
  }

  for (final rune in value.runes) {
    if (_isArabicRune(rune)) {
      return TextDirection.rtl;
    }

    if (_isLatinRune(rune)) {
      return TextDirection.ltr;
    }
  }

  return widget.textDirection ?? fallbackDirection;
}
  bool _isArabicRune(int rune) {
    return (rune >= 0x0600 && rune <= 0x06FF) ||
        (rune >= 0x0750 && rune <= 0x077F) ||
        (rune >= 0x08A0 && rune <= 0x08FF) ||
        (rune >= 0xFB50 && rune <= 0xFDFF) ||
        (rune >= 0xFE70 && rune <= 0xFEFF);
  }

  bool _isLatinRune(int rune) {
    return (rune >= 0x0041 && rune <= 0x005A) ||
        (rune >= 0x0061 && rune <= 0x007A) ||
        (rune >= 0x00C0 && rune <= 0x024F);
  }


  // Keyboard and formatting

  TextInputType _resolveKeyboardType() {
    if (widget.keyboardType != null) {
      return widget.keyboardType!;
    }

    switch (widget.validationType) {
      case ValidationType.email:
        return TextInputType.emailAddress;

      case ValidationType.phone:
        return TextInputType.phone;

      case ValidationType.number:
        return TextInputType.number;

      case ValidationType.price:
        return const TextInputType.numberWithOptions(decimal: true);

      case ValidationType.password:
      case ValidationType.required:
      case ValidationType.text:
      case ValidationType.arabic:
      case ValidationType.optional:
      case null:
        return TextInputType.text;
    }
  }

  List<TextInputFormatter> _resolveInputFormatters() {
    final formatters = <TextInputFormatter>[...?widget.inputFormatters];

    if (!widget.autoFormatByValidationType) {
      return formatters;
    }

    switch (widget.validationType) {
      case ValidationType.phone:
        formatters.add(FilteringTextInputFormatter.allow(RegExp(r'[\d\+\s]')));
        break;

      case ValidationType.number:
        formatters.add(FilteringTextInputFormatter.digitsOnly);
        break;

      case ValidationType.price:
        formatters.add(FilteringTextInputFormatter.allow(RegExp(r'[\d.]')));
        formatters.add(_SingleDecimalPointFormatter());
        break;

      case ValidationType.arabic:
        formatters.add(
          FilteringTextInputFormatter.allow(RegExp(r'[\u0600-\u06FF\s]')),
        );
        break;

      case ValidationType.email:
      case ValidationType.password:
      case ValidationType.required:
      case ValidationType.text:
      case ValidationType.optional:
      case null:
        break;
    }

    return formatters;
  }

  // Validation

  String? _validate(String? value) {
    if (!widget.enableValidation) {
      return null;
    }

    if (widget.validator != null) {
      return widget.validator!(value);
    }

    final normalizedValue = value?.trim() ?? '';

    final isRequired =
        widget.isRequired == true ||
        widget.validationType == ValidationType.required;

    if (isRequired && normalizedValue.isEmpty) {
      return 'This field is required';
    }

    if (widget.validationType == ValidationType.optional ||
        normalizedValue.isEmpty) {
      return null;
    }

    switch (widget.validationType) {
      case ValidationType.email:
        final isValid = RegExp(
          r'^[\w.-]+@([\w-]+\.)+[\w]{2,}$',
        ).hasMatch(normalizedValue);

        if (!isValid) {
          return 'Invalid email';
        }

        break;

      case ValidationType.phone:
        final phone = normalizedValue.replaceAll(RegExp(r'\s+'), '');

        if (!RegExp(r'^\+?\d{7,15}$').hasMatch(phone)) {
          return 'Invalid phone number';
        }

        break;

      case ValidationType.password:
        if (normalizedValue.length < 8) {
          return 'Password must be at least 8 characters';
        }

        break;

      case ValidationType.number:
        if (int.tryParse(normalizedValue) == null) {
          return 'Invalid number';
        }

        break;

      case ValidationType.price:
        if (double.tryParse(normalizedValue) == null) {
          return 'Invalid price';
        }

        break;

      case ValidationType.arabic:
        if (!RegExp(r'^[\u0600-\u06FF\s]+$').hasMatch(normalizedValue)) {
          return 'Arabic characters only';
        }

        break;

      case ValidationType.required:
      case ValidationType.text:
      case ValidationType.optional:
      case null:
        break;
    }

    return null;
  }

  // Password

  bool get _effectiveObscureText {
    switch (widget.obscureTextOption) {
      case ObscureTextOption.none:
        return widget.obscureText;

      case ObscureTextOption.plainObscure:
        return true;

      case ObscureTextOption.toggleVisibility:
        return _isPasswordObscured;
    }
  }

Widget? _buildSuffixIcon() {
  if (widget.obscureTextOption ==
      ObscureTextOption.toggleVisibility) {
    return Padding(
      padding: widget.suffixIconPadding,
      child: Align(
        widthFactor: 1,
        heightFactor: 1,
        alignment: AlignmentDirectional.centerEnd,
        child: IconButton(
          splashRadius: 18,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(
            minWidth: 32,
            minHeight: 32,
          ),
          onPressed: widget.enabled && !widget.readOnly
              ? () async {
                  await HapticFeedback.selectionClick();

                  setState(() {
                    _isPasswordObscured =
                        !_isPasswordObscured;
                  });
                }
              : null,
          icon: Icon(
            _isPasswordObscured
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            size: 20,
            color: _isPasswordObscured
                ? AppColor.greyForHints
                : AppColor.blue,
          ),
        ),
      ),
    );
  }

  final suffixWidget =
      widget.suffixIcon ?? widget.suffix;

  if (suffixWidget == null) {
    return null;
  }

  return Padding(
    padding: widget.suffixIconPadding,
    child: Align(
      widthFactor: 1,
      heightFactor: 1,
      alignment: AlignmentDirectional.centerEnd,
      child: suffixWidget,
    ),
  );
}
  Widget? _buildPrefixIcon() {
    final prefixWidget = widget.prefixIcon ?? widget.prefix;

    if (prefixWidget == null) {
      return null;
    }

    return Padding(
      padding: widget.prefixIconPadding,
      child: Align(
        widthFactor: 1,
        heightFactor: 1,
        alignment: AlignmentDirectional.centerStart,
        child: prefixWidget,
      ),
    );
  }
  // Border

  InputBorder _buildBorder({required Color color, required double width}) {
    switch (widget.borderType) {
      case AppTextFieldBorderType.underline:
        return UnderlineInputBorder(
          borderSide: BorderSide(color: color, width: width),
        );

      case AppTextFieldBorderType.outline:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: color, width: width),
        );

      case AppTextFieldBorderType.none:
        return InputBorder.none;
    }
  }

  // Build

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final inputTheme = theme.inputDecorationTheme;
    final effectiveBorderColor =
        widget.borderColor ?? theme.dividerColor;

    final effectiveFocusedBorderColor =
        widget.focusedBorderColor ??
        widget.borderColor ??
        theme.colorScheme.primary;

    final effectiveErrorBorderColor =
        widget.errorBorderColor ?? theme.colorScheme.error;

    final effectiveDisabledBorderColor =
        widget.disabledBorderColor ??
        theme.disabledColor;

    final effectiveLabelStyle =
        widget.labelStyle ??
        TextStyle(
          color: widget.labelColor ?? theme.primaryColor,
        );

    final effectiveTitleStyle =
        widget.titleStyle ??
        TextStyle(
          color: widget.labelColor ?? theme.primaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        );

    final effectiveTextStyle =
        widget.style ??
        TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: widget.fontSize ?? 15,
          color: widget.textColor ?? theme.primaryColor,
        );

    final effectiveHintStyle =
        widget.hintStyle ??
        TextStyle(
          color:
              widget.hintColor ??
              inputTheme.hintStyle?.color ??
              theme.hintColor,
          fontSize: widget.fontSize ?? 18,
          fontWeight: FontWeight.w400,
        );

    final effectiveNoteStyle =
        widget.noteStyle ??
        TextStyle(
          color: theme.focusColor,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        );

    final effectiveCursorColor =
        widget.cursorColor ??
        (widget.isNumber ? AppColor.primaryBlue : theme.primaryColor);

    final effectiveDirection = widget.isNumber
        ? TextDirection.ltr
        : widget.textDirectionMode == AppTextDirectionMode.inherit
        ? widget.textDirection ?? Directionality.of(context)
        : _detectedDirection;

    final effectiveTextAlign =
        widget.textAlign ??
        (widget.isNumber
            ? widget.isArabic
                  ? TextAlign.end
                  : TextAlign.start
            : effectiveDirection == TextDirection.rtl
            ? TextAlign.right
            : TextAlign.left);

    final effectiveHintDirection = widget.isNumber
        ? TextDirection.ltr
        : widget.hintTextDirection ??
              widget.textDirection ??
              Directionality.of(context);

    final field = TextFormField(
      controller: _effectiveController,
      focusNode: _effectiveFocusNode,
      validator: _validate,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onTapOutside:
          widget.onTapOutside ??
          (event) {
            if (widget.dismissKeyboardOnTapOutside) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      keyboardType: _resolveKeyboardType(),
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization,
      inputFormatters: _resolveInputFormatters(),
      autofillHints: widget.autofillHints,
      obscureText: _effectiveObscureText,
      obscuringCharacter: widget.obscuringCharacter,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      autofocus: widget.autofocus,
      autocorrect: widget.autocorrect,
      enableSuggestions: widget.enableSuggestions,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      showCursor: widget.showCursor,
      canRequestFocus: widget.canRequestFocus,
      ignorePointers: widget.ignorePointers,
      maxLines: _effectiveObscureText ? 1 : widget.maxLines,
      minLines: widget.minLines,
      expands: widget.expands,
      maxLength: widget.maxLength,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      textDirection: effectiveDirection,
      textAlign: effectiveTextAlign,
      textAlignVertical: widget.textAlignVertical,
      style: effectiveTextStyle,
      cursorColor: effectiveCursorColor,
      cursorErrorColor: widget.cursorErrorColor ?? theme.colorScheme.error,
      cursorHeight: widget.cursorHeight,
      cursorWidth: widget.cursorWidth,
      cursorRadius: widget.cursorRadius,
      scrollPadding: widget.scrollPadding,
      scrollPhysics: widget.scrollPhysics,
      scrollController: widget.scrollController,
      keyboardAppearance: widget.keyboardAppearance,
      magnifierConfiguration: widget.magnifierConfiguration,
      contextMenuBuilder: widget.contextMenuBuilder,
      mouseCursor: widget.mouseCursor,
      restorationId: widget.restorationId,
      clipBehavior: widget.clipBehavior,
      autovalidateMode: widget.autovalidateMode,
      decoration: InputDecoration(
        hintText: widget.hintText?.isNotEmpty == true
            ? widget.hintText
            : S.of(context).pleaseEnter,
        hintTextDirection: effectiveHintDirection,
        hintStyle: effectiveHintStyle,
        helperText: widget.helperText,
        helperStyle: widget.helperStyle,
        helperMaxLines: widget.helperMaxLines,
        errorText: widget.errorText,
        errorStyle: widget.errorStyle,
        errorMaxLines: widget.errorMaxLines,
        prefixIcon: _buildPrefixIcon(),
        suffixIcon: _buildSuffixIcon(),
        prefixText: widget.prefixText,
        suffixText: widget.suffixText,
        prefixStyle: widget.prefixStyle,
        suffixStyle: widget.suffixStyle,
        prefixIconConstraints: widget.prefixIconConstraints,
        suffixIconConstraints: widget.suffixIconConstraints,
        contentPadding: widget.contentPadding,
        counterText: widget.showCounter ? null : widget.counterText,
        counterStyle: widget.counterStyle,
        isDense: widget.isDense,
        filled: widget.filled,
        fillColor: widget.fillColor,
        floatingLabelBehavior: widget.floatingLabelBehavior,
        alignLabelWithHint: widget.alignLabelWithHint,
        enabledBorder: _buildBorder(
          color: effectiveBorderColor,
          width: widget.borderWidth,
        ),
        focusedBorder: _buildBorder(
          color: effectiveFocusedBorderColor,
          width: widget.focusedBorderWidth,
        ),
        errorBorder: _buildBorder(
          color: effectiveErrorBorderColor,
          width: widget.borderWidth,
        ),
        focusedErrorBorder: _buildBorder(
          color: effectiveErrorBorderColor,
          width: widget.focusedBorderWidth,
        ),
        disabledBorder: _buildBorder(
          color: effectiveDisabledBorderColor,
          width: widget.borderWidth,
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title?.trim().isNotEmpty == true) ...[
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 6),
            child: Row(
              children: [
                Text(widget.title!, style: effectiveTitleStyle),
                if (widget.isRequired == true)
                  Text(
                    ' *',
                    style: effectiveTitleStyle.copyWith(
                      color: theme.colorScheme.error,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 6),
        ],
        if (widget.label != null)
          widget.label!
        else if (widget.labelText.trim().isNotEmpty)
          Text(widget.labelText, style: effectiveLabelStyle),
        if (widget.height != null)
          SizedBox(height: widget.height, child: field)
        else
          field,
        if (widget.noteMessage?.trim().isNotEmpty == true)
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 8),
            child: Text(widget.noteMessage!, style: effectiveNoteStyle),
          ),
        if (widget.hasBottomPadding) const SizedBox(height: 12),
      ],
    );
  }

  @override
  void dispose() {
    _effectiveController.removeListener(_handleTextChanged);

    _internalController?.dispose();
    _internalFocusNode?.dispose();

    super.dispose();
  }
}

class _SingleDecimalPointFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final decimalPointCount = '.'.allMatches(newValue.text).length;

    if (decimalPointCount <= 1) {
      return newValue;
    }

    return oldValue;
  }
}
