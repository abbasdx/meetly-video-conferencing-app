import 'package:flutter/material.dart';
import 'package:meetly/resources/auth_methods.dart';
import 'package:meetly/screens/home_screen.dart';
import 'package:meetly/screens/login_screen.dart';
import 'package:meetly/screens/video_call_screen.dart';
import 'package:meetly/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meetly',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login': (context)=> const LoginScreen(),
        '/home': (context)=> const HomeScreen(),
        '/video-call': (context)=> const VideoCallScreen()

      },
      home: StreamBuilder(stream: AuthMethods().authChanges, builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
          
        }
        if(snapshot.hasData){
          return const HomeScreen();
        }
        
        return LoginScreen();
      }),
    );
  }
}
