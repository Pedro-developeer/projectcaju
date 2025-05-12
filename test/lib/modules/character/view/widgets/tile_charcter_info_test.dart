import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projectcaju/core/constants/styles_font_constants.dart';
import 'package:projectcaju/core/themes/colors.dart';
import 'package:projectcaju/modules/character/view/widgets/tile_charcter_info.dart';

void main() {
  const mockInfo = 'Level';
  const mockComplement = '60';

  testWidgets('Should display icon when provided', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TileCharacterInfo(
            icon: Icons.arrow_drop_up,
            info: mockInfo,
            infoComplement: mockComplement,
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.arrow_drop_up), findsOneWidget);
    expect(find.text(mockInfo), findsOneWidget);
    expect(find.text(mockComplement), findsOneWidget);

    final iconWidget = tester.widget<Icon>(find.byIcon(Icons.arrow_drop_up));
    expect(iconWidget.color, equals(AppColors.fontColor));
    expect(iconWidget.size, equals(20));

    final infoText = tester.widget<Text>(find.text(mockInfo));
    expect(infoText.style, equals(StylesFontConstants.subtitle));

    final complementText = tester.widget<Text>(find.text(mockComplement));
    expect(complementText.style, equals(StylesFontConstants.subtitleTile));
  });
}
