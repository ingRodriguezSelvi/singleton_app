import 'package:flutter/material.dart';
import 'package:singleton_app/models/User.dart';
import 'package:singleton_app/services/user_services.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: StreamBuilder<User>(
            stream: userServices.userStream,
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              return snapshot.hasData
                  ? Text('Page Two - ${snapshot.data!.name}')
                  : const Text('Page Two');
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                  onPressed: () {
                    userServices.setUser(User(
                        name: 'Juan',
                        age: 30,
                        professions: ['Developer', 'Teacher']));
                  },
                  color: Colors.blue,
                  child: const Text('Set user',
                      style: TextStyle(color: Colors.white))),
              MaterialButton(
                  onPressed: () {
                    userServices.changeAge(40);
                  },
                  color: Colors.blue,
                  child: const Text('Change age',
                      style: TextStyle(color: Colors.white))),
              MaterialButton(
                  onPressed: () {},
                  color: Colors.blue,
                  child: const Text('Add profession',
                      style: TextStyle(color: Colors.white))),
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
