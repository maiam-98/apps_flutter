import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/modules/shop_app/favorites/favorites_screen.dart';
import 'package:flutter_app3/modules/shop_app/search/cubit/cubit.dart';
import 'package:flutter_app3/modules/shop_app/search/cubit/state.dart';
import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit() ,
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    defaultFormField(
                      controll: searchController,
                      textInputType: TextInputType.text,
                      label: "Search",
                      massageValidation: 'Enter text to search',
                      prefix: Icons.search,
                      onField: (text){
                        SearchCubit.get(context).postSearch(text);
                      }
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    if(state is SearchLoadingState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 10.0,
                    ),
                    if(state is SearchSuccessState)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => buildGetFavorites(SearchCubit.get(context).searchModel.data!.data![index], context, oldPrice: false),
                        separatorBuilder: (context, index) =>
                            SizedBox(
                              height: 10.0,
                            ),
                        itemCount: SearchCubit.get(context).searchModel.data!.data!.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
