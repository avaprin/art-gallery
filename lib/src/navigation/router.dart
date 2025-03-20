import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../presentation/auth/ui/auth_screen.dart';
import '../presentation/details/ui/details_screen.dart';
import '../presentation/favourite/favourite_screen.dart';
import '../presentation/home/home_screen.dart';
import '../presentation/image/ui/image_screen.dart';
import '../presentation/profile/ui/profile_screen.dart';
import '../presentation/search/ui/search_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AdaptiveRoute<void>(
          initial: true,
          path: '/',
          page: AuthRoute.page,
        ),
        AutoRoute(
          path: '/home',
          page: HomeRoute.page,
          children: <AutoRoute>[
            AdaptiveRoute<void>(
              path: 'search',
              page: SearchRoute.page,
            ),
            AdaptiveRoute<void>(
              path: 'favourite',
              page: FavouriteRoute.page,
            ),
            AdaptiveRoute<void>(
              path: 'profile',
              page: ProfileRoute.page,
            ),
          ],
        ),
        AdaptiveRoute<void>(
          path: '/details/:id',
          page: DetailsRoute.page,
        ),
        AdaptiveRoute<void>(
          page: ImageRoute.page,
        ),
      ];
}
