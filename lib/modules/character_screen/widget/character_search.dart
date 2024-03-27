import 'package:flutter/material.dart';
import '../../../constants/my_color.dart';
import '../../../constants/string.dart';
import '../../../data/models/character_results.dart';

class CharacterSearch extends SearchDelegate {
  final List<CharacterResults> characterSearch;
  CharacterResults? characterResults;

  CharacterSearch({required this.characterSearch});

  @override
  String get searchFieldLabel => "Find a Character";

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: MyColors.myWhite),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        labelStyle: TextStyle(),
      ),
      appBarTheme: const AppBarTheme(
        shadowColor: MyColors.myWhite,
        color: MyColors.myYellow,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final listOfCharacter = characterSearch
        .where((character) =>
            character.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return listOfCharacter.isEmpty
        ? const Center(
            child: Text(
              "Character Not Found..!",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
          )
        : ListView.builder(
            itemCount: listOfCharacter.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () => Navigator.pushNamed(context, characterDetailsScreen,
                  arguments: listOfCharacter[index]),
              minVerticalPadding: 18,
              title: Text(
                listOfCharacter[index].name!,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: MyColors.myGrey,
                ),
              ),
              leading: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  listOfCharacter[index].image!,
                ),
              ),
            ),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listOfCharacter = characterSearch
        .where((character) =>
            character.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return listOfCharacter.isEmpty
        ? const Center(
            child: Text("Character Not Found..!"),
          )
        : ListView.builder(
            itemCount: listOfCharacter.length,
            itemBuilder: (context, index) => ListTile(
              minVerticalPadding: 18,
              title: Text(listOfCharacter[index].name!),
              leading: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  listOfCharacter[index].image!,
                ),
              ),
            ),
          );
  }
}
