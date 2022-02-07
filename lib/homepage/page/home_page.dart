import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:newsapp/homepage/bloc/bloc.dart';
import 'package:newsapp/homepage/bloc/homepage_bloc.dart';
import 'package:newsapp/homepage/bloc/homepage_event.dart';
import 'package:newsapp/homepage/elements/error.dart';
import 'package:newsapp/homepage/elements/list.dart';
import 'package:newsapp/homepage/elements/loading.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageBloc homebloc;

  @override
  void initState() {
    homebloc = BlocProvider.of<HomePageBloc>(context);
    homebloc.add(HomePageFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:
            BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
          if (state is HomePageInitialState) {
            print(state);
            return buildLoading();
          } else if (state is HomePageLoadingState) {
            return buildLoading();
          } else if (state is HomePageLoadedState) {
            return buildHintsList(state.recipes);
          } else if (state is HomePageErrorState) {
            return buildError(state.message);
          }
        }),
      ),
    );
  }
}
