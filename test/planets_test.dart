import 'package:flutter_test/flutter_test.dart';
import 'package:space_app/data/planets_data.dart';

void main() {
  test('Nine celestial bodies with complete data', () {
    expect(planets.length, 9);
    for (final p in planets) {
      expect(p.name.isNotEmpty, true, reason: 'name missing');
      expect(p.tagline.contains(': '), true, reason: '${p.name}: tagline format');
      expect(p.about.length > 80, true, reason: '${p.name}: about too short');

      for (final v in [
        p.distanceFromSun, p.lengthOfDay, p.orbitalPeriod,
        p.radius, p.mass, p.gravity, p.surfaceArea,
      ]) {
        expect(v.isNotEmpty, true, reason: '${p.name}: empty stat');
      }
    }
  });

  test('Every body has a painted look', () {
    for (final p in planets) {
      expect(p.look.gradient.length >= 3, true,
          reason: '${p.name}: gradient needs 3 colors');
    }
  });

  test('Saturn is the only ringed body', () {
    final ringed = planets.where((p) => p.look.ring).map((p) => p.name);
    expect(ringed, ['Saturn']);
  });

  test('Unique names', () {
    final names = planets.map((p) => p.name).toSet();
    expect(names.length, planets.length);
  });
}
