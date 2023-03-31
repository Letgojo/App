import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triptokorea/Pages/Login/register/%20register.dart';
import 'package:triptokorea/Pages/Login/FW_Find/FW_Find.dart';
import 'package:triptokorea/Pages/Login/ID_Find/ID_Find.dart';
import 'package:triptokorea/Pages/Login/Login.dart';
import 'package:triptokorea/models/api_service.dart';
import 'Pages/Menu/menuBar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //main 함수에서 async 사용
  // await Firebase.initializeApp(); //firebase 사용
  runApp(MultiProvider(providers: [
    // ChangeNotifierProvider(create: (context) => registerSerivce()),
    ChangeNotifierProvider(create: (context) => Api())
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyApp_State();
}

class MyApp_State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login());
  }
}
//시발돼라 짜증나게하지말고 ㅡ.ㅡ 