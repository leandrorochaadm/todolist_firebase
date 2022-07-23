import 'package:flutter/material.dart';

import 'core/factories/pages/list/list_page_factory.dart';
import 'routes.dart';

class AppModule {
  Map<String, WidgetBuilder> routes() {
    return {
      Routes.Home: (BuildContext context) => makeListPage(),
    };
  }
}
