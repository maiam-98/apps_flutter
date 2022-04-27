import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/layout/NewsLayeout/NewsCubit/cubit.dart';
import 'package:flutter_app3/layout/NewsLayeout/NewsCubit/states.dart';
import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, states) {},
      builder: (context, states)
            {
              var articles = NewsCubit.get(context).search;
              return Scaffold(
                appBar: AppBar(),
                body: Column(
                  children:
                  [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: defaultFormField(
                        controll: searchController,
                        textInputType: TextInputType.text,
                        label: 'Search',
                        onChang: (value){
                          NewsCubit.get(context).getSearch(value);
                        },
                        massageValidation: 'search must not be Empty',
                        prefix: Icons.search,
                      ),
                    ),
                    Expanded(child: articleBuilderList(articles,isSearch: true)),
                  ],
                ),
              );
            },
         );
  }
}
