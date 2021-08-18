import 'package:example/pages/not_found.dart';

import 'pages/home.dart';
import 'package:modular_navigation/modular_navigation.dart';

import 'pages/sub_pages/sub_module.dart';

class AppModule extends RootModule {
  @override
  ModularRoute get homeRoute => ModularRoute<NoPageParameters, HomePage>(
        //Note because of weakness in Dart's Generics functionality, you MUST define the generic parameters when defining ModularRoute
        route: "/",
        createPage: (_) => HomePage(),
      );

  @override
  ModularRoute get initialRoute =>
      homeRoute; //This can be a splash screen if you have more configuration to complete and then navigate away once you're done as an example.

  @override
  ModularRoute get notFoundRoute =>
      ModularRoute<NoPageParameters, NotFoundPage>(
        route: "/notfound",
        createPage: (_) => NotFoundPage(),
      );

  @override
  Iterable<ModularRoute> get routes => [
        homeRoute,
        initialRoute,
        notFoundRoute,
      ];

  @override
  Iterable<BaseModule> get subModules => [SubPagesModule(route)];
}
