import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newaapp/component.dart';
import 'package:newaapp/search.dart';
import 'cupit.dart';
import 'states.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("News"),
            actions: [
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    navigat(context, SearchScreen());
                  }),
              IconButton(
                  icon: Icon(Icons.brightness_4_rounded),
                  onPressed: () {
                    // ignore: unnecessary_statements
                    NewsCubit.get(context).changemoode();

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => SearchScreen()));
                  }),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: NewsCubit.get(context).currentIndex,
            onTap: (index) {
              NewsCubit.get(context).changeIndex(index);
            },
            items: NewsCubit.get(context).navBottom,
          ),
          body: NewsCubit.get(context)
              .screens[NewsCubit.get(context).currentIndex],
        );
      },
    );
  }
}
