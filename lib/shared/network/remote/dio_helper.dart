import 'package:dio/dio.dart';

class DioHelper{
  static Dio dio=Dio();

  static init(){
    dio =Dio(
      BaseOptions(
        baseUrl:'http://newsapi.org/v2/',
        receiveDataWhenStatusError: true,

      ),
    );
  }
  static Future<Response> getData({
    required String url,
    required Map<String,dynamic> query,
   })async{
     // ignore: void_checks
     return await dio.get(url,queryParameters: query,);
  }
}
//https://newsapi.org/v2/
// everything?
// q=tesla&from=2022-01-15&sortBy=publishedAt&apiKey=ec48efbb769b4b90a15a2cbb8560e850

