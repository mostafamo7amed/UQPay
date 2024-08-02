import 'package:UQPay/feature/admin/presentation/view/admin_home_screen.dart';
import 'package:UQPay/feature/admin/presentation/view/widgets/admin_add_company_view.dart';
import 'package:UQPay/feature/admin/presentation/view/widgets/admin_change_password.dart';
import 'package:UQPay/feature/admin/presentation/view/widgets/admin_deposit_machine_view.dart';
import 'package:UQPay/feature/admin/presentation/view/widgets/admin_recharge_card_view.dart';
import 'package:UQPay/feature/admin/presentation/view/widgets/admin_manage_company_view.dart';
import 'package:UQPay/feature/admin/presentation/view/widgets/admin_settings_view.dart';
import 'package:UQPay/feature/company/presentation/view/company_home_view.dart';
import 'package:UQPay/feature/profile/presentation/view/widgets/about_us_view.dart';
import 'package:UQPay/feature/profile/presentation/view/widgets/privacy_policy_view.dart';
import 'package:UQPay/feature/profile/presentation/view/widgets/terms_and_conditions_view.dart';
import 'package:go_router/go_router.dart';
import '../../../feature/home/presentation/view/home_view.dart';
import '../../../feature/login/presentation/view/login_view.dart';
import '../../../feature/splash/presentation/view/splash_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String mainRoute = "/main";
  static const String aboutUsRoute = "/aboutUs";
  static const String termConditionsRoute = "/termConditions";
  static const String privecyPolicyRoute = "/privecyPolicy";
  //---------------------
  static const String adminHomeRoute = "/adminHome";
  static const String adminDepositRoute = "/adminDeposite";
  static const String adminRechargeRoute = "/adminRecharge";
  static const String adminManageCompanyRoute = "/adminCompany";
  static const String adminSettingsRoute = "/adminSettings";
  static const String adminChangePassword="/adminChangePassword";
  static const String adminAddCompanyRoute = "/adminAddCompany";
  //----------------------
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
          return const AdminHomeScreen();
        },
      ),
      GoRoute(
        path: Routes.adminDepositRoute,
        builder: (context, state) {
          return const AdminDepositMachineView();
        },
      ),
      GoRoute(
        path: Routes.adminSettingsRoute,
        builder: (context, state) {
          return const AdminSettingsView();
        },
      ),
      GoRoute(
        path: Routes.adminManageCompanyRoute,
        builder: (context, state) {
          return const AdminManageCompanyView();
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
      GoRoute(
        path: Routes.aboutUsRoute,
        builder: (context, state) {
          return const AboutUsView();
        },
      ),
      GoRoute(
        path: Routes.termConditionsRoute,
        builder: (context, state) {
          return const TermsAndConditionsView();
        },
      ),
      GoRoute(
        path: Routes.privecyPolicyRoute,
        builder: (context, state) {
          return const PrivacyPolicyView();
        },
      ),
      GoRoute(
        path: Routes.adminAddCompanyRoute,
        builder: (context, state) {
          return AdminAddCompanyView();
        },
      ),
      GoRoute(
        path: Routes.adminChangePassword,
        builder: (context, state) {
          return const AdminChangePassword();
        },
      ),
    ],
  );
}
