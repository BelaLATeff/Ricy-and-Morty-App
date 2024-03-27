import '../models/characters.dart';
import '../web_services/character_web_services.dart';

class CharactersRepo {
  final CharactersWebServices charactersWebServices;
  CharactersRepo(this.charactersWebServices);

  Character? characters;

  Future<Character> fetchAllCharacters() async {
    final listOfCharactersResponse =
        await charactersWebServices.getAllCharacter();
    return characters = Character.fromJson(listOfCharactersResponse);
  }
}
