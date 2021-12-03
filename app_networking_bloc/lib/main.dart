import 'package:app_networking_bloc/app.dart';
import 'package:app_networking_bloc/simple_bloc_delegate.dart';
import 'package:app_networking_bloc/src/bloc/pokemons/pokemons_bloc.dart';
import 'package:app_networking_bloc/src/repository/pokemon_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  PokemonRepository pokemonRepository = PokemonRepository();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<PokemonsBloc>(
        create: (BuildContext context) =>
            PokemonsBloc(pokemonRepository: pokemonRepository),
      )
    ],
    child: MyApp(),
  ));
}
