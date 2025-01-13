import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:piapp/sample.dart';

import 'package:provider/provider.dart';
import 'package:piapp/PageProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(412, 889),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Sample(),
      ),
    );
  }
}
