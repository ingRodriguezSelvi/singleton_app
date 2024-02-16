import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Page One'),
      ),
        body: const UserInformation(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.pushNamed(context, 'pageTwo');
          },
        )
    );
  }
}

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child:  const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text('General Information', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Divider(),
          ListTile(
            title: Text('Name:'),
          ),
          ListTile(
            title: Text('Edad:')),

          Text('Professional', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Divider(),
          ListTile(
            title: Text('Profession:'),
          ),
        ],
      ),
    );
  }
}
