
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildAricleItrm( articles,context)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children:
    [
      Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image:  DecorationImage(
              fit: BoxFit.cover,
              image:NetworkImage('${articles['urlToImage']}'),
            )
        ),

      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: Container(
          height: 120.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,

            children:
              [
              Expanded(
                child: Text(
                   '${articles['title']}',
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 4,
                  overflow:TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${articles['publishedAt']}',
                style:Theme.of(context).textTheme.bodyText2 ,
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);