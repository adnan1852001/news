import 'package:flutter/material.dart';
import 'package:news/layout/news_app/cupit/cubit.dart';
import 'package:news/layout/news_app/cupit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class settings_screen extends StatelessWidget {
  const settings_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
     listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children:
            [
              Icon(
                  Icons.dark_mode_rounded
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Dark mode',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 18
                ),
              ),
              Expanded(
                  child: Switch(
                      value: false,
                      onChanged: (val){

                      }
                  )
              )
            ],
          ),
        );
      },
    );
  }
}
