import 'package:breaking_bad_flutter_bloc/businesslogic/characters_cubit.dart';
import 'package:breaking_bad_flutter_bloc/constants/strings.dart';
import 'package:breaking_bad_flutter_bloc/data/repository/characters_repository.dart';
import 'package:breaking_bad_flutter_bloc/data/web_services/characters_web_service.dart';
import 'package:breaking_bad_flutter_bloc/presentation/screens/characters_screen.dart';
import 'package:breaking_bad_flutter_bloc/presentation/screens/character_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
    }
  }
}
