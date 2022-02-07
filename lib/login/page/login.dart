// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:newsapp/homepage/page/homepage.dart';
import 'package:newsapp/login/bloc/bloc.dart';
import 'package:newsapp/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  // const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LogInBloc(),
        child: MaterialApp(
          title: Strings.title,
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: const MyLogin(title: Strings.title),
        ));
    // return
  }
}

class MyLogin extends StatefulWidget {
  const MyLogin({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  LogInBloc loginBloc;
  String value;
  bool isEmail = true;
  final TextEditingController controller = new TextEditingController();
  @override
  void initState() {
    super.initState();
    // print(getDeviceDetails());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    loginBloc = BlocProvider.of<LogInBloc>(context);
    void navigatetolistpage() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            // ignore: prefer_const_constructors
            Text(
              Strings.login,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  TextField(
                    obscureText: false,
                    onChanged: (String value) {
                      this.value = value;
                      // print(this.value);
                    },
                    onTap: () {},
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: Strings.email,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          this.isEmail = true;
                        });
                        FocusScope.of(context).requestFocus(FocusNode());

                        loginBloc.add(LoginNextbutton(
                          value: this.value,
                          isEmail: this.isEmail,
                        ));
                      },
                      child: const Text(Strings.login)),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: BlocListener<LogInBloc, LogInState>(
                      listener: (context, state) {
                        if (state is LogInSuccessState) {
                          // print("SUSSCEE");
                          navigatetolistpage();
                        } else if (state is LogInFailureState) {
                          // print(state.message);
                          final snackBar = SnackBar(
                            content: const Text('login failed'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: BlocBuilder<LogInBloc, LogInState>(
                        builder: (context, state) {
                          return Container();
                        },
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
