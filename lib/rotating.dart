import 'dart:math';

import 'package:aeyrium_sensor/aeyrium_sensor.dart';
import 'package:flutter/widgets.dart';

class Rotating extends StatefulWidget {
  final Widget child;

  const Rotating({this.child});

  @override
  _RotatingState createState() => _RotatingState();
}

class _RotatingState extends State<Rotating> {
  static const _rad90 = 90.0 * pi / 180.0;
  double _angle = 0.0;

  @override
  void initState() {
    AeyriumSensor.sensorEvents.listen((SensorEvent event) {
      final newAngle = (event.roll * 1000).truncate() / 1000.0;
      if ((_angle - newAngle).abs() > 0.01) {
        setState(() {
          _angle = newAngle;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final width = (media.size.width * sin(_rad90 - _angle).abs()) + (media.size.height * sin(_angle).abs());
    final height = (media.size.height * sin(_rad90 - _angle).abs()) + (media.size.width * sin(_angle).abs());
    return Transform.rotate(
      angle: _angle,
      child: OverflowBox(
        minWidth: width,
        maxWidth: width,
        minHeight: height,
        maxHeight: height,
        child: widget.child,
      ),
    );
  }
}
