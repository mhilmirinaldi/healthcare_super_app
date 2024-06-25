import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_app_telemedicine/firebase_options.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  initializeDateFormatting('id', null);

  runApp(const ProviderScope(
    child: MainApp(),
  ));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
              seedColor: primaryColor,
              background: backgroundColor,
              brightness: Brightness.light),
          useMaterial3: true,
          textTheme: TextTheme(
            bodyMedium: GoogleFonts.nunito(color: Colors.black),
            bodyLarge: GoogleFonts.nunito(color: Colors.black),
            labelLarge: GoogleFonts.nunito(color: Colors.black),
          )),
      debugShowCheckedModeBanner: false,
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routeInformationProvider:
          ref.watch(routerProvider).routeInformationProvider,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
    );
  }
}
