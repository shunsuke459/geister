// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashPageRoute,
      $homePageRoute,
      $signUpPageRoute,
      $gamePageRoute,
      $searchingPageRoute,
      $recordPageRoute,
      $rulePageRoute,
      $privacyPolicyPageRoute,
    ];

RouteBase get $splashPageRoute => GoRouteData.$route(
      path: '/splash',
      factory: $SplashPageRouteExtension._fromState,
    );

extension $SplashPageRouteExtension on SplashPageRoute {
  static SplashPageRoute _fromState(GoRouterState state) => SplashPageRoute();

  String get location => GoRouteData.$location(
        '/splash',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homePageRoute => GoRouteData.$route(
      path: '/home',
      factory: $HomePageRouteExtension._fromState,
    );

extension $HomePageRouteExtension on HomePageRoute {
  static HomePageRoute _fromState(GoRouterState state) => HomePageRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $signUpPageRoute => GoRouteData.$route(
      path: '/sign_up',
      factory: $SignUpPageRouteExtension._fromState,
    );

extension $SignUpPageRouteExtension on SignUpPageRoute {
  static SignUpPageRoute _fromState(GoRouterState state) => SignUpPageRoute();

  String get location => GoRouteData.$location(
        '/sign_up',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $gamePageRoute => GoRouteData.$route(
      path: '/game',
      factory: $GamePageRouteExtension._fromState,
    );

extension $GamePageRouteExtension on GamePageRoute {
  static GamePageRoute _fromState(GoRouterState state) => GamePageRoute();

  String get location => GoRouteData.$location(
        '/game',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $searchingPageRoute => GoRouteData.$route(
      path: '/searching/:keyWord',
      factory: $SearchingPageRouteExtension._fromState,
    );

extension $SearchingPageRouteExtension on SearchingPageRoute {
  static SearchingPageRoute _fromState(GoRouterState state) =>
      SearchingPageRoute(
        state.pathParameters['keyWord']!,
      );

  String get location => GoRouteData.$location(
        '/searching/${Uri.encodeComponent(keyWord)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $recordPageRoute => GoRouteData.$route(
      path: '/record',
      factory: $RecordPageRouteExtension._fromState,
    );

extension $RecordPageRouteExtension on RecordPageRoute {
  static RecordPageRoute _fromState(GoRouterState state) =>
      const RecordPageRoute();

  String get location => GoRouteData.$location(
        '/record',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $rulePageRoute => GoRouteData.$route(
      path: '/rule',
      factory: $RulePageRouteExtension._fromState,
    );

extension $RulePageRouteExtension on RulePageRoute {
  static RulePageRoute _fromState(GoRouterState state) => const RulePageRoute();

  String get location => GoRouteData.$location(
        '/rule',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $privacyPolicyPageRoute => GoRouteData.$route(
      path: '/privacy_policy',
      factory: $PrivacyPolicyPageRouteExtension._fromState,
    );

extension $PrivacyPolicyPageRouteExtension on PrivacyPolicyPageRoute {
  static PrivacyPolicyPageRoute _fromState(GoRouterState state) =>
      const PrivacyPolicyPageRoute();

  String get location => GoRouteData.$location(
        '/privacy_policy',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
