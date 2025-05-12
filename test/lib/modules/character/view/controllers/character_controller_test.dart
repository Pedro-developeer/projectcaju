import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:projectcaju/core/constants/image_constants.dart';
import 'package:projectcaju/modules/character/services/character_service.dart';
import 'package:projectcaju/modules/character/view/controllers/character_controller.dart';

class MockCharacterService extends Mock implements CharacterService {}

void main() {
  late CharacterController controller;
  late MockCharacterService mockService;

  setUp(() {
    mockService = MockCharacterService();
    controller = CharacterController(characterService: mockService);
  });

  group('getVocationImage Tests:', () {
    test('Should return Knight image for vocations containing "Knight"', () {
      const testCases = ['Elite Knight', 'Knight', 'Knights', 'Royal Knight'];

      for (final vocation in testCases) {
        final result = controller.getVocationImage(vocation: vocation);
        expect(result, isA<AssetImage>());
        expect(result!.assetName, equals(ImagesConstants.knight));
      }
    });

    test(
      'Should return Sorcerer image for vocations containing "Sorcerer"',
      () {
        const testCases = [
          'Master Sorcerer',
          'Sorcerer',
          'Sorcerers',
          'Dark Sorcerer',
        ];

        for (final vocation in testCases) {
          final result = controller.getVocationImage(vocation: vocation);
          expect(result, isA<AssetImage>());
          expect(result!.assetName, equals(ImagesConstants.sorcerer));
        }
      },
    );

    test('Should return Druid image for vocations containing "Druid"', () {
      const testCases = ['Elder Druid', 'Druid', 'Druids', 'Forest Druid'];

      for (final vocation in testCases) {
        final result = controller.getVocationImage(vocation: vocation);
        expect(result, isA<AssetImage>());
        expect(result!.assetName, equals(ImagesConstants.druid));
      }
    });

    test('Should return Monk image for vocations containing "Monk"', () {
      const testCases = ['Zen Monk', 'Monk', 'Monks', 'Battle Monk'];

      for (final vocation in testCases) {
        final result = controller.getVocationImage(vocation: vocation);
        expect(result, isA<AssetImage>());
        expect(result!.assetName, equals(ImagesConstants.monk));
      }
    });

    test('Should return null for unknown vocations', () {
      const testCases = ['Paladin', 'Rogue', 'Necromancer', 'Ranger', ''];

      for (final vocation in testCases) {
        final result = controller.getVocationImage(vocation: vocation);
        expect(result, isNull);
      }
    });
  });
}
