
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app3/models/shop_model/categories_model.dart';
import 'package:flutter_app3/models/shop_model/change_favorites_model.dart';
import 'package:flutter_app3/models/shop_model/favorites_model.dart';
import 'package:flutter_app3/models/shop_model/home_model.dart';
import 'package:flutter_app3/models/shop_model/login_model.dart';
import 'package:flutter_app3/modules/shop_app/catagories/catagories_screen.dart';
import 'package:flutter_app3/modules/shop_app/cubit/state.dart';
import 'package:flutter_app3/modules/shop_app/favorites/favorites_screen.dart';
import 'package:flutter_app3/modules/shop_app/products/products_screen.dart';
import 'package:flutter_app3/modules/shop_app/settings/settings_screen.dart';
import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_app3/shard/components/constants.dart';
import 'package:flutter_app3/shard/network/end_point.dart';
import 'package:flutter_app3/shard/network/local/cache_helper.dart';
import 'package:flutter_app3/shard/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex =0;
  List<Widget> bottomScreen =
  [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  void changeBottom(int index)
  {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  Map<int, bool> favorites = {};

  HomeModel? homeModel;
  void getHomeData ()
  {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(
      url: HOME,
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      /*print(homeModel.data.products[1].inFavorites);
      print(homeModel.data.products[1].id);*/
      homeModel!.data!.products.forEach((element) {
       favorites.addAll({
          element.id: element.inFavorites,
        });
      });
      print(favorites.toString());
      emit(ShopSuccessHomeDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

   CategoriesModel? categoriesModel1;
  void getCategoriesModel ()
  {
    DioHelper.getData(
      url: GET_CATEGORIES,
      token: CacheHelper.getData(key: 'token'),
    ).then((value)
    {
      categoriesModel1 = CategoriesModel.fromJson(value.data);
      printFullText(categoriesModel1!.data!.data![1].image!);
      print('hallo');
      emit(ShopSuccessCategoriesState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }


  late ChangeFavoritesModel changeFavoritesModel;
  void changeFavorites(int productId)
  {
    favorites[productId] = !favorites[productId]!;
    emit(ShopChangeFavoritesState());

    DioHelper.postData(
        url: FAVORITES,
        data:
        {
          'product_id' : productId,
        },
        token: CacheHelper.getData(key: 'token'),
    ).then((value)
    {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      print(value.data);

      if(!changeFavoritesModel.status!)
        {
          favorites[productId] = !favorites[productId]!;
        }else
          {
            getFavoritesModel();
          }

      emit(ShopSuccessFavoritesState(changeFavoritesModel));
    }).catchError((error)
    {
      favorites[productId] = !favorites[productId]!;
      emit(ShopErrorFavoritesState());
    });
  }

  late FavoritesModel favoritesModel;
  void getFavoritesModel ()
  {
    emit(ShopLoadingGetFavoritesState());

    DioHelper.getData(
      url: FAVORITES,
      token: CacheHelper.getData(key: 'token'),
    ).then((value)
    {
      favoritesModel = FavoritesModel.fromJson(value.data);
      print(value.data.toString());

      emit(ShopSuccessGetFavoritesState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorGetFavoritesState());
    });
  }

  late ShopLoginModel userGetData;
  void getUserModel ()
  {
    emit(ShopLoadingGetUserState());

    DioHelper.getData(
      url: PROFILE,
      token: CacheHelper.getData(key: 'token'),
    ).then((value)
    {
      userGetData = ShopLoginModel.fromJson(value.data);
      print(value.data.toString());

      emit(ShopSuccessGetUserState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorGetUserState());
    });
  }

  void updateUserModel ({
  required String name,
  required String email,
  required String phone,
})
  {
    emit(ShopLoadingUpdateUserState());

    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: CacheHelper.getData(key: 'token'),
      data:
      {
        'name': name,
        'email': email,
        'phone': phone,
      }
    ).then((value)
    {
      userGetData = ShopLoginModel.fromJson(value.data);
      print(value.data.toString());

      emit(ShopSuccessUpdateUserState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorUpdateUserState());
    });
  }
}