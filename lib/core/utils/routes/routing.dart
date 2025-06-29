import 'package:go_router/go_router.dart';
import 'package:throtl/features/bike_details/screens/bike_details.dart';
import 'package:throtl/features/dashboard/screens/dashboardScreen.dart';
import 'package:throtl/features/maintenace/maintenance_screen.dart';

class Routing {
  
  final GoRouter router = GoRouter(
    initialLocation: DashboardScreen.routeName,
    routes: [
          GoRoute(path: DashboardScreen.routeName,builder: (context, state) => DashboardScreen(),),
    GoRoute(path: BikeDetailsScreen.routeName,builder: (context, state) => BikeDetailsScreen(),),
    GoRoute(path: MaintenanceScreen.routeName,builder: (context, state) => MaintenanceScreen(),)
  ]);
}