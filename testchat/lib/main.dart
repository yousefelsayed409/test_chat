import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testchat/bloc/Chat_cubit/chat_cubit.dart';
import 'package:testchat/bloc/Register_cubit/register_cubit.dart';
import 'package:testchat/bloc/login_cubit/login_cubit.dart';
import 'package:testchat/pages/Chat_page.dart';
import 'package:testchat/pages/Welcom_Page.dart';
import 'package:testchat/pages/login_page.dart';
import 'package:testchat/pages/resgister_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => ChatCubit(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          WelcomPage.id: (context) => WelcomPage(),
          loginPage.id: (context) => loginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          // ChaatPage.id :(context) => ChaatPage(),
         ChatPage.id :(context) => ChatPage()              
        },
        initialRoute: WelcomPage.id,
      ),
    );
  }
}
