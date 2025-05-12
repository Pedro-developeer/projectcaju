import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:projectcaju/modules/character/view/character_view.dart';
import 'package:projectcaju/modules/character/view/controllers/character_controller.dart';
import 'package:projectcaju/modules/character/services/character_service.dart';
import 'package:provider/provider.dart';

import 'mock_character.dart';

class MockCharacterService extends Mock implements CharacterService {}

void main() {
  testWidgets('CharacterView displays character data correctly', (
    WidgetTester tester,
  ) async {
    final mockModel = mockCharacterModel();
    final characterService = MockCharacterService();

    final controller = CharacterController(characterService: characterService);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<CharacterController>.value(value: controller),
        ],
        child: MaterialApp(
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              builder: (context) => CharacterView(),
              settings: RouteSettings(
                arguments: CharacterArguments(characterModel: mockModel),
              ),
            );
          },
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Pedro Presto Mage'), findsOneWidget);
    expect(find.text('60'), findsOneWidget);
    expect(find.text('Elite Knight'), findsOneWidget);
    expect(find.text('Premium Account'), findsNWidgets(2));
    expect(find.text('Ferobra'), findsOneWidget);
    expect(find.text('Thais'), findsOneWidget);
    expect(find.text('Scout of Tibia'), findsOneWidget);
    expect(find.text('2022-07-31T22:05:31Z'), findsOneWidget);

    final vocationImage = controller.getVocationImage(vocation: 'Elite Knight');
    expect(vocationImage, isNotNull);
  });
}
