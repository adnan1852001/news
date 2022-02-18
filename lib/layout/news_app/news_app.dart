
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/layout/news_app/cupit/states.dart';
import 'package:news/modules/businss/mm/businss_screen.dart';
import 'package:news/shared/network/remote/dio_helper.dart';

import 'cupit/cubit.dart';
import 'cupit/cubit.dart';
import 'cupit/cubit.dart';

class newsApp extends StatelessWidget {
  const newsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>NewsCubit( )..getBusiness()..getSports()..getScience(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state) {},
        builder: (context, state)  {
          return Scaffold(
             appBar: AppBar(
               title: const Text(
        'News App',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ) ,
               actions: [
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Container(
                   decoration: const BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.black12
                   ),
                   child: IconButton(
                     onPressed: (){
                          NewsCubit.get(context).changeDarkMode();
                     },
                     icon:const Icon(
                       Icons.dark_mode_rounded,

                     ) ,

                   ),
                 ),
               ),


               ],
             ),
             body: NewsCubit.get(context).screens[NewsCubit.get(context).currentIndex],
             bottomNavigationBar:BottomNavigationBar(
                    currentIndex: NewsCubit.get(context).currentIndex,
             onTap: (index)
                {
                NewsCubit.get(context).changeBtn(index);
                },
             items: NewsCubit.get(context).bottomItems,
             ) ,


          );
      },

      ),
    );
  }
}
// actions: [
//
//                IconButton(
//                  onPressed: (){},
//
//                  icon:const Icon(
//                    Icons.search_sharp,
//                  size: 30.0,
//                  ) ,
//
//                ),
//
//                ],