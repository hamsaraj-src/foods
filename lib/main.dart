import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/homepage/bloc/bloc.dart';
import 'package:newsapp/login/page/login.dart';
import 'data/repository/food_repository.dart';
// import 'homepage/page/homepage.dart';
import 'homepage/page/home_page.dart';
import 'login/page/login.dart';

void main() {
  runApp(Login());
}
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(),
//       home: BlocProvider(
//           create: (context) => HomePageBloc(repository: FoodRepositoryImpl()),
//           child: HomePage()),
//     );
//   }
// }
