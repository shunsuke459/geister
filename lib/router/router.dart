import 'package:geister/router/route.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: SplashPageRoute().location,
      routes: $appRoutes,
    );
  },
);
