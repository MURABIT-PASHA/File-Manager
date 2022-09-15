import 'package:file_manager/menu.dart';
import 'package:file_manager/storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboard.dart';

void main() {
  runApp(FileManager());
}

class FileManager extends StatelessWidget {
  Future<bool> showMainPage() async {
    final prefs = await SharedPreferences.getInstance();
    final showMain = prefs.getBool('showMain') ?? false;
    return showMain;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<bool>(
        future: showMainPage(),
        builder: (buildContext, snapshot) {
          if(snapshot.hasData) {
            if(snapshot.data == false){
              // Return your login here
              return const OnboardPage();
            }
            else{
              // Return your home here
              return const MainMenu();
            }
          } else {
            // Return loading screen while reading preferences
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      routes: {
        MainMenu.id: (context) => const MainMenu(),
        OnboardPage.id:(context) => const OnboardPage(),
        StoragePage.id:(context) => const StoragePage()
      },
    );
  }
}
