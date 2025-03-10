import 'package:go_router/go_router.dart';
import 'package:inv_araujo_mobile/core/helpers/toast.dart';
import 'package:inv_araujo_mobile/core/layout/main.dart';
import 'package:inv_araujo_mobile/core/providers/auth.dart';
import 'package:inv_araujo_mobile/screens/deliveries.dart';
import 'package:inv_araujo_mobile/screens/home.dart';
import 'package:inv_araujo_mobile/screens/loader.dart';
import 'package:inv_araujo_mobile/screens/login.dart';
import 'package:inv_araujo_mobile/screens/options.dart';
import 'package:inv_araujo_mobile/screens/products.dart';
import 'package:inv_araujo_mobile/screens/recovery_password.dart';
import 'package:inv_araujo_mobile/screens/transfer.dart';
import 'package:provider/provider.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/loader",
  redirect: (context, state) {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final loggedIn = auth.isLoggedIn;
    final currentUser = auth.currentUser;
    final isInHome = state.fullPath == "/home";
    final isInLogin = state.fullPath == "/login";

    if (!loggedIn && isInHome) return "/login";
    
    if (loggedIn) {
      if (currentUser?.role == "CLIENTE") {
        showToast(context, "Acceso denegado", isError: true);
        return "/login";
      }
      if (isInLogin) return "/home";
    }

    return null;
  },
  routes: [
    GoRoute(path: "/loader", builder: (_, __) => LoaderScreen()),
    GoRoute(path: "/login", builder: (_, __) => LoginScreen()),
    GoRoute(path: "/recovery", builder: (_, __) => RecoveryPasswordScreen()),
    GoRoute(path: "/home", builder: (_, __) => MainLayout(child: HomeScreen())),
    GoRoute(path: "/deliveries", builder: (_, __) => MainLayout(child: DeliveriesScreen())),
    GoRoute(path: "/products", builder: (_, __) => MainLayout(child: ProductsScreen())),
    GoRoute(path: "/more_options", builder: (_, __) => MainLayout(child: OptionsScreen())),
    GoRoute(path: "/transfer", builder: (_, __) => MainLayout(child: TransferScreen())),
  ],
);
