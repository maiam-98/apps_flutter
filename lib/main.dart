import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app3/layout/shop_app/shopLayout.dart';
import 'package:flutter_app3/layout/social_app/cudit/cudit.dart';
import 'package:flutter_app3/layout/social_app/social_Layeout.dart';
import 'package:flutter_app3/modules/shop_app/%20shop_login/shopLogin.dart';
import 'package:flutter_app3/modules/shop_app/cubit/cubit.dart';
import 'package:flutter_app3/modules/social_app/social_login/login_screen.dart';
import 'package:flutter_app3/responsive.dart';
import 'package:flutter_app3/shard/blocObserve.dart';
import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_app3/shard/components/constants.dart';
import 'package:flutter_app3/shard/cubit/cubit.dart';
import 'package:flutter_app3/shard/cubit/states.dart';
import 'package:flutter_app3/shard/styles/themes.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'layout/NewsLayeout/NewsCubit/cubit.dart';
import 'mobile_screen.dart';
import 'modules/shop_app/ on_boarding/on_boarding_screen.dart';
import 'shard/network/local/cache_helper.dart';
import 'shard/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'layout/todo_app/LayeoutHome.dart';
import 'layout/NewsLayeout/NewsLayeout.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async
{
  print(message.data.toString());
  showToast(text: 'Background Message ', state: ToastState.SUCCESS);
}

void main()async {
  //بيتأكد ان كل حاجه هنا في الميتود خلصت بعدبن بيفتح الابليكيشن
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  /*if(Platform.isWindows)
    await DesktopWindow.setMinWindowSize(
      Size(
        350.0,
        650.0,
      ),
    );*/
  var token = await FirebaseMessaging.instance.getToken();
  print('token');
  print(token);

  //foreground fcm(firebase cloud message)
  FirebaseMessaging.onMessage.listen((event)
  {
    print(event.data.toString());
    showToast(text: 'on Message', state: ToastState.SUCCESS);
  }
  );

  //when click  on notification to open app
  FirebaseMessaging.onMessageOpenedApp.listen((event)
  {
    print(event.data.toString());
    showToast(text: 'on Message to open app', state: ToastState.SUCCESS);

  }
  );

  //Background fcm
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  Widget widget;
  await CacheHelper.init();
  //bool isDark = CacheHelper.getData(key: 'isDark');
  //bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  //String token = CacheHelper.getData(key: 'token');
   uId = CacheHelper.getData(key: 'uId');
 /* if(onBoarding != null)
    {
      if(token != null) widget = ShopLayout();
      else widget = ShopLogin();
    }else widget = OnBoardingScreen();
*/
  if(uId != null)
    {
      widget = SocialLayout();
    }else{
      widget = SocialLogin();
  }




  HttpOverrides.global = MyHttpOverrides();

  runApp(MyApp(
    //isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? startWidget;
  MyApp({this.isDark, this.startWidget});
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (BuildContext context) => AppCubit()..themeMode(
          // fromShared: isDark!,

    ),),
        BlocProvider(
    create: (BuildContext context) => NewsCubit()..getBusiness()..getScience()..getSports(),
    ),
        BlocProvider(
    create: (BuildContext context) => ShopCubit()..getHomeData()..getCategoriesModel()..getFavoritesModel()..getUserModel()),
        BlocProvider(
    create: (BuildContext context) => SocialAppCubit()..getUserData()..getPost()),
    ],
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state){},
          builder: (context, state){
            return MaterialApp(
              theme: lightTheme,
              darkTheme: darkTheme,
              //themeMode: AppCubit().get(context).isDark ? ThemeMode.dark : ThemeMode.light,
              themeMode: ThemeMode.light,
              debugShowCheckedModeBanner: false,

              home:startWidget,
              /*home: LayoutBuilder(builder: (context, constraints) {
                print(constraints.maxWidth.toInt());
                if(constraints.maxWidth.toInt() <= 532)
                  return MobileScreen();

                return Responsive();
              }),*/
             /* home: Builder(builder:(context)
              {
                if(MediaQuery.of(context).size.width.toInt() <= 532)
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaleFactor: .7
                    ),
                    child: MobileScreen(),
                  );
                return Responsive();


              }),*/
             /*home:ScreenTypeLayout(
               mobile: Text(
                 'hello',
                 style: TextStyle(
                   fontSize: 80.0,
                 ),
               ),
               tablet: startWidget,

             ),*/
            );
          },
        )
      );
  }
}

class MyHttpOverrides extends HttpOverrides{


@override
HttpClient createHttpClient(SecurityContext? context){
  return super.createHttpClient(context)
    ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
}
}

