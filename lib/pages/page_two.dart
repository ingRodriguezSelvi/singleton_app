import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_app/bloc/user/user_cubit.dart';
import 'package:singleton_app/models/User.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Page Two'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              MaterialButton(
                  onPressed: () {
                    context.read<UserCubit>().setUser(
                         User(name: 'Andres', age: 26, professions: [
                            'Developer',
                            'Singer'
                         ], )
                    );
                  },
                  color: Colors.blue,
                  child: const Text('Set user', style: TextStyle(color: Colors.white))),

              MaterialButton(
                  onPressed: () {
                    context.read<UserCubit>().changeAge( 30 );
                  },
                  color: Colors.blue,
                  child: const Text('Change age', style: TextStyle(color: Colors.white))),

              MaterialButton(
                  onPressed: () {
                    context.read<UserCubit>().addProfession( 'Engineer' );
                  },
                  color: Colors.blue,
                  child: const Text('Add profession', style: TextStyle(color: Colors.white))),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}
