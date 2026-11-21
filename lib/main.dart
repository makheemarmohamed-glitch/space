import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data/planets_data.dart';
import 'screens/home_screen.dart';
import 'theme.dart';
import 'widgets/planet_sphere.dart';
import 'widgets/primary_button.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const PlanetsExplorerApp());
}

class PlanetsExplorerApp extends StatelessWidget {
  const PlanetsExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space',
      debugShowCheckedModeBanner: false,
      theme: AppText.theme,
      home: const SplashScreen(),
    );
  }
}


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mars = planets.firstWhere((p) => p.name == 'Mars');
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [

          Positioned(
            top: -140,
            left: -60,
            child: PlanetSphere(look: mars.look, size: 480),
          ),

          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.45, 0.72, 1.0],
                  colors: [
                    Colors.transparent,
                    AppColors.background.withOpacity(0.55),
                    AppColors.background,
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 5),
                  Text(
                    'Explore\nThe\nUniverse',
                    style: AppText.theme.textTheme.headlineLarge
                        ?.copyWith(height: 1.12, fontSize: 40),
                  ),
                  const SizedBox(height: 32),
                  PrimaryButton(
                    label: 'Explore',
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
