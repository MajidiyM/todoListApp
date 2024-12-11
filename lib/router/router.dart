import 'package:auto_route/auto_route.dart';
import 'package:todo_list_app/screens/home_screen/home.dart';
import 'package:todo_list_app/screens/settings_screen/settings.dart';
import 'package:todo_list_app/screens/tasks_screen/tasks_screen.dart';

import '../screens/detailed_task_screen/view/detailed_task_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: "/",
          children: [
            AutoRoute(
              page: SettingsRoute.page,
              path: "settings",
            ),
            AutoRoute(
              page: TasksRoute.page,
              path: "tasks",
            ),
          ],
        ),
        AutoRoute(
          page: DetailedTaskRoute.page,
          path: "/detailedTask",
        ),
      ];
}
