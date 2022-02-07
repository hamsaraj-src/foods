import 'package:flutter/cupertino.dart';
import 'package:newsapp/data/model/food.dart';
import 'package:newsapp/data/repository/food_repository.dart';

import 'bloc.dart';
import 'package:bloc/bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  FoodRepository repository;
  // HomePageBloc() : super(null) {}
  HomePageBloc({@required this.repository}) : super(null);
  HomePageState get initialState => HomePageInitialState();
  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is HomePageFetchEvent) {
      yield HomePageLoadingState();
      try {
        List<Recipe> recipes = await repository.getFoods();
        yield HomePageLoadedState(recipes: recipes);
      } catch (e) {
        yield HomePageErrorState(message: e.toString());
      }
    }
  }
}
