import 'package:anora/app/router/router_paths.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      resolver.next();
    } else {
      router.replaceNamed(WELCOME_ROUTE);
    }
  }
}
