import 'package:bloc/bloc.dart';
import 'package:breaking_bad_flutter_bloc/data/models/characters.dart';
import 'package:breaking_bad_flutter_bloc/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  final CharactersRepository charactersRepository;
  late List<Character> characters;
  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
