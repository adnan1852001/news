import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/layout/news_app/cupit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/businss/mm/businss_screen.dart';
import 'package:news/modules/science/science_screen.dart';
import 'package:news/modules/settings/settings_screen.dart';
import 'package:news/modules/sports/sports_screen.dart';
import 'package:news/shared/network/remote/cash_helper.dart';
import 'package:news/shared/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';
class NewsCubit extends Cubit<NewsStates>{
  NewsCubit( ) : super(initialStates());
  static NewsCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;
  void init()async{
    isDark=CashHelper.getDataDark(key: 'isDark');
     print(isDark);
     print("jnddddddd");
  }
  List<BottomNavigationBarItem> bottomItems=
  [
    const BottomNavigationBarItem(
      label:'Business' ,
      icon: Icon(
        Icons.business_center,
      ),

    ),
    const BottomNavigationBarItem(
      label:'Sports' ,
      icon: Icon(
        Icons.sports_baseball,
      ),

    ),
    const BottomNavigationBarItem(
      label:'Science' ,
      icon: Icon(
        Icons.science,
      ),

    ),
    // const BottomNavigationBarItem(
    //   label:'Settings' ,
    //   icon: Icon(
    //     Icons.settings,
    //   ),
    //
    // ),
  //
  ];
  void changeBtn (int index){
    currentIndex=index;

    // if (index==1){
    //   getSports();
    // }else if (index==2){
    //   getScience();
    // }
    emit(BtnNavigationStates());

  }
 List<Widget> screens=
  [
    const businss_screen(),
    const sports_screen(),
    const science_screen(),
    const settings_screen(),
  ];
  //***********************************************
  List<dynamic> businss=[];

  void getBusiness() {
    Dio dio = Dio();
    dio.options.baseUrl = 'http://newsapi.org/';
    emit(NewsLoadingBusinessState());
    dio.get('v2/top-headlines', queryParameters: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '913bd85254aa492791398cb7642765d0'
    }).then((value) {
      print (value.data);
      businss=value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((e) {
      emit(NewsGetBusinessErorrState(e.toString()));

    });
  }
  //************************************************
  List<dynamic> sports=[];

  void getSports() {

      Dio dio = Dio();
      dio.options.baseUrl = 'http://newsapi.org/';
      emit(NewsLoadingSportsState());
      dio.get('v2/top-headlines', queryParameters: {
        'country': 'eg',
        'category': 'sport',
        'apiKey': '913bd85254aa492791398cb7642765d0'
      }).then((value) {
        print (value.data);
        sports=value.data['articles'];
        emit(NewsGetSportSuccessState());
      });


  }
  //***************************************************
  List<dynamic> science=[];

  void getScience() {

      Dio dio = Dio();
      dio.options.baseUrl = 'http://newsapi.org/';
      emit(NewsLoadingScienceState());
      dio.get('v2/top-headlines', queryParameters: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '913bd85254aa492791398cb7642765d0'
      }).then((value) {
        print (value.data);
        science=value.data['articles'];
        emit(NewsGetScienceSuccessState());
      });

  }
  late bool isDark;
  void changeDarkMode(){
    isDark=!isDark ;

    CashHelper.putDatadark(key: 'isDark', value: isDark).then((value) {
      emit(NewsDarkModeState());

    });

    print(isDark);

  }
}

// void getBusinss(){
//   emit(NewsLoadingState());
//   DioHelper.getData(
//     url:'everything',
//     query:
//     {
//       'q':'tesla',
//       'from':'2022-01-14',
//       'sortBy':'publishedAt',
//       'apiKey':'ec48efbb769b4b90a15a2cbb8560e850',
//
//       // everything?
//       // q=tesla&from=2022-01-14&sortBy=publishedAt&apiKey=ec48efbb769b4b90a15a2cbb8560e850
//     },
//
//     //   https://newsapi.org/v2/everything?q=apple&from=2022-02-14&to=2022-02-14&sortBy=popularity&apiKey=ec48efbb769b4b90a15a2cbb8560e850
//
//   ).then((value){
//     // ignore: avoid_print
//     print (value.data['articles'][0]['title']);
//     emit(NewsGetBusinessSuccessState());
//     // ignore: avoid_print
//   }).catchError((error){print(error.toString());
//   emit(NewsGetBusinessErorrState(error));
//   });
// }