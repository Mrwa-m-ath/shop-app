import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/MyIndex/Cubit.dart';
import 'package:shopapp/MyIndex/Dio.dart';
import 'package:shopapp/MyIndex/MyStata.dart';
import 'package:shopapp/MyIndex/value.dart';
import 'package:shopapp/PageDeis/HomePage.dart';
import 'package:shopapp/PageDeis/LogIn.dart';

import 'MyIndex/SharedPreferences.dart';
import 'PageDeis/PageView.dart';

void main() async {
  WidgetsFlutterBinding();
  await SharedPref.InitSharedPreferences();
  MyDio.dio;
  MyDio.InitMyDio();
  token = await SharedPref.GetSharedPref(key: 'token');
  // await SharedPref.GetSharedPref(key: 'Favat');

  bool? IsBording = await SharedPref.GetSharedPref(key: 'IsBording');
  print('Token :=${token}');
  Widget? widget;
  if (IsBording != null) {
    if (token != null) {
      widget = HomePage();
    } else {
      widget = LogInPage();
    }
  } else
    widget = PageViewDe();
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  Widget? widget;
  MyApp(this.widget);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCubit(),
      child: BlocConsumer<MyCubit, MyStat>(
        builder: (context, state) => MaterialApp(
          home: widget!,
        ),
        listener: (context, state) {},
      ),
    );
  }
}
