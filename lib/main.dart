import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/layout/news_app/cupit/cubit.dart';
import 'package:news/layout/news_app/cupit/states.dart';
import 'package:news/shared/network/remote/cash_helper.dart';
import 'package:news/shared/network/remote/dio_helper.dart';

import 'layout/news_app/news_app.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  MyApp app = MyApp();
  Widget aa= MyApp();
  DioHelper.init();
   CashHelper.init();
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context)=>NewsCubit()..init(),
      child: BlocConsumer<NewsCubit,NewsStates>(
       listener: (context, state) {},
        builder: (context, state) {
         return  MaterialApp(
           debugShowCheckedModeBanner: false,
           theme: ThemeData(
             scaffoldBackgroundColor: Colors.white,
             appBarTheme: const AppBarTheme(
               color: Colors.white,
               elevation: 0.0,
               titleTextStyle: TextStyle(
                   color: Colors.black
               ),
               systemOverlayStyle: SystemUiOverlayStyle(
                 statusBarIconBrightness:Brightness.dark,
                 statusBarColor: Colors.white,
               ),
               iconTheme: IconThemeData(
                   color: Colors.black
               ),
             ),
             bottomNavigationBarTheme:  BottomNavigationBarThemeData(
               type: BottomNavigationBarType.fixed,
               selectedItemColor: Colors.indigo.shade900,
             ),
             textTheme: const TextTheme(
               bodyText1: TextStyle(
                 fontSize:18.0,
                 fontWeight: FontWeight.bold,
                 color: Colors.black,
               ),
               bodyText2:  TextStyle(
                 color: Colors.black54,
               ),

             ),
           ),
           darkTheme: ThemeData(
             scaffoldBackgroundColor:HexColor('333739'),
             appBarTheme:  AppBarTheme(
               color:HexColor('333739'),
               elevation: 0.0,
               systemOverlayStyle: SystemUiOverlayStyle(
                 statusBarIconBrightness:Brightness.light,
                 statusBarColor:HexColor('333739'),
               ),
               iconTheme: const IconThemeData(
                   color: Colors.white
               ),

             ),
             bottomNavigationBarTheme:  BottomNavigationBarThemeData(
               type: BottomNavigationBarType.fixed,
               selectedItemColor: Colors.white,
               backgroundColor: HexColor('333739'),
             ),
             textTheme: const TextTheme(
               bodyText1: TextStyle(
                 fontSize:18.0,
                 fontWeight: FontWeight.bold,
                 color: Colors.white,
               ),
               bodyText2:  TextStyle(
                 color: Colors.white54,
               ),

             ),

           ),
           themeMode:NewsCubit.get(context).isDark? ThemeMode.dark:ThemeMode.light,
           home: const newsApp(),

         );
        },
      ),
    );
  }


}

