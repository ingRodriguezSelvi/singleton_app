import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton_app/models/User.dart';
import 'package:singleton_app/services/user_services.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    final userServices = Provider.of<UserServices>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Page One'),
          actions: [
            IconButton(
                onPressed: () {
                  userServices.removeUser();
                },
                icon: const Icon(Icons.delete))],
        ),
        body: userServices.existsUser
            ? UserInformation(user: userServices.getUser)
            : const Center(child: Text('No user information')),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.pushNamed(context, 'pageTwo');
          },
        ));
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
            title: const Text('Name:'),
            subtitle: Text(user.name),
          ),
          ListTile(
              title: const Text('Edad:'), subtitle: Text(user.age.toString())),
          const Text('Professional',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Divider(),
          /*ListTile(
              title: const Text('Profession:'),
              subtitle: Text(user.professions.join(', '))),*/
          user.professions.isEmpty
              ? const Text('No professions')
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: user.professions
                      .map((profession) => ListTile(title:Text(profession)))
                      .toList(),
                )
        ],
      ),
    );
  }
}
