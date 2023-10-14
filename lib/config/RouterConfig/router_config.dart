import 'package:go_router/go_router.dart';
import 'package:plant_app/config/RouterConfig/route_names.dart';
import 'package:plant_app/plant_data.dart';
import 'package:plant_app/presentation/screens/DetailScreen/detail_screen.dart';
import '../../presentation/screens/OnboardingScreen/onboarding_screen.dart';
import '../../presentation/screens/SearchScreen/search_screen.dart';
import 'route_transition.dart';

class RouteConfig {
  get getRouter => GoRouter(routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => FadeTransitionPage(
            key: state.pageKey,
            child: const OnboardingScreen(),
          ),
        ),
        GoRoute(
          path: RouteNames.searchScreen,
          pageBuilder: (context, state) => FadeTransitionPage(
            key: state.pageKey,
            child: const SearchScreen(),
          ),
        ),
        GoRoute(
          path: RouteNames.detailScreen,
          pageBuilder: (context, state) => FadeTransitionPage(
              key: state.pageKey,
              child: DetailScreen(
                plant: state.extra as PlantModel,
              )),
        )
      ]);
}
