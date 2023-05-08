import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class MyValueBarPosition extends StatefulWidget {
  const MyValueBarPosition({super.key});

  @override
  State<MyValueBarPosition> createState() => _MyValueBarPositionState();
}

class _MyValueBarPositionState extends State<MyValueBarPosition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGauge(
          gaugeOrientation: GaugeOrientation.horizontal,
          enableGaugeAnimation: true,
          linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
            borderRadius: 20,
            thickness: 35,
            backgroundColor: Colors.grey,
          ),
          valueBar: const [ValueBar(value: 50)],
          pointers: [
            Pointer(
              value: 100,
              shape: PointerShape.circle,
              color: Colors.black,
            ),
            Pointer(
              value: 50,
              // height: 200,
              shape: PointerShape.childWidget,
              // child: Container(
              //   height: 300,
              //   width: 20,
              //   color: Colors.red,
              // ),
            )
          ],
          // curves: [CustomCurve(midPoint: 20)],
          rulers: const RulerStyle(
            showPrimaryRulers: false,
            showSecondaryRulers: false,
            showLabel: false,
            // secondaryRulersHeight: 300,
            rulerPosition: RulerPosition.bottom,
            inverseRulers: true,
            textStyle: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
