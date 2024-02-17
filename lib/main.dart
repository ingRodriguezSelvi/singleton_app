import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_app/bloc/user/user_cubit.dart';
import 'package:singleton_app/pages/page_one.dart';
import 'package:singleton_app/pages/page_two.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider( create: ( _ ) => UserCubit() ) ,
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pageOne',
        routes: {
          'pageOne': (BuildContext context) => const PageOne(),
          'pageTwo': (BuildContext context) => const PageTwo(),
        },
      ),
    );
  }
}
