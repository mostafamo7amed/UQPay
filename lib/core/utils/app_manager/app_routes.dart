import 'package:UQPay/feature/admin/presentation/view/admin_home_view.dart';
import 'package:go_router/go_router.dart';

import '../../../feature/home/presentation/view/home_view.dart';
import '../../../feature/login/presentation/view/login_view.dart';
import '../../../feature/splash/presentation/view/splash_view.dart';


class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String mainRoute = "/main";
  static const String adminHomeRoute = "/adminHome";
}

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: Routes.splashRoute,
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: Routes.loginRoute,
        builder: (context, state) {
          return const LoginView();
        },
      ),
       GoRoute(
        path: Routes.mainRoute,
        builder: (context, state) {
          return const HomeView();
        },
      ),
       GoRoute(
        path: Routes.adminHomeRoute,
        builder: (context, state) {
          return const AdminHomeView();
        },
      ),
    ],
  );
}