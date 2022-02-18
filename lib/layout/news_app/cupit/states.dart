// ignore_for_file: non_constant_identifier_names

abstract class NewsStates{}

// ignore: camel_case_types
class initialStates extends NewsStates{}

class BtnNavigationStates extends NewsStates{}
//************************************
class NewsLoadingBusinessState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErorrState extends NewsStates
{
  final String Erorr;

  NewsGetBusinessErorrState(this.Erorr);
}
//**************************************
class NewsLoadingSportsState extends NewsStates{}

class NewsGetSportSuccessState extends NewsStates{}

class NewsLoadingScienceState extends NewsStates{}

class NewsGetScienceSuccessState extends NewsStates{}

  class NewsDarkModeState extends NewsStates{}