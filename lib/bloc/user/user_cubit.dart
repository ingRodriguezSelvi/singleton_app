import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_app/models/User.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState>{

  UserCubit() : super(UserInitial());

  void setUser( User user ){
    emit( UserActive(user) );
  }

  void changeAge( int age ) {
    final currentState = state;
    if( currentState is UserActive ){
      final newUser = currentState.user.copyWith(age: age);
      emit( UserActive(newUser) );
    }
  }

  void addProfession( String profession ){
    final currentState = state;
    if( currentState is UserActive ){
      final newUser = currentState.user.copyWith(professions: [...currentState.user.professions, profession]);
      emit( UserActive(newUser) );
    }
  }

  void removeUser(){
    emit( UserInitial() );
  }

}
