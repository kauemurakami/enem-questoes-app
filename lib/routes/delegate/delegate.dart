import './delegate_imports.dart';

class MyGoRouterDelegate {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigatorKey => _rootNavigatorKey;
  GoRouter get router => _router;

  final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.home.rpath,
    routes: <RouteBase>[
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/',
        redirect: (_, state) {
          print(state.fullPath);
          return AppRoutes.home.rpath;
        },
      ),
      GoRoute(
          path: AppRoutes.home.rpath,
          name: AppRoutes.home,
          pageBuilder: (_, state) {
            print(state.fullPath);
            return CustomFadeTransition(
              child: ChangeNotifierProvider<HomeController>(
                create: (context) => HomeController(),
                child: HomePage(),
              ),
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.exam.rpath,
              name: AppRoutes.exam,
              pageBuilder: (_, state) {
                final year = state.extra as String;
                print(state.fullPath);
                return CustomSlideTransition(
                  from: SlideFrom.right,
                  child: ChangeNotifierProvider<ExamController>(
                    create: (context) => ExamController(),
                    child: ExamPage(year: year),
                  ),
                );
              },
            ),
          ]),
    ],
  );
}
