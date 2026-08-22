import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/document_parser/presentation/import_po_screen.dart';
import '../../features/fulfillment/presentation/fulfillment_screen.dart';
import '../../features/fulfillment/presentation/po_fulfillment_workbench_screen.dart';
import '../../features/fulfillment/presentation/po_item_checker_screen.dart';
import '../../features/invoice/presentation/invoice_preview_share_screen.dart';
import '../../features/purchase_orders/presentation/purchase_orders_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/pos',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/pos',
              name: 'pos',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: PurchaseOrdersScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/import',
              name: 'import',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ImportPoScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/fulfillment',
              name: 'fulfillment',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: FulfillmentScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              name: 'settings',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SettingsScreen(),
              ),
            ),
          ],
        ),
      ],
    ),
    // Detailed Fullscreen Routes
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/workbench/:poId',
      name: 'workbench',
      builder: (context, state) {
        final poId = state.pathParameters['poId']!;
        return PoFulfillmentWorkbenchScreen(poId: poId);
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/checker/:poId/:batchId',
      name: 'checker',
      builder: (context, state) {
        final poId = state.pathParameters['poId']!;
        final batchId = state.pathParameters['batchId']!;
        return PoItemCheckerScreen(poId: poId, batchId: batchId);
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/invoice/:poId/:batchId',
      name: 'invoice',
      builder: (context, state) {
        final poId = state.pathParameters['poId']!;
        final batchId = state.pathParameters['batchId']!;
        return InvoicePreviewShareScreen(poId: poId, batchId: batchId);
      },
    ),
  ],
);

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long),
            label: 'PO',
          ),
          NavigationDestination(
            icon: Icon(Icons.file_upload_outlined),
            selectedIcon: Icon(Icons.file_upload),
            label: 'Impor',
          ),
          NavigationDestination(
            icon: Icon(Icons.local_shipping_outlined),
            selectedIcon: Icon(Icons.local_shipping),
            label: 'Pengiriman',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }
}
