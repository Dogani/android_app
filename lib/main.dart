import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'router/app_router.dart';
import 'services/auth_service.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authService = AuthService();
  await authService.loadSession();

  runApp(
    ChangeNotifierProvider.value(
      value: authService,
      child: ProfileDashboardApp(authService: authService),
    ),
  );
}

class ProfileDashboardApp extends StatefulWidget {
  const ProfileDashboardApp({super.key, required this.authService});

  final AuthService authService;

  @override
  State<ProfileDashboardApp> createState() => _ProfileDashboardAppState();
}

class _ProfileDashboardAppState extends State<ProfileDashboardApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = AppRouter.createRouter(widget.authService);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Profile Dashboard',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: _router,
    );
  }
}
