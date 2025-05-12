import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:projectcaju/modules/character/repositories/character_repository.dart';
import 'package:projectcaju/modules/character/services/character_service.dart';

class MockCharacterRepository extends Mock implements CharacterRepository {}

void main() {
  late CharacterService characterService;
  late MockCharacterRepository mockRepository;

  setUp(() {
    mockRepository = MockCharacterRepository();
    characterService = CharacterService(characterRepository: mockRepository);
  });

  test('Should inject the CharacterRepository correctly', () {
    expect(characterService.characterRepository, isA<CharacterRepository>());
    expect(characterService.characterRepository, same(mockRepository));
  });
}
