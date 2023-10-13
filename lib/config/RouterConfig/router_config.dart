import 'package:go_router/go_router.dart';
import '../../presentation/screens/onboardingScreen/onboarding_screen.dart';
import 'route_transition.dart';

class RouteConfig {
  get getRouter => GoRouter(routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => FadeTransitionPage(
            key: state.pageKey,
            child: const OnboardingScreen(),
          ),
        )
      ]);
}
