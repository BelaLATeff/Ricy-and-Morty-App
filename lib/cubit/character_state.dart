part of 'character_cubit.dart';

@immutable
sealed class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final Character characters;

  CharacterLoaded(this.characters);
}
