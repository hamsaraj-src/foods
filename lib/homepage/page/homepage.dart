// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/data/model/food.dart';
import 'package:newsapp/data/repository/food_repository.dart';
import 'package:newsapp/homepage/bloc/bloc.dart';
import 'package:newsapp/strings.dart';
import 'package:newsapp/homepage/bloc/homepage_state.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(repository: FoodRepositoryImpl()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(Strings.title),
          backgroundColor: Colors.red,
        ),
        body: Cards(),
      ),
    );
  }
}

class Cards extends StatefulWidget {
  @override
  CardState createState() => CardState();
}

class CardState extends State<Cards> {
  HomePageBloc homeBloc;
  @override
  void initState() {
    homeBloc = BlocProvider.of<HomePageBloc>(context);
    homeBloc.add(HomePageFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
      if (state is HomePageInitialState) {
        print("buildloading");
        return buildloading();
      } else if (state is HomePageLoadingState) {
        return buildloading();
      } else if (state is HomePageLoadedState) {
        return buildhintslist(state.recipes);
      } else if (state is HomePageErrorState) {
        return CircularProgressIndicator(
          color: Colors.blue,
        );
      } else {
        return CircularProgressIndicator();
      }
    });
  }
}

Widget buildloading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildhintslist(List<Recipe> recipes) {
  return ListView.builder(
      itemCount: recipes.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 90,
                width: 100,
                child: Image.network(recipes[index].imageUrl),
              ),
              Text(recipes[index].title),
            ],
          ),
        );
      });
}
