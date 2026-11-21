import 'package:flutter/material.dart';


class PlanetLook {

  final List<Color> gradient;


  final List<Color>? bands;


  final List<PlanetSpot> spots;


  final bool ring;

  const PlanetLook({
    required this.gradient,
    this.bands,
    this.spots = const [],
    this.ring = false,
  });
}


class PlanetSpot {
  final double dx;
  final double dy;
  final double r;
  final Color color;

  const PlanetSpot(this.dx, this.dy, this.r, this.color);
}



class PlanetSphere extends StatelessWidget {
  final PlanetLook look;
  final double size;

  const PlanetSphere({super.key, required this.look, this.size = 220});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _PlanetSpherePainter(look),
      ),
    );
  }
}

class _PlanetSpherePainter extends CustomPainter {
  final PlanetLook look;

  _PlanetSpherePainter(this.look);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.shortestSide / 2 - (look.ring ? size.shortestSide * 0.06 : 0);
    final sphere = Rect.fromCircle(center: center, radius: radius);


    if (look.ring) _paintRingBack(canvas, center, radius);


    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..shader = RadialGradient(
          center: const Alignment(-0.45, -0.45),
          radius: 1.5,
          colors: [
            look.gradient[0],
            look.gradient[1],
            look.gradient.last,
          ],
          stops: const [0.0, 0.45, 1.0],
        ).createShader(sphere),
    );


    if (look.bands != null) {
      canvas.save();
      canvas.clipPath(Path()..addOval(sphere));
      final n = look.bands!.length;
      final bandH = size.height / (n * 0.9);
      for (var i = 0; i < n; i++) {
        canvas.drawRect(
          Rect.fromLTWH(0, i * bandH + bandH * 0.1, size.width, bandH * 0.8),
          Paint()..color = look.bands![i],
        );
      }
      canvas.restore();
    }


    if (look.spots.isNotEmpty) {
      canvas.save();
      canvas.clipPath(Path()..addOval(sphere));
      for (final s in look.spots) {
        canvas.drawCircle(
          Offset(center.dx + s.dx * radius, center.dy + s.dy * radius),
          s.r * radius,
          Paint()..color = s.color,
        );
      }
      canvas.restore();
    }


    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..shader = RadialGradient(
          center: const Alignment(-0.5, -0.5),
          radius: 1.35,
          colors: const [
            Colors.transparent,
            Colors.transparent,
            Color(0x66000000),
          ],
          stops: const [0.0, 0.55, 1.0],
        ).createShader(sphere),
    );


    canvas.drawCircle(
      Offset(center.dx - radius * 0.38, center.dy - radius * 0.42),
      radius * 0.32,
      Paint()
        ..shader = RadialGradient(
          colors: const [Color(0x59FFFFFF), Colors.transparent],
        ).createShader(Rect.fromCircle(
          center: Offset(center.dx - radius * 0.38, center.dy - radius * 0.42),
          radius: radius * 0.5,
        )),
    );


    if (look.ring) _paintRingFront(canvas, center, radius);
  }

  void _paintRingBack(Canvas canvas, Offset center, double radius) {
    canvas.drawOval(
      Rect.fromCenter(
        center: center,
        width: radius * 2.5,
        height: radius * 0.72,
      ),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = radius * 0.22
        ..color = const Color(0xFFD8C294),
    );
  }

  void _paintRingFront(Canvas canvas, Offset center, double radius) {
    final rect = Rect.fromCenter(
      center: center,
      width: radius * 2.5,
      height: radius * 0.72,
    );

    canvas.drawArc(
      rect,
      0,
      3.14159,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = radius * 0.22
        ..color = const Color(0xFFEAD9AE),
    );
  }

  @override
  bool shouldRepaint(covariant _PlanetSpherePainter old) =>
      old.look != look;
}
