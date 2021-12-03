import 'package:app_networking_bloc/src/bloc/pokemons/pokemons_event.dart';
import 'package:app_networking_bloc/src/bloc/pokemons/pokemons_state.dart';
import 'package:app_networking_bloc/src/repository/pokemon_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  PokemonRepository pokemonRepository;

  //constructor
  PokemonsBloc({@required this.pokemonRepository}) : assert(pokemonRepository != null);

  @override
  PokemonsState get initialState => WithoutPokemonsState();

  @override
  Stream<PokemonsState> mapEventToState(
      PokemonsEvent event,
      ) async* {
    if (event is AddMorePokemons) {
      try {
        final pokemons = await this.pokemonRepository.fetchPokemons();
        yield (WithPokemonsState(pokemons: pokemons, amount:pokemons.length));
      } catch (error) {
        print(error);
      }
    }
  }
}
// yield es similar a un return