import 'dart:ui';

import '../models/planet.dart';
import '../widgets/planet_sphere.dart';




const List<Planet> planets = [
  Planet(
    name: 'Moon',
    tagline: 'The Moon: Our Companion',
    about:
        'The Moon is Earth\'s only natural satellite and the fifth largest moon in the '
        'Solar System. Its surface is covered with craters, maria and highlands, and it '
        'stabilizes Earth\'s axial tilt, giving us regular seasons.',
    look: PlanetLook(
      gradient: [Color(0xFFE8E8E8), Color(0xFFB0B0B0), Color(0xFF4A4A4A)],
      spots: [
        PlanetSpot(-0.35, -0.25, 0.16, Color(0x33808080)),
        PlanetSpot(0.25, -0.4, 0.12, Color(0x33808080)),
        PlanetSpot(0.4, 0.15, 0.14, Color(0x33808080)),
        PlanetSpot(-0.15, 0.35, 0.1, Color(0x33808080)),
        PlanetSpot(-0.55, 0.1, 0.08, Color(0x33808080)),
        PlanetSpot(0.05, -0.05, 0.2, Color(0x22707070)),
      ],
    ),
    distanceFromSun: 'Same as Earth',
    lengthOfDay: '708.7 hours',
    orbitalPeriod: '27.3 days',
    radius: '1,737.4 KM',
    mass: '7.342 × 10²² KG',
    gravity: '1.62 m/s²',
    surfaceArea: '3.79 × 10⁷ KM²',
  ),
  Planet(
    name: 'Mercury',
    tagline: 'Mercury: The Swift Planet',
    about:
        'Mercury is the smallest planet in the Solar System and the closest to the Sun. '
        'Its surface is covered with craters, similar to the Moon, and it experiences the '
        'most extreme temperature variations of any planet, ranging from scorching days '
        'to freezing nights due to its lack of a substantial atmosphere.',
    look: PlanetLook(
      gradient: [Color(0xFFC9BFAE), Color(0xFF9C9083), Color(0xFF3E372F)],
      spots: [
        PlanetSpot(-0.3, -0.3, 0.14, Color(0x33736959)),
        PlanetSpot(0.3, 0.1, 0.18, Color(0x33736959)),
        PlanetSpot(-0.1, 0.45, 0.1, Color(0x33736959)),
        PlanetSpot(0.5, -0.35, 0.08, Color(0x33736959)),
      ],
    ),
    distanceFromSun: '57,900,000 KM',
    lengthOfDay: '4,222.6 hours',
    orbitalPeriod: '88.0 days',
    radius: '2,439.7 KM',
    mass: '3.301 × 10²³ KG',
    gravity: '3.7 m/s²',
    surfaceArea: '7.48 × 10⁷ KM²',
  ),
  Planet(
    name: 'Venus',
    tagline: 'Venus: The Morning Star',
    about:
        'Venus is the second planet from the Sun and the hottest in the Solar System. '
        'Its dense atmosphere of carbon dioxide creates a runaway greenhouse effect, '
        'and it rotates in the opposite direction to most planets, making the Sun rise '
        'in the west and set in the east.',
    look: PlanetLook(
      gradient: [Color(0xFFFFE9C4), Color(0xFFE8C08A), Color(0xFF7A5A2E)],
      bands: [
        Color(0x22FFFFFF),
        Color(0x00FFFFFF),
        Color(0x33FFFFFF),
        Color(0x00FFFFFF),
        Color(0x22FFFFFF),
      ],
    ),
    distanceFromSun: '108,200,000 KM',
    lengthOfDay: '2,802 hours',
    orbitalPeriod: '224.7 days',
    radius: '6,051.8 KM',
    mass: '4.867 × 10²⁴ KG',
    gravity: '8.87 m/s²',
    surfaceArea: '4.60 × 10⁸ KM²',
  ),
  Planet(
    name: 'Earth',
    tagline: 'Earth: The Blue Marble',
    about:
        'Earth is the only known planet in the universe that supports life, thanks to its unique '
        'combination of factors, including liquid water, a stable atmosphere, and a magnetic field '
        'that shields us from harmful solar radiation. The ideal conditions for the development of '
        'complex organisms, Earth\'s magnetic field and its atmosphere helps to regulate '
        'temperature and weather patterns.',
    look: PlanetLook(
      gradient: [Color(0xFF6FB7F2), Color(0xFF2E6BB0), Color(0xFF0D2C55)],
      spots: [
        PlanetSpot(-0.25, -0.35, 0.24, Color(0xFF4C8C4A)),
        PlanetSpot(0.05, -0.05, 0.18, Color(0xFF5C9C55)),
        PlanetSpot(-0.4, 0.3, 0.16, Color(0xFF4C8C4A)),
        PlanetSpot(0.42, 0.25, 0.15, Color(0xFF5C9C55)),
        PlanetSpot(-0.1, 0.55, 0.1, Color(0xFF4C8C4A)),
        PlanetSpot(0.2, -0.55, 0.1, Color(0x66FFFFFF)),
        PlanetSpot(-0.5, -0.1, 0.08, Color(0x55FFFFFF)),
        PlanetSpot(0.55, -0.2, 0.09, Color(0x55FFFFFF)),
      ],
    ),
    distanceFromSun: '149,600,000 KM',
    lengthOfDay: '23.93 hours',
    orbitalPeriod: '365.25 days',
    radius: '6,371 KM',
    mass: '5.972 × 10²⁴ KG',
    gravity: '9.81 m/s²',
    surfaceArea: '5.10 × 10⁸ KM²',
  ),
  Planet(
    name: 'Mars',
    tagline: 'Mars: The Red Planet',
    about:
        'Mars is the fourth planet from the Sun, known for its reddish appearance caused by '
        'iron oxide on its surface. It hosts the tallest volcano in the Solar System, Olympus Mons, '
        'and is a primary target in the search for ancient life and future human exploration.',
    look: PlanetLook(
      gradient: [Color(0xFFE8825A), Color(0xFFC1440E), Color(0xFF59200A)],
      spots: [
        PlanetSpot(-0.2, -0.3, 0.15, Color(0x338B2E00)),
        PlanetSpot(0.3, 0.2, 0.2, Color(0x338B2E00)),
        PlanetSpot(-0.45, 0.25, 0.12, Color(0x338B2E00)),
        PlanetSpot(0.15, -0.5, 0.1, Color(0x2EE8D5C4)),
        PlanetSpot(0.05, 0.55, 0.08, Color(0x33FFFFFF)),
      ],
    ),
    distanceFromSun: '227,900,000 KM',
    lengthOfDay: '24.6 hours',
    orbitalPeriod: '687.0 days',
    radius: '3,389.5 KM',
    mass: '6.417 × 10²³ KG',
    gravity: '3.71 m/s²',
    surfaceArea: '1.45 × 10⁸ KM²',
  ),
  Planet(
    name: 'Jupiter',
    tagline: 'Jupiter: The Giant',
    about:
        'Jupiter is the largest planet in the Solar System, a gas giant with a mass more than '
        'twice that of all the other planets combined. Its Great Red Spot is a giant storm that '
        'has been raging for centuries, and its strong magnetic field is the largest structure '
        'in the Solar System.',
    look: PlanetLook(
      gradient: [Color(0xFFF0D9B5), Color(0xFFC97B45), Color(0xFF6E3B1E)],
      bands: [
        Color(0x66E8CFA8),
        Color(0x66B5793F),
        Color(0x88E0A06A),
        Color(0x66A86A38),
        Color(0x77D8B078),
        Color(0x55B5793F),
      ],
      spots: [
        PlanetSpot(0.3, 0.35, 0.1, Color(0xCCD25A2E)),
      ],
    ),
    distanceFromSun: '778,500,000 KM',
    lengthOfDay: '9.93 hours',
    orbitalPeriod: '4,333 days',
    radius: '69,911 KM',
    mass: '1.898 × 10²⁷ KG',
    gravity: '24.79 m/s²',
    surfaceArea: '6.14 × 10¹⁰ KM²',
  ),
  Planet(
    name: 'Saturn',
    tagline: 'Saturn: The Ringed Jewel',
    about:
        'Saturn is famous for its spectacular ring system, made mostly of ice and rock. It is the '
        'least dense planet in the Solar System — it would float in water — and it has dozens of '
        'moons, including Titan, which has a thick atmosphere of its own.',
    look: PlanetLook(
      gradient: [Color(0xFFF5E4BF), Color(0xFFDDC08D), Color(0xFF8A6A3C)],
      bands: [
        Color(0x55F0DFB5),
        Color(0x00FFFFFF),
        Color(0x44D8BE8A),
        Color(0x00FFFFFF),
        Color(0x44CDB078),
      ],
      ring: true,
    ),
    distanceFromSun: '1,434,000,000 KM',
    lengthOfDay: '10.7 hours',
    orbitalPeriod: '10,759 days',
    radius: '58,232 KM',
    mass: '5.683 × 10²⁶ KG',
    gravity: '10.44 m/s²',
    surfaceArea: '4.27 × 10¹⁰ KM²',
  ),
  Planet(
    name: 'Uranus',
    tagline: 'Uranus: The Sideways Planet',
    about:
        'Uranus is an ice giant that rotates on its side, with an axial tilt of about 98 degrees, '
        'likely the result of an ancient collision. Its atmosphere of hydrogen and helium gives it '
        'a pale cyan color, and it has faint rings and 27 known moons.',
    look: PlanetLook(
      gradient: [Color(0xFFC9F0F2), Color(0xFF8FD4DC), Color(0xFF3E7A8A)],
      bands: [
        Color(0x22FFFFFF),
        Color(0x00FFFFFF),
        Color(0x22FFFFFF),
      ],
    ),
    distanceFromSun: '2,871,000,000 KM',
    lengthOfDay: '17.2 hours',
    orbitalPeriod: '30,687 days',
    radius: '25,362 KM',
    mass: '8.681 × 10²⁵ KG',
    gravity: '8.87 m/s²',
    surfaceArea: '8.08 × 10⁹ KM²',
  ),
  Planet(
    name: 'Neptune',
    tagline: 'Neptune: The Windy World',
    about:
        'Neptune is the farthest planet from the Sun and the windiest, with supersonic wind speeds '
        'reaching over 2,000 km/h. It is a deep blue ice giant discovered by mathematics before it '
        'was ever observed through a telescope.',
    look: PlanetLook(
      gradient: [Color(0xFF7FA8F0), Color(0xFF3F66C4), Color(0xFF152A6E)],
      bands: [
        Color(0x2288AAFF),
        Color(0x00FFFFFF),
        Color(0x334466CC),
      ],
      spots: [
        PlanetSpot(-0.25, 0.3, 0.13, Color(0x660D1F52)),
      ],
    ),
    distanceFromSun: '4,495,000,000 KM',
    lengthOfDay: '16.1 hours',
    orbitalPeriod: '60,190 days',
    radius: '24,622 KM',
    mass: '1.024 × 10²⁶ KG',
    gravity: '11.15 m/s²',
    surfaceArea: '7.62 × 10⁹ KM²',
  ),
];
