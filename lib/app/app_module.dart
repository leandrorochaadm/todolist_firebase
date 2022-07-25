import 'package:flutter/material.dart';

import 'core/factories/factories.dart';
import 'routes.dart';

class AppModule {
  Map<String, WidgetBuilder> routes() {
    return {
      Routes.Home: (BuildContext context) => makeListPage(),
    };
  }
}
