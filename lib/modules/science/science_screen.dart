import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:news/layout/news_app/cupit/cubit.dart';
import 'package:news/layout/news_app/cupit/states.dart';
import 'package:news/shared/components/components.dart';

// ignore: camel_case_types
class science_screen extends StatelessWidget {
  const science_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (context, state) {
        var list=NewsCubit.get(context).science;
        return list.isEmpty?Container():ListView.separated(

          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildAricleItrm(list[index],context),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Container(
              height: 1.0,
              width: double.infinity,
              color: Colors.indigo.shade900,
            ),
          ),
          itemCount: list.length,
        );

      },

    );
  }
}
