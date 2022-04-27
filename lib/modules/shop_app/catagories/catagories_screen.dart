import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/models/shop_model/categories_model.dart';
import 'package:flutter_app3/modules/shop_app/cubit/cubit.dart';
import 'package:flutter_app3/modules/shop_app/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context,state) {
          return ListView.separated(
            itemBuilder: (context, index) => buildCatItem(ShopCubit.get(context).categoriesModel1!.data!.data![index]),
            separatorBuilder: (context, index) => SizedBox(
              height: 10.0,
            ),
            itemCount: ShopCubit.get(context).categoriesModel1!.data!.data!.length,
          );
        },
      );
  }

  Widget buildCatItem(DataModel model) => Padding (
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(
          image: NetworkImage(model.image!),
          fit: BoxFit.cover,
          width: 100.0,
          height: 100.0,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          model.name!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        Spacer(),
        Icon(
          Icons.arrow_forward_ios_outlined,
        ),
      ],
    ),
  );
}
