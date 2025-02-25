import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  int getCurrentRoute(BuildContext context) {
    GoRouterState state = GoRouterState.of(context);

    Map<String, int> routes = {
      "/home": 0,
      "/deliveries": 1,
      "/products": 2,
      "/more_options": 3,
    };

    return routes[state.fullPath] ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = getCurrentRoute(context);

    return BottomNavigationBar(
      backgroundColor: AppColors.platinium,
      selectedItemColor: AppColors.gray,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedLabelStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: AppColors.gray,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: AppColors.dim,
      ),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: "Inicio",
          tooltip: "Ir a inicio",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article_rounded),
          label: "Entregas",
          tooltip: "Ir a entregas",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_rounded),
          label: "Productos",
          tooltip: "Ir a productos",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_vert_rounded),
          label: "Más",
          tooltip: "Ir a más opciones",
        ),
      ],
      onTap: (index) {
        Map<int, String> redirections = {
          0: "/home",
          1: "/deliveries",
          2: "/products",
          3: "/more_options",
        };

        context.go(redirections[index] ?? "/home");
      },
    );
  }
}
