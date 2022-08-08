import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   ScreenUtil.init(context, designSize: const Size(360, 884));
    double width = 360.w;
    double height = 884.h;
    
    return Scaffold(
      body: Center(
        child: Text("HomePage"),
      ),
    );
  }
}