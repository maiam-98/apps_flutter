
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app3/models/shop_model/categories_model.dart';
import 'package:flutter_app3/models/shop_model/home_model.dart';
import 'package:flutter_app3/modules/shop_app/cubit/cubit.dart';
import 'package:flutter_app3/modules/shop_app/cubit/state.dart';
import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_app3/shard/components/constants.dart';
import 'package:flutter_app3/shard/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryData = ShopCubit?.get(context).categoriesModel1;
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state)
      {
        if(state is ShopSuccessFavoritesState)
            {
              if(!state.model.status!)
                {
                  showToast(text: state.model.message!, state: ToastState.ERROR);
                }
            }
      },
      builder: (context, state){
        return Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ConditionalBuilder(
                    condition: ShopCubit.get(context).homeModel != null && categoryData != null,
                    builder: (context) =>productsBuilder(ShopCubit.get(context).homeModel!, ShopCubit.get(context).categoriesModel1!, context),
                    fallback: (context) => Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Widget productsBuilder(HomeModel model, CategoriesModel categoriesModel, context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CarouselSlider(
          items: model.data!.banners.map((e) => Image(
            image: NetworkImage('${e.image}'),
            width: double.infinity,
            fit: BoxFit.cover,
          ),).toList(),
          options: CarouselOptions(
            height: 250.0,
            initialPage: 0,
            viewportFraction: 1.0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
          ),
      ),
      SizedBox(
        height: 10.0,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 24.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 100.0,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildCategories(categoriesModel.data!.data![index]),
                  separatorBuilder: (context, index) =>  SizedBox(
                    width: 10.0,
                  ),
                  itemCount: categoriesModel.data!.data!.length,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'NewProducts',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 24.0,
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10.0,
      ),
      Container(
        color: Colors.grey[300],
        child: GridView.count(
          shrinkWrap: true,
          physics:NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          childAspectRatio: 1/1.56,
          children: List.generate(
                model.data!.products.length,
                (index) => buildGridProduct(model.data!.products[index], context),
          ),
        ),
      ),
    ],
  );

  Widget buildCategories (DataModel model) => Stack(
    alignment: AlignmentDirectional.bottomEnd,
    children: [
      Image(
        image: NetworkImage(model.image!),
        height: 100.0,
        width: 100.0,
        fit: BoxFit.cover,
      ),
      Container(
        color: Colors.black.withOpacity(.8),
        width: 100.0,
        child: Text(
          model.name!,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
  Widget buildGridProduct( model, context, {bool isSearch = true}) => Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
                image: NetworkImage(model.image),
               width: double.infinity,
               height: 200.0,

            ),
            if(model.discount != 0 && isSearch)
            Container(
              color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                'DISCOUNT',
                style: TextStyle(
                  fontSize: 11.0,
                  color:Colors.white,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.0,
                  height: 1.3,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${model.price.round()}',
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
                  if(model.discount != 0 && isSearch)
                  Text(
                     '${model.oldPrice.round()}',
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
                      onPressed: ()
                      {
                        ShopCubit.get(context).changeFavorites(model.id);
                      },
                      icon: ShopCubit.get(context).favorites[model.id]! ? Icon(
                        Icons.favorite,
                        size: 20.0,
                        color: Colors.red,

                      ) :Icon(
                        Icons.favorite_border,
                        size: 20.0,
                        color: Colors.grey,

                      ) ),
                ],
              ),
            ],
          ),
        ),

      ],
    ),
  );
}
