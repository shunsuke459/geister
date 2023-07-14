import 'package:flutter/material.dart';
import 'package:geister/page/game/game_page.dart';
import 'package:geister/page/home/sign_up_page.dart';
import 'package:geister/page/search/searching_page.dart';
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

@TypedGoRoute<GamePageRoute>(
  path: '/game',
)
class GamePageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const GamePage();
}

@TypedGoRoute<SearchingPageRoute>(
  path: '/searching',
)
class SearchingPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SearchingPage();
}
