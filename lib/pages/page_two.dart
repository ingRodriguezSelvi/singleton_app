import 'package:flutter/material.dart';

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
                  onPressed: () {},
                  color: Colors.blue,
                  child: const Text('Set user', style: TextStyle(color: Colors.white))),

              MaterialButton(
                  onPressed: () {},
                  color: Colors.blue,
                  child: const Text('Change age', style: TextStyle(color: Colors.white))),

              MaterialButton(
                  onPressed: () {},
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
