import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_in_action_part_2/page/page_container.dart';
import 'package:flutter_in_action_part_2/model/app_setting.dart';

import 'styles.dart';

//The main function from which the program launches
void main() {
  //Initialize the setting for the app
  AppSetting settings = new AppSetting();

  //Necessary for the app to run
  WidgetsFlutterBinding.ensureInitialized();
  //Sets the screen to be lock in portrait mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown])
      //The .then starts the app running asynchronously
      .then((_) => runApp(
      //Passing in the settings
      MyApp(settings: settings)));
}

//The Flutter Widget from which everything else branches off of
class MyApp extends StatelessWidget {
  //Grabs the settings
  final AppSetting settings;

  //=================================== Constructor ============================
  const MyApp({Key key, this.settings}) : super(key: key);
  //============================================================================

  //============== Methods =====================================================
  @override
  Widget build(BuildContext context) {
    //Defining the theme of the app
    //This data will be kept in the tree and can be referenced anywhere
    final theme = ThemeData(
      //Sets font
      fontFamily: "Cabin",
      //Sets background colors
      primaryColor: AppColor.midnightSky,
      accentColor: AppColor.midnightCloud,
      //Sets text colors
      primaryTextTheme: Theme.of(context).textTheme.apply(
        bodyColor: AppColor.textColorDark,
        displayColor: AppColor.textColorDark,
      ),
      textTheme: Theme.of(context).textTheme.apply(
        bodyColor: AppColor.textColorDark,
        displayColor: AppColor.textColorDark,
      ),
    );


    return MaterialApp(
      title: 'Weather App',
      //Removes the DEBUG banner in the top right
      debugShowCheckedModeBanner: false,
      //Sets the theme to the predefine theme above
      theme: theme,
      //Sends it to the PageContainer which is a in between all the
      //different screens
      home: PageContainer(settings: settings),
    );
  }
  //============================================================================
}
