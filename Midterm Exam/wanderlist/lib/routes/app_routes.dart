
import 'package:go_router/go_router.dart';
import 'package:wanderlist/screens/destination_detail_screen.dart';
import 'package:wanderlist/screens/destinations_list_screen.dart';
import 'package:wanderlist/screens/edit_destination_screen.dart';
import 'package:wanderlist/screens/shell_screen.dart';

class AppRouter {
  static const destinationList = (name: 'destinationList', path: '/');
  static const destinationDetail = (name: 'destinationDetail', path: '/destinationDetail/:id');
  static const editDestination = (name: 'editDestination', path: '/editDestination/:id');
  static final router = GoRouter(
    initialLocation: destinationList.path,
    routes: [
      ShellRoute(
        builder: (context, state, child) => ShellScreen(child: child),
        routes: [
          GoRoute(
            name: destinationList.name,
            path: destinationList.path,
            builder: (context, state) => const DestinationsListScreen()
          ),
           GoRoute(
            name: destinationDetail.name,
            path: destinationDetail.path,
            builder: (context, state) {
              final String destinationId = state.pathParameters['id']!;
              return  DestinationDetailScreen(destinationId: destinationId);
            }
          ),
          
           GoRoute(
            name: editDestination.name,
            path: editDestination.path,
            builder: (context, state) {
              final String destinationId = state.pathParameters['id']!;
              return  EditDestinationScreen(destinationId: destinationId);
            }
          ), 

      ])
    ]
  );



}