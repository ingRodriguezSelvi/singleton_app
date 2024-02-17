import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_app/bloc/user/user_cubit.dart';

import '../models/User.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Page One'),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<UserCubit>().removeUser();
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: const BodyScaffold(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.pushNamed(context, 'pageTwo');
          },
        ));
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (_, state) {
      switch (state.runtimeType) {
        case UserInitial:
          return const Center(
            child: Text("No info user"),
          );
        case UserActive:
          return UserInformation(user: (state as UserActive).user);
        default:
          return const Center(
            child: Text("No info user"),
          );
      }
    });
  }
}

class UserInformation extends StatelessWidget {
  final User user;

  const UserInformation({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General Information',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(
            title: Text('Name: ${user.name}'),
          ),
          ListTile(title: Text('Edad: ${user.age}')),
          const Text(
            'Professional',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ...user.professions.map((e) => ListTile(title: Text(e))).toList()
        ],
      ),
    );
  }
}
