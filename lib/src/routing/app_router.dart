import 'package:go_router/go_router.dart';
import 'package:life_battery/src/features/lifespan/presentation/pages/home_page.dart';
import 'package:life_battery/src/features/lifespan/presentation/pages/lifespan_progress_page.dart';
import 'package:life_battery/src/features/lifespan/presentation/pages/settings_page.dart';
import 'package:life_battery/src/features/lifespan/presentation/pages/user_deleted_page.dart';
import 'package:life_battery/src/routing/app_route.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/lifespan',
        name: AppRoute.lifespan.name,
        builder: (context, state) => LifespanProgressPage(
          isInitialUser: state.uri.queryParameters['isInitialUser'] == 'true',
        ),
        routes: [
          GoRoute(
            path: 'settings',
            name: AppRoute.settings.name,
            builder: (context, state) => const SettingsPage(),
          ),
        ],
      ),
      GoRoute(
        path: '/user-deleted',
        name: AppRoute.userDeleted.name,
        builder: (context, state) => const UserDeletedPage(),
      ),
    ],
  );
}
