import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template_project/pages/first_page_widget.dart';

void main() {
  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}

const _initialPage = '/';
final GoRouter _router = GoRouter(
  // ignore: avoid_redundant_argument_values
  initialLocation: _initialPage,
  routes: [
    GoRoute(
      path: _initialPage,
      name: 'FirsPage',
      builder: (BuildContext context, GoRouterState state) {
        return const FIrstPageWidget();
      },
    )
  ],
);
