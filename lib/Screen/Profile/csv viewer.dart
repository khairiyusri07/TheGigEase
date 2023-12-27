import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class CompassApp extends StatefulWidget {
  @override
  _CompassAppState createState() => _CompassAppState();
}

class _CompassAppState extends State<CompassApp> {
  double _heading = 0.0;
  StreamSubscription<MagnetometerEvent>? _magnetometerSubscription;

  @override
  void initState() {
    super.initState();
    _magnetometerSubscription = magnetometerEvents!.listen((MagnetometerEvent event) {
      double x = event.x;
      double y = event.y;
      double heading = math.atan2(y, x) * (180 / math.pi);
      setState(() {
        _heading = heading;
      });
    });
  }

  @override
  void dispose() {
    _magnetometerSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.rotate(
        angle: ((_heading ?? 0) * (math.pi / 180) * -1),
        child: Image.asset('assets/images/compass.png', width: 200, height: 200),
      ),
    );
  }
}
