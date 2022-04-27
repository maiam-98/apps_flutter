
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_app3/shard/components/constants.dart';
import 'package:flutter_app3/shard/cubit/cubit.dart';
import 'package:flutter_app3/shard/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class LayoutHome extends StatelessWidget {


  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {

    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state){
          if(state is AppInsertDatabaseState)
            {
              Navigator.pop(context);
            }
        },
        builder: (context, state)
        {
          AppCubit cubit = BlocProvider.of(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.text[cubit.currentIndex],
              ),

            ),
            body: ConditionalBuilder(
              //الشرط المتحفف
              condition: state is! AppGetDatabaseLoadingState ,
              builder: (context) => cubit.screen[cubit.currentIndex],
              //اذا لم يتحقق
              fallback: (context) => Center(child: CircularProgressIndicator()) ,
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(
                cubit.fabIcon,
              ),
              onPressed: () {
                //if process current is long, the process after them don't wait them
                //try catch
                /*try {
                var name = gitName();
                print(await name);
                throw('this is the error');
              }catch(error){
                print('error is ${error.toString()}');
              };*/
                //solve the problem
                /*gitName().then((value) {
                print(value);
                print('mari');
                throw('this is the error');
              }).catchError((error){
                print('error ${error.toString()}');
              });*/

                if(cubit.isBottomSheetShown)
                {
                  if(formKey.currentState!.validate())
                  {
                    cubit.insertDatabase(
                        title: titleController.text,
                        date: dateController.text,
                        time: timeController.text
                    );
                    /*insertDatabase(
                        title: titleController.text,
                        date: dateController.text,
                        time: timeController.text).then((value) {
                      gitDataFromDatabase(database).then((value) {
                        Navigator.pop(context);
                        *//*setState(() {
                        isBottomSheetShown = false;
                        fabIcon = Icons.edit;
                        tasks = value;
                      });*//*

                      });

                    });
*/
                  }

                }
                else{
                  scaffoldKey.currentState!.showBottomSheet((context) => Form(
                    key: formKey,
                    child: Container(
                      //color: Colors.grey[100],
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          defaultFormField(
                            controll: titleController,
                            textInputType: TextInputType.text,
                            label: 'Task Title',
                            massageValidation: 'must de not empty',
                            prefix: Icons.title,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultFormField(
                            controll: timeController,
                            textInputType: TextInputType.datetime,
                            label: 'Task time',
                            massageValidation: 'must de not empty',
                            prefix: Icons.watch_later_outlined,
                            onTap: ()
                            {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                timeController.text = value!.format(context);
                              });
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultFormField(
                            controll: dateController,
                            textInputType: TextInputType.datetime,
                            label: 'Task date',
                            massageValidation: 'must de not empty',
                            prefix: Icons.date_range,
                            onTap: ()
                            {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2021-12-30'),
                              ).then((value) {
                                dateController.text = DateFormat.yMMMd().format(value!);
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                  ),
                    elevation: 50.0,
                  ).closed.then((value) {
                    cubit.changeBottomSheetState(
                        isShow: false,
                        icon: Icons.edit
                    );
                  });
                  cubit.changeBottomSheetState(
                      isShow: true,
                      icon: Icons.add
                  );

                }

              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {

                cubit.changeCurrent(index);

              },
              items:
              [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'Archive',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<String> gitName() async
  {
    return 'Mariam Al_Odini';
  }

}
// 1. create database     done
// 2. create table        done
// 3. open database       done
// 4. insert to database
// 5. get from database
// 6. update in database
// 7. delete from database

