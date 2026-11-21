import '../widgets/planet_sphere.dart';


class Planet {
  final String name;
  final String tagline; 
  final String about;
  final PlanetLook look; 
  final String distanceFromSun;
  final String lengthOfDay;
  final String orbitalPeriod;
  final String radius;
  final String mass;
  final String gravity;
  final String surfaceArea;

  const Planet({
    required this.name,
    required this.tagline,
    required this.about,
    required this.look,
    required this.distanceFromSun,
    required this.lengthOfDay,
    required this.orbitalPeriod,
    required this.radius,
    required this.mass,
    required this.gravity,
    required this.surfaceArea,
  });
}
