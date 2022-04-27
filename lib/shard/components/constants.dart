 import 'dart:io';

import 'package:flutter_app3/modules/shop_app/%20shop_login/shopLogin.dart';
import 'package:flutter_app3/shard/network/local/cache_helper.dart';

import 'components.dart';

void singOut(context){
CacheHelper.removeData(key: 'token').then((value) {
navigateAndFinish(context, ShopLogin());
});
}
 void printFullText(String text)
 {
   final pattern = RegExp('.{1,800}');
   pattern.allMatches(text).forEach((match) => print(match.group(0)));
 }

String token ='';
String uId ='';

String getOs()
{
  return Platform.operatingSystem;
}
