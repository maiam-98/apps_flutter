import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/modules/todo_app/ArchaiveTesk/ArchiveTaskScreen.dart';
import 'package:flutter_app3/modules/todo_app/DoneTask/DoneTaskScreen.dart';
import 'package:flutter_app3/modules/todo_app/NewTask/NewTaskScreen.dart';
import 'package:flutter_app3/shard/cubit/states.dart';
import 'package:flutter_app3/shard/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screen =
  [
    NewTaskScreen(),
    DoneTaskScreen(),
    ArchiveTaskScreen(),
  ];
  List<String> text =
  [
    'New Task',
    'Done Task',
    'Archive Task',
  ];
  void changeCurrent(int index)
  {
    currentIndex = index;
    emit(AppChangeBottomNav());
  }

  late Database database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];
  void createDatabase()
  {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT,date TEXT,time TEXT,status TEXT)')
            .then((value) {
          print('create table');
        }).catchError((error) {
          print('Error in create table ${error.toString()}');
        });
      },
      onOpen: (database) {
        gitDataFromDatabase(database);
        print('database opened');
      },
    ).then((value)
    {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertDatabase({
    required title,
    required date,
    required time}) async
  {
     await database.transaction((txn) {
      return database.rawInsert('INSERT INTO tasks (title, date, time, status) VALUES ("$title","$date","$time","new")')
          .then((value)
      {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());

        gitDataFromDatabase(database);
      })
          .catchError((error)
      {
        print('Error insert in database ${error.toString()}');
      });
    });
  }

  void gitDataFromDatabase(database)async
  {
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];
    emit(AppGetDatabaseLoadingState());
    return await database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element){
        if(element['status'] == 'new')
          newTasks.add(element);
        else if(element['status'] == 'done')
          doneTasks.add(element);
        else archiveTasks.add(element);
      });
      emit(AppGetDatabaseState());
    });

  }

  void updateData ({
    required String status,
    required int id,
}) async
  {
    return await database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
          gitDataFromDatabase(database);
          emit(AppUpdateDatabaseState());
    });
  }

  void deleteData ({
    required int id,
  }) async
  {
    return await database.rawDelete('DELETE FROM tasks WHERE id = ?',
        [id]).then((value) {
      gitDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }
  bool isBottomSheetShown = false;
  IconData fabIcon =Icons.edit;

  void changeBottomSheetState({
  required bool isShow,
  required IconData icon,
})
  {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }

  bool isDark = false;
  void themeMode({bool? fromShared}){
    if(fromShared != null)
      {
        isDark = fromShared;
        emit(AppChangeModeState());
      }

    else
      {
        isDark = !isDark;
        CacheHelper.putBool(key: 'isDark', value: isDark).then((value)
        {
          emit(AppChangeModeState());
        }
        );
      }

  }
}