import 'package:flutter_test/flutter_test.dart';
import 'package:projectcaju/modules/character/strings/character_strings.dart';

void main() {
  group('CharacterStrings Tests:', () {
    test('Should contain all defined static strings', () {
      expect(CharacterStrings.newsErrorString, isA<String>());
      expect(CharacterStrings.undefined, isA<String>());
      expect(CharacterStrings.level, isA<String>());
      expect(CharacterStrings.vocation, isA<String>());
      expect(CharacterStrings.status, isA<String>());
      expect(CharacterStrings.world, isA<String>());
      expect(CharacterStrings.residence, isA<String>());
      expect(CharacterStrings.achievement, isA<String>());
      expect(CharacterStrings.unlockedTitles, isA<String>());
      expect(CharacterStrings.sex, isA<String>());
      expect(CharacterStrings.createdOn, isA<String>());
      expect(CharacterStrings.accountStatus, isA<String>());
      expect(CharacterStrings.loyaltyPoints, isA<String>());
      expect(CharacterStrings.lastLogin, isA<String>());
      expect(CharacterStrings.notAvailable, isA<String>());
    });

    test('Should have correct values for each string', () {
      expect(CharacterStrings.newsErrorString, 'Erro ao carregar notícias');
      expect(CharacterStrings.undefined, 'Undefined');
      expect(CharacterStrings.level, 'Level');
      expect(CharacterStrings.vocation, 'Vocation');
      expect(CharacterStrings.status, 'Status');
      expect(CharacterStrings.world, 'World');
      expect(CharacterStrings.residence, 'Residence');
      expect(CharacterStrings.achievement, 'Achievement');
      expect(CharacterStrings.unlockedTitles, 'Unlocked titles');
      expect(CharacterStrings.sex, 'Sex');
      expect(CharacterStrings.createdOn, 'Created on');
      expect(CharacterStrings.accountStatus, 'Account Status');
      expect(CharacterStrings.loyaltyPoints, 'Loyalty points');
      expect(CharacterStrings.lastLogin, 'Last login');
      expect(CharacterStrings.notAvailable, 'N/A');
    });
  });
}
