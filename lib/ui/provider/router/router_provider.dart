import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/ui/page/chat_page.dart/detail_dokter_page/detail_dokter_page.dart';
import 'package:super_app_telemedicine/ui/page/login_page/login_page.dart';
import 'package:super_app_telemedicine/ui/page/main_page/main_page.dart';
import 'package:super_app_telemedicine/ui/page/register_page/register_page.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(routes: [
      GoRoute(
        path: '/main',
        name: 'main',
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => const LoginPage()),
      GoRoute(
          path: '/register',
          name: 'register',
          builder: (context, state) => const RegisterPage()),
      GoRoute(
        path: '/detail_dokter',
        name: 'detail_dokter',
        builder: (context, state) => DetailDokterPage(dokter: state.extra as Dokter),
      ),
    ], initialLocation: '/login', debugLogDiagnostics: false);
