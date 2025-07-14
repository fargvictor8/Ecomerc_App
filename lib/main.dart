// lib/main.dart
import 'package:flutter/material.dart';
import 'package:untitled/core/Routing/app_router.dart';
import 'package:untitled/core/Routing/routes.dart';
import 'package:untitled/features/presentation/view/widgets/splssh_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp(appRouter:AppRouter()));
}
class MyApp extends StatefulWidget {

final  AppRouter appRouter;
  const MyApp({super.key,required this.appRouter});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: const SplsshScreen(),
      initialRoute: Routes.SplsshScreen,
      onGenerateRoute: widget.appRouter.generateRoute,
      debugShowCheckedModeBanner: false,

    );
  }
}
