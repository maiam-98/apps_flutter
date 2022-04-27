abstract class NewsStates {}

class NewsInitialState extends NewsStates{}

class NewsChangeBottomNav extends NewsStates{}

class NewsLoadingGetBusinessState extends NewsStates{}

class NewsSuccessGetBusinessState extends NewsStates{}

class NewsErrorGetBusinessState extends NewsStates
{
  final String error;

  NewsErrorGetBusinessState(this.error);

}

class NewsLoadingGetScienceState extends NewsStates{}

class NewsSuccessGetScienceState extends NewsStates{}

class NewsErrorGetScienceState extends NewsStates
{
  final String error;

  NewsErrorGetScienceState(this.error);

}

class NewsLoadingGetSportsState extends NewsStates{}

class NewsSuccessGetSportsState extends NewsStates{}

class NewsErrorGetSportsState extends NewsStates
{
  final String error;

  NewsErrorGetSportsState(this.error);

}

class NewsLoadingGetSearchState extends NewsStates{}

class NewsSuccessGetSearchState extends NewsStates{}

class NewsErrorGetSearchState extends NewsStates
{
  final String error;

  NewsErrorGetSearchState(this.error);

}