import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sayarti_mobile/presentation/core/theme/default_app_theme.dart';
import 'package:sayarti_mobile/presentation/core/theme/sayarti_theme_colors.dart';
import 'package:sayarti_mobile/presentation/core/widgets/text/custom_text.dart';

void main() {
  Widget subject(Widget child) => MaterialApp(
    theme: const DefaultAppTheme().themeData,
    home: Scaffold(body: child),
  );

  testWidgets('semantic text widgets own their typography', (tester) async {
    await tester.pumpWidget(
      subject(
        const Column(
          children: [
            CustomTitleText('Title'),
            CustomHintText('Hint'),
            CustomDescriptionText('Description'),
          ],
        ),
      ),
    );

    Text textFor(String value) => tester.widget(find.text(value));

    expect(textFor('Title').style?.fontSize, 24);
    expect(textFor('Title').style?.fontWeight, FontWeight.w600);
    expect(textFor('Hint').style?.fontSize, 14);
    expect(textFor('Hint').style?.fontWeight, FontWeight.w400);
    expect(textFor('Description').style?.fontSize, 16);
    expect(textFor('Description').style?.height, 1.5);
  });

  testWidgets('semantic text widgets use active theme colors', (tester) async {
    const customColors = SayartiThemeColors(
      titleText: Color(0xFF111111),
      descriptionText: Color(0xFF222222),
      hintText: Color(0xFF333333),
      border: Color(0xFF444444),
      disabled: Color(0xFF555555),
      success: Color(0xFF666666),
      warning: Color(0xFF777777),
    );
    final theme = const DefaultAppTheme().themeData.copyWith(
      extensions: const [customColors],
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: theme,
        home: const Column(
          children: [
            CustomTitleText('Title'),
            CustomHintText('Hint'),
            CustomDescriptionText('Description'),
          ],
        ),
      ),
    );

    Text textFor(String value) => tester.widget(find.text(value));

    expect(textFor('Title').style?.color, customColors.titleText);
    expect(textFor('Hint').style?.color, customColors.hintText);
    expect(textFor('Description').style?.color, customColors.descriptionText);
  });
}
