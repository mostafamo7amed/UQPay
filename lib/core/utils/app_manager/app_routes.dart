import 'package:go_router/go_router.dart';
import 'package:uq_pay/feature/home/presentation/view/home_view.dart';
import 'package:uq_pay/feature/login/presentation/view/login_view.dart';
import 'package:uq_pay/feature/splash/presentation/view/splash_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String mainRoute = "/main";
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
    ],
  );
}