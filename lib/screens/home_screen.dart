import 'package:flutter/material.dart';

import '../data/planets_data.dart';
import '../models/planet.dart';
import '../theme.dart';
import '../widgets/planet_sphere.dart';
import '../widgets/primary_button.dart';
import 'planet_details_screen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 3; 

  Planet get _planet => planets[_index];

  void _goTo(int i) =>
      setState(() => _index = (i + planets.length) % planets.length);

  void _next() => _goTo(_index + 1);

  void _previous() => _goTo(_index - 1);

  void _openDetails() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => PlanetDetailsScreen(planet: _planet)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Home',
                style: TextStyle(
                  fontFamily: AppText.fontFamily,
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 8),

              _PlanetBanner(planet: _planet, onTap: _openDetails),
              const SizedBox(height: 16),
              Text(
                'Which planet\nwould you like to explore?',
                style: AppText.theme.textTheme.headlineMedium
                    ?.copyWith(height: 1.35, fontSize: 22),
              ),

              Expanded(
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(scale: animation, child: child),
                    ),
                    child: FittedBox(
                      key: ValueKey(_planet.name),
                      fit: BoxFit.scaleDown,
                      child: PlanetSphere(look: _planet.look, size: 210),
                    ),
                  ),
                ),
              ),

              Row(
                children: [
                  _RoundIconButton(icon: Icons.arrow_back, onTap: _previous),
                  Expanded(
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: Text(
                          _planet.name,
                          key: ValueKey(_planet.name),
                          style: AppText.theme.textTheme.headlineMedium,
                        ),
                      ),
                    ),
                  ),
                  _RoundIconButton(icon: Icons.arrow_forward, onTap: _next),
                ],
              ),
              const SizedBox(height: 4),

              Center(
                child: Text(
                  '${_index + 1} / ${planets.length}',
                  style: const TextStyle(
                    fontFamily: AppText.fontFamily,
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              SizedBox(
                height: 76,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: planets.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 14),
                  itemBuilder: (context, i) {
                    final selected = i == _index;
                    return _PlanetThumb(
                      planet: planets[i],
                      selected: selected,
                      onTap: () => _goTo(i),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                label: 'Explore ${_planet.name}',
                onPressed: _openDetails,
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}


class _PlanetBanner extends StatelessWidget {
  final Planet planet;
  final VoidCallback onTap;

  const _PlanetBanner({required this.planet, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 96,
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
                top: -150,
                right: -70,
                child: PlanetSphere(look: planet.look, size: 280),
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.background.withOpacity(0.9),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Explore',
                      style: AppText.theme.textTheme.headlineMedium
                          ?.copyWith(fontSize: 22),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      planet.tagline,
                      style: AppText.theme.textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _RoundIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.accent,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 48,
          height: 48,
          child: Icon(icon, color: Colors.white, size: 22),
        ),
      ),
    );
  }
}


class _PlanetThumb extends StatelessWidget {
  final Planet planet;
  final bool selected;
  final VoidCallback onTap;

  const _PlanetThumb({
    required this.planet,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? Colors.white : Colors.transparent,
                width: 2,
              ),
            ),
            child: PlanetSphere(look: planet.look, size: 44),
          ),
          const SizedBox(height: 6),
          Text(
            planet.name,
            style: TextStyle(
              fontFamily: AppText.fontFamily,
              fontSize: 11,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              color: selected ? AppColors.textPrimary : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
