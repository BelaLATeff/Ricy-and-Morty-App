import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/string.dart';
import 'cubit/character_cubit.dart';
import 'data/character_repo/character_repo.dart';
import 'data/models/character_results.dart';
import 'data/web_services/character_web_services.dart';
import 'modules/character_details_screen/character_details_screen.dart';
import 'modules/character_screen/character_Screen.dart';

class AppRouter {
  CharactersRepo? charactersRepo;
  CharacterCubit? characterCubit;

  AppRouter() {
    charactersRepo = CharactersRepo(CharactersWebServices());
    characterCubit = CharacterCubit(charactersRepo!);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => characterCubit!,
            child: const CharacterScreen(),
          ),
        );

      case characterDetailsScreen:
        final character = settings.arguments as CharacterResults;
        return MaterialPageRoute(
          builder: (context) => CharacterDetailsScreen(
            charResult: character,
          ),
        );
    }

    return null;
  }
}
