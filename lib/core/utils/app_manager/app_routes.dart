import 'package:UQPay/feature/admin/presentation/view/admin_home_view.dart';
import 'package:UQPay/feature/admin/presentation/view/widgets/admin_deposit_machine_view.dart';
import 'package:UQPay/feature/admin/presentation/view/widgets/admin_recharge_card_view.dart';
import 'package:UQPay/feature/admin/presentation/view/widgets/manage_company_view.dart';
import 'package:UQPay/feature/company/presentation/view/company_home_view.dart';
import 'package:go_router/go_router.dart';
import '../../../feature/home/presentation/view/home_view.dart';
import '../../../feature/login/presentation/view/login_view.dart';
import '../../../feature/splash/presentation/view/splash_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String mainRoute = "/main";
  static const String adminHomeRoute = "/adminHome";
  static const String adminDepositRoute = "/adminDeposite";
  static const String adminRechargeRoute = "/adminRecharge";
  static const String adminManageCompanyRoute = "/adminCompany";
  static const String adminSettingsRoute = "/adminSettings";
  static const String companyRoute = "/company";
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
       GoRoute(
        path: Routes.adminDepositRoute,
        builder: (context, state) {
          return const AdminDepositMachineView();
        },
      ),
       GoRoute(
        path: Routes.adminManageCompanyRoute,
        builder: (context, state) {
          return const ManageCompanyView();
        },
      ),
       GoRoute(
        path: Routes.adminRechargeRoute,
        builder: (context, state) {
          return const AdminRechargeCardView();
        },
      ),
       GoRoute(
        path: Routes.companyRoute,
        builder: (context, state) {
          return const CompanyHomeView();
        },
      ),
    ],
  );
}
