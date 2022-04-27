import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/modules/shop_app/%20shop_login/shopLogin.dart';
import 'package:flutter_app3/modules/shop_app/cubit/cubit.dart';
import 'package:flutter_app3/modules/shop_app/cubit/state.dart';
import 'package:flutter_app3/modules/shop_app/search/search_screen.dart';
import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_app3/shard/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = ShopCubit.get(context);
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context,state){},
      builder: (context,state){
      return  Scaffold(
          appBar: AppBar(
            title: Text(
              'SALLA',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            actions: [
              IconButton(
                onPressed: ()
                {navigateTo(context, SearchScreen());},
                icon: Icon(Icons.search),
              ),
            ],
          ),
          body: cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index)
              {
                cubit.changeBottom(index);
              },
              currentIndex: cubit.currentIndex,
              items:
              [
                BottomNavigationBarItem(
                  icon:Icon(Icons.home,),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon:Icon(Icons.apps,),
                  label: 'Categories',
                ),
                BottomNavigationBarItem(
                  icon:Icon(Icons.favorite,),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon:Icon(Icons.settings,),
                  label: 'Settings',
                ),
              ]
          ),
        );
      },
    );
  }
}
