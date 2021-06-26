import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newaapp/settings.dart';
import 'dio.dart';
import 'states.dart';
import 'business.dart';
import 'sports.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    // ScienceScreen(),
    GetHhealth(),
  ];
  List<BottomNavigationBarItem> navBottom = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    BottomNavigationBarItem(
        icon: Icon(Icons.health_and_safety), label: "health"),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    if (index == 1) getSports();
    if (index == 2) gethealth();

    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  // List<dynamic> science = [];
  List<dynamic> health = [];
  List<dynamic> search = [];

  void getBusiness() {
    emit(NewsBusinessSuccessLoadingState());
    if (business.length == 0) {
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "business",
        "apiKey": "731b369823d2482cb51a6ca5eac0a200",
      }).then((value) {
        business = value.data["articles"];
        print(business[0]["title"]);
        emit(NewsSGetBusinessSuccessState());
      }).catchError((error) {
        print("error====>>>${error.toString()}");
        emit(NewsSGetBusinessErrorState(error));
      });
    } else {
      emit(NewsSGetBusinessSuccessState());
    }
  }

  void getSports() {
    emit(NewsSportsSuccessLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "sports",
        "apiKey": "731b369823d2482cb51a6ca5eac0a200",
      }).then((value) {
        sports = value.data["articles"];
        print(sports[0]["title"]);
        emit(NewsSGetSportsSuccessState());
      }).catchError((error) {
        print("error====>>>${error.toString()}");
        emit(NewsSGetSportsErrorState(error));
      });
    } else {
      emit(NewsSGetSportsSuccessState());
    }
  }

  void gethealth() {
    if (health.length == 0) {
      emit(NewssettingsSuccessLoading());
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "health",
        "apiKey": "731b369823d2482cb51a6ca5eac0a200",
      }).then((value) {
        health = value.data["articles"];
        print(health[0]["title"]);
        emit(NewssittingsSuccess());
      }).catchError((error) {
        print("error====>>>${error.toString()}");

        emit(NewssittingError(error));
      });
    } else {
      emit(NewssittingsSuccess());
    }
  }

  var searchController = TextEditingController();

  void getSearch(String value) {
    emit(NewsSearchSuccessLoadingState());
    DioHelper.getData(url: "v2/everything", query: {
      "q": "$value",
      "apiKey": "731b369823d2482cb51a6ca5eac0a200",
    }).then((value) {
      search = value.data["articles"];
      emit(NewsSearchSuccessState());
    }).catchError((error) {
      print("error====>>>${error.toString()}");
      ;
      emit(NewsSearchErrorState(error));
    });
  }

  bool isDark = false;

  void changemoode() {
    // ignore: unnecessary_null_comparison
    isDark = !isDark;
    emit(NewsChangeThemeState());
  }
}
