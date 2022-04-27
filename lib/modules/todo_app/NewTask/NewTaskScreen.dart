import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_app3/shard/components/constants.dart';
import 'package:flutter_app3/shard/cubit/cubit.dart';
import 'package:flutter_app3/shard/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
       listener: (context, state){},
      builder: (context, state)
      {
        var tasks = AppCubit().get(context).newTasks;
        return tasksBuilder(tasks: tasks);
      },
    );
  }
}
