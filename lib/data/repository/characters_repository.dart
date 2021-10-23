import 'package:breaking_bad_flutter_bloc/data/models/characters.dart';
import 'package:breaking_bad_flutter_bloc/data/web_services/characters_web_service.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);
  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
