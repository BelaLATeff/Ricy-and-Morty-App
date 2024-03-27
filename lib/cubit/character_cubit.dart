import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/character_repo/character_repo.dart';
import '../data/models/characters.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepo charactersRepo;
  Character? characters;

  CharacterCubit(this.charactersRepo) : super(CharacterInitial());

  Character sendAllCharacters() {
    charactersRepo.fetchAllCharacters().then((characters) {
      emit(CharacterLoaded(characters));
      this.characters = characters;
    });
    return characters ?? Character();
  }
}
