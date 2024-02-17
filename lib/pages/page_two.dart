import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton_app/models/User.dart';
import 'package:singleton_app/services/user_services.dart';

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
                    final userServices = Provider.of<UserServices>(context, listen: false);
                    userServices.setUser = User(name: 'John', age: 30, professions: ['Developer', 'Designer']);
                  },
                  color: Colors.blue,
                  child: const Text('Set user', style: TextStyle(color: Colors.white))),

              MaterialButton(
                  onPressed: () {
                    final userServices = Provider.of<UserServices>(context, listen: false);
                    userServices.changeAge(40);
                  },
                  color: Colors.blue,
                  child: const Text('Change age', style: TextStyle(color: Colors.white))),

              MaterialButton(
                  onPressed: () {
                    final userServices = Provider.of<UserServices>(context, listen: false);
                    userServices.addProfession('Engineer');
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
