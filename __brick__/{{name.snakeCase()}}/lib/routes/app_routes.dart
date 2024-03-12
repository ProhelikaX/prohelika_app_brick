import 'package:flutter/material.dart';

import '../screens/person_screen/person_screen.dart';

class AppRoutes {
  static const String initialRoute = '/';

  static const String personScreen = '/person_screen';

  static Map<String, WidgetBuilder> get routes =>
      {initialRoute: PersonScreen.builder, personScreen: PersonScreen.builder};
}
