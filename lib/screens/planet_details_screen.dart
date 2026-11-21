import 'package:flutter/material.dart';

import '../data/planets_data.dart';
import '../models/planet.dart';
import '../theme.dart';
import '../widgets/planet_sphere.dart';
import '../widgets/primary_button.dart';




class PlanetDetailsScreen extends StatelessWidget {
  final Planet planet;

  const PlanetDetailsScreen({super.key, required this.planet});

  static const List<String> _labels = [
    'Distance from Sun (km)',
    'Length of Day (hours)',
    'Orbital Period (Earth years)',
    'Radius (km)',
    'Mass (kg)',
    'Gravity (m/s²)',
    'Surface Area (km²)',
  ];

  List<String> get _values => [
        planet.distanceFromSun,
        planet.lengthOfDay,
        planet.orbitalPeriod,
        planet.radius,
        planet.mass,
        planet.gravity,
        planet.surfaceArea,
      ];

  void _openNext(BuildContext context) {
    final i = planets.indexOf(planet);
    final next = planets[(i + 1) % planets.length];
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => PlanetDetailsScreen(planet: next)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Material(
                          color: AppColors.accent,
                          shape: const CircleBorder(),
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: () => Navigator.of(context).pop(),
                            child: const SizedBox(
                              width: 42,
                              height: 42,
                              child: Icon(Icons.arrow_back_ios_new,
                                  color: Colors.white, size: 18),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              planet.name,
                              style:
                                  AppText.theme.textTheme.headlineMedium,
                            ),
                          ),
                        ),
                        const SizedBox(width: 42),
                      ],
                    ),
                    const SizedBox(height: 20),

                    _TaglineBanner(planet: planet),
                    const SizedBox(height: 20),
                    Center(
                      child: PlanetSphere(look: planet.look, size: 230),
                    ),
                    const SizedBox(height: 24),
                    Text('About',
                        style: AppText.theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(planet.about,
                        style: AppText.theme.textTheme.bodyMedium),
                    const SizedBox(height: 20),
                    Text('Planet Info',
                        style: AppText.theme.textTheme.titleMedium),
                    const SizedBox(height: 10),

                    ...List.generate(_labels.length, (i) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 12),
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Colors.white.withOpacity(0.05)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                _labels[i],
                                style: AppText.theme.textTheme.bodySmall,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Flexible(
                              child: Text(
                                _values[i],
                                textAlign: TextAlign.end,
                                style: AppText.theme.textTheme.bodyMedium
                                    ?.copyWith(
                                        color: AppColors.textPrimary,
                                        fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
              child: PrimaryButton(
                label: _nextLabel,
                onPressed: () => _openNext(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get _nextLabel {
    final i = planets.indexOf(planet);
    return 'Next: ${planets[(i + 1) % planets.length].name}';
  }
}


class _TaglineBanner extends StatelessWidget {
  final Planet planet;

  const _TaglineBanner({required this.planet});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Positioned(
              top: -170,
              right: -80,
              child: PlanetSphere(look: planet.look, size: 300),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      AppColors.background.withOpacity(0.85),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  planet.tagline,
                  style: AppText.theme.textTheme.titleMedium
                      ?.copyWith(fontSize: 20),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
