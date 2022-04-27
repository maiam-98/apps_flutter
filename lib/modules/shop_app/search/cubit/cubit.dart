import 'package:bloc/bloc.dart';
import 'package:flutter_app3/models/shop_model/search_model.dart';
import 'package:flutter_app3/modules/shop_app/search/cubit/state.dart';
import 'package:flutter_app3/shard/network/end_point.dart';
import 'package:flutter_app3/shard/network/local/cache_helper.dart';
import 'package:flutter_app3/shard/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState>
{
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  late SearchModel searchModel;
  void postSearch(String text)
  {
    emit(SearchLoadingState());
    DioHelper.postData(
        url: SEARCH,
        token: CacheHelper.getData(key: 'token'),
        data: {
          'text' : text,
        },
    ).then((value) {
      searchModel = SearchModel.fromJson(value.data);

      emit(SearchSuccessState());
    }).catchError((error){

      print(error.toString());
      emit(SearchSuccessState());
    });

  }
}