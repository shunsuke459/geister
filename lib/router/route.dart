import 'package:flutter/material.dart';
import 'package:geister/page/home/sign_up_page.dart';
import 'package:geister/page/splash_page.dart';
import 'package:geister/page/home/home_page.dart';
import 'package:go_router/go_router.dart';

part 'route.g.dart';

@TypedGoRoute<SplashPageRoute>(
  path: '/splash',
)
class SplashPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const SplashPage();
}

@TypedGoRoute<HomePageRoute>(
  path: '/home',
)
class HomePageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

@TypedGoRoute<SignUpPageRoute>(
  path: '/sign_up',
)
class SignUpPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const SignUpPage();
}
