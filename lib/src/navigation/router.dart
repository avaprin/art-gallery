import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../presentation/search/ui/search_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AdaptiveRoute<void>(
          initial: true,
          path: '/',
          page: SearchRoute.page,
        ),
      ];
}
