
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ledgerpratice/getit_locater.dart';
import 'package:ledgerpratice/home_screen.dart';
import 'package:ledgerpratice/login_screen.dart';
import 'package:ledgerpratice/state_managemnt.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  locater.registerSingleton<LedgerGlobalState>(LedgerGlobalState());
 await Firebase.initializeApp();
  runApp(LedgerTask());
}


class LedgerTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen(),);
  }
}

