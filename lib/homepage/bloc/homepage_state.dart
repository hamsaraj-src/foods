import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsapp/data/model/food.dart';

abstract class HomePageState extends Equatable {}

class HomePageInitialState extends HomePageState {
  // LogInInitialState(bool bool);
  // final bool isEmail;

  // HomePageInitialState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomePageLoadingState extends HomePageState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomePageLoadedState extends HomePageState {
  List<Recipe> recipes;
  HomePageLoadedState({@required this.recipes});
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class HomePageErrorState extends HomePageState {
  String message;
  HomePageErrorState({@required this.message});
  @override
  // TODO: implement props
  List<Object> get props => null;
}
