import 'package:go_router/go_router.dart';
import 'package:inv_araujo_mobile/core/layout/main.dart';
import 'package:inv_araujo_mobile/providers/auth.dart';
import 'package:inv_araujo_mobile/screens/deliveries.dart';
import 'package:inv_araujo_mobile/screens/home.dart';
import 'package:inv_araujo_mobile/screens/loader.dart';
import 'package:inv_araujo_mobile/screens/login.dart';
import 'package:inv_araujo_mobile/screens/options.dart';
import 'package:inv_araujo_mobile/screens/products.dart';
import 'package:inv_araujo_mobile/screens/recovery_password.dart';
import 'package:provider/provider.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/loader",
  redirect: (context, state) {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final loggedIn = auth.isLoggedIn;
    final isInHome = state.fullPath == "/home";
    final isInLogin = state.fullPath == "/login";

    if (!loggedIn && isInHome) return "/login";
    if (loggedIn && isInLogin) return "/home";
    return null;
  },
  routes: [
    GoRoute(
      path: "/loader",
      builder: (_, __) => LoaderScreen(),
    ),
    GoRoute(
      path: "/login",
      builder: (_, __) => LoginScreen(),
    ),
    GoRoute(
      path: "/recovery",
      builder: (_, __) => RecoveryPasswordScreen(),
    ),
    GoRoute(
      path: "/home",
      builder: (_, __) => MainLayout(child: HomeScreen()),
    ),
    GoRoute(
      path: "/deliveries",
      builder: (_, __) => MainLayout(child: DeliveriesScreen()),
    ),
    GoRoute(
      path: "/products",
      builder: (_, __) => MainLayout(child: ProductsScreen()),
    ),
    GoRoute(
      path: "/more_options",
      builder: (_, __) => MainLayout(child: OptionsScreen()),
    ),
  ],
);
