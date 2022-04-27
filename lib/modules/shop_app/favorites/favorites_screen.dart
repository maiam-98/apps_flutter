import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/models/shop_model/favorites_model.dart';
import 'package:flutter_app3/modules/shop_app/cubit/cubit.dart';
import 'package:flutter_app3/modules/shop_app/cubit/state.dart';
import 'package:flutter_app3/shard/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! ShopLoadingGetFavoritesState,
          builder:(context) => ListView.separated(
            itemBuilder: (context, index) => buildGetFavorites(ShopCubit.get(context).favoritesModel.data!.data![index].product, context),
            separatorBuilder: (context, index) =>
                SizedBox(
                  height: 10.0,
                ),
            itemCount: ShopCubit.get(context).favoritesModel.data?.data?.length?? 0,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

}

Widget buildGetFavorites(model, context, {bool oldPrice = true}) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 130.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model.image),
                  width: 130.0,
                  height: 130.0,

                ),
                if(model.discount != 0 && oldPrice)
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(
                        fontSize: 11.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.0,
                      height: 1.3,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        model.price.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: defaultColor,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      if(model.discount != 0 && oldPrice)
                        Text(
                          model.oldPrice.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            ShopCubit.get(context).changeFavorites(model.id);
                          },
                          icon: Icon(
                            Icons.favorite,
                            size: 20.0,
                            color: Colors.red,

                          )),
                    ],
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );