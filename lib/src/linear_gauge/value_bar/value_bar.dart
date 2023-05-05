import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import '../gauge_container.dart/linear_gauge_container.dart';

///
/// The [ValueBar]  can be used to represent the current value of the [LinearGauge].
///
///
///
/// ```dart
/// LinearGauge(
/// valueBar: [
/// ValueBar(
/// value: 50,
/// position: ValueBarPosition.top,
/// color: Colors.amber,
///   ),
///  ]
/// ),
/// ```
///

class ValueBar {
  const ValueBar({
    Key? key,
    required this.value,
    this.offset = 0,
    this.position = ValueBarPosition.center,
    this.color = Colors.blue,
    this.valueBarThickness = 4.0,
    this.edgeStyle = LinearEdgeStyle.bothCurve,
    this.borderRadius = 0,
    this.animationDuration = 1000,
    this.animationType = Curves.ease,
    this.enableAnimation = true,
    this.linearGradient,
  });

  /// The `value` sets the value of the [ValueBar].
  ///
  /// ```dart
  /// const LinearGauge(
  ///   valueBar: [
  ///     ValueBar(
  ///       value: 50,
  ///       position: ValueBarPosition.top,
  ///       ),
  ///     ]
  /// ),
  /// ```
  final double value;

  /// The `valueBarThickness` sets the thickness of the [ValueBar].
  ///
  /// ```dart
  /// const LinearGauge(
  ///   valueBar: [
  ///     ValueBar(
  ///       valueBarThickness: 10,
  ///       ),
  ///     ]
  /// ),
  /// ```
  final double valueBarThickness;

  ///
  /// The `offset` sets the offset of the [ValueBar] from the [LinearGauge].
  ///
  /// ```dart
  /// const LinearGauge(
  ///  valueBar: [
  ///   ValueBar(
  ///     value: 50,
  ///     offset: 50,
  ///     position: ValueBarPosition.top,
  ///      ),
  ///    ]
  /// ),
  /// ```
  /// The default value of `offset` is `0`.
  ///
  final double offset;

  ///
  /// The `position` sets the position of the [ValueBar] in the [LinearGauge].
  /// The [ValueBarPosition] can be `top`, `bottom` or `center`.
  /// The default value of `position` is `ValueBarPosition.center`.
  ///
  /// ```dart
  /// const LinearGauge(
  ///   valueBar: [
  ///     ValueBar(
  ///       value: 50,
  ///       position: ValueBarPosition.top,
  ///      ),
  ///   ],
  /// ),
  /// ```
  ///
  final ValueBarPosition position;

  ///
  /// The `color` sets the color of the [ValueBar].
  /// The default value of `color` is `Colors.blue`.
  ///
  /// ```dart
  /// const LinearGauge(
  ///  valueBar: [
  ///   ValueBar(
  ///     value: 50,
  ///     position: ValueBarPosition.top,
  ///     color: Colors.amber,
  ///         ),
  ///       ],
  ///   ),
  /// ```
  final Color color;

  ///
  /// `borderRadius` Set corners to soft edges/rounded  of the ValueBar
  ///
  /// ```dart
  /// const LinearGauge(
  ///             linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
  ///              linearGradient: LinearGradient(
  ///                colors: [Colors.blue, Colors.pink],
  ///                borderRadius: 10.0,
  ///              ),
  ///            ),
  ///          ),
  /// ```
  final double? borderRadius;

  ///
  /// `edgeStyle` Set the style of the edges of the ValueBar.
  ///
  /// default is to `edgeStyle =`LinearEdgeStyle.bothCurve`
  ///
  ///
  ///  Note : It tells to which edge of the valuebar to apply the supplied
  ///         borderRadius. It has no use if borderRadius is not supplied or is zero.
  ///
  /// ```dart
  /// const LinearGauge(
  ///  valueBar: [
  ///   ValueBar(
  ///     value: 50,
  ///     borderRadius:10,
  ///     edgeStyle:LinearEdgeStyle.bothCurve,
  ///         ),
  ///       ],
  ///   ),
  /// ```
  final LinearEdgeStyle edgeStyle;

  /// Specifies the load time animation duration with [enableAnimation].
  /// Duration is defined in milliseconds.
  ///
  /// Defaults to true.
  ///
  /// ```dart
  ///
  /// LinearGauge (
  ///  valueBar: [
  /// ValueBar(
  /// value: 20,
  /// enableAnimation: true,
  ///  )])
  /// ```
  ///
  final bool enableAnimation;

  /// Specifies the load time animation duration with [enableAnimation].
  /// Duration is defined in milliseconds.
  ///
  /// Defaults to 1000.
  ///
  /// ```dart
  ///
  /// LinearGauge (
  ///  valueBar: [
  /// ValueBar(
  /// value: 20,
  /// enableAnimation: true,
  /// animationDuration: 4000
  ///  )])
  /// ```
  ///
  final int animationDuration;

  /// Specifies the animation type of valuebar.
  ///
  /// Defaults to [Curves.ease].
  ///
  /// ```dart
  ///
  /// LinearGauge (
  ///  valueBar: [
  /// ValueBar(
  /// value: 20,
  /// enableAnimation: true,
  /// animationType: Curves.linear
  ///  )])
  /// ```
  ///
  final Curve animationType;

  ///
  /// `linearGradient` Sets the gradient background of the [LinearGauge] Container
  ///  * NOTE : If `linearGradient` is given in [LinearGaugeBoxDecoration] the `color` property will be ignored
  ///
  /// ```dart
  /// const LinearGauge(
  ///             linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
  ///
  ///              linearGradient: LinearGradient(
  ///                colors: [Colors.blue, Colors.pink],
  ///              ),
  ///            ),
  ///          ),
  /// ```
  final LinearGradient? linearGradient;

  void drawValueBar(Canvas canvas, double start, double end, double totalWidth,
      int index, RenderLinearGaugeContainer linearGaugeContainer) {
    assert(
        value >= linearGaugeContainer.getStart &&
            value <= linearGaugeContainer.getEnd,
        'Value should be between start and end values');

    // Start and End values of the Linear Gauge
    double endValue = linearGaugeContainer.getEnd!;

    double startValue = linearGaugeContainer.getStart;
    GaugeOrientation gaugeOrientation =
        linearGaugeContainer.getGaugeOrientation;

    //  width of the value bar in pixels based on the value
    double valueBarWidth = ((value - startValue) / (endValue - startValue)) *
        (totalWidth - 2 * linearGaugeContainer.getExtendLinearGauge);

    double valueBarAnimationValue =
        linearGaugeContainer.getValueBarAnimation[index].value;

    valueBarWidth = (enableAnimation)
        ? valueBarWidth * valueBarAnimationValue
        : valueBarWidth;

    final ValueBarPosition valueBarPosition = position;
    final Paint linearGaugeContainerPaint = Paint();
    linearGaugeContainerPaint.color = color;

    //For get Offset Height
    double linearGaugeThickness = linearGaugeContainer.getThickness;

    double totalValOffset = _getOffsetHeight(
        valueBarPosition, linearGaugeThickness, offset, linearGaugeContainer);
    bool getInversedRulers = linearGaugeContainer.getInversedRulers;
    // Drawing Value Bar
    final Rect gaugeContainer;

    if (gaugeOrientation == GaugeOrientation.horizontal) {
      double startValue = (!getInversedRulers) ? start : (start + end);

      if (!linearGaugeContainer.fillExtend) {
        startValue = !getInversedRulers
            ? (startValue + linearGaugeContainer.getExtendLinearGauge)
            : (startValue - linearGaugeContainer.getExtendLinearGauge);
      } else {
        if (linearGaugeContainer.getEnd == value) {
          valueBarWidth += 2 * linearGaugeContainer.getExtendLinearGauge;
        } else {
          valueBarWidth += linearGaugeContainer.getExtendLinearGauge;
        }
      }

      var topOffset = totalValOffset;

      if (position == ValueBarPosition.center) {
        topOffset = totalValOffset +
            (linearGaugeThickness - valueBarThickness) / 2 +
            linearGaugeContainer.yAxisForGaugeContainer;
      }

      gaugeContainer = Rect.fromLTWH(
        startValue,
        topOffset,
        !getInversedRulers ? valueBarWidth : -valueBarWidth,
        valueBarThickness,
      );
    } else {
      double barTop = (!getInversedRulers) ? start + end : start;
      double barLeft = _getOffsetHeight(
        position,
        linearGaugeThickness,
        offset,
        linearGaugeContainer,
      ); // adjust left position as needed

      if (!linearGaugeContainer.fillExtend) {
        barTop = !getInversedRulers
            ? (barTop - linearGaugeContainer.getExtendLinearGauge)
            : (barTop + linearGaugeContainer.getExtendLinearGauge);
      } else {
        // barTop = barTop + 2 * linearGaugeContainer.getExtendLinearGauge;

        if (linearGaugeContainer.getEnd == value) {
          valueBarWidth += 2 * linearGaugeContainer.getExtendLinearGauge;
        } else {
          valueBarWidth += linearGaugeContainer.getExtendLinearGauge;
        }
      }

      var startOffset = barLeft;

      if (position == ValueBarPosition.center) {
        startOffset = barLeft +
            (linearGaugeThickness - valueBarThickness) / 2 +
            linearGaugeContainer.xAxisForGaugeContainer;
      }

      gaugeContainer = Rect.fromLTWH(
        startOffset,
        barTop,
        (position == ValueBarPosition.left)
            ? -valueBarThickness
            : valueBarThickness, // set width to half of the gauge width
        !getInversedRulers ? -valueBarWidth : valueBarWidth,
      );
    }

    if (linearGradient != null) {
      linearGaugeContainerPaint.shader =
          linearGradient!.createShader(gaugeContainer);
    }

    if (borderRadius != 0) {
      var rectangularBox = _getRoundedContainer(
        gaugeContainer: gaugeContainer,
        linearGaugeContainer: linearGaugeContainer,
      );
      canvas.drawRRect(rectangularBox, linearGaugeContainerPaint);
    } else {
      canvas.drawRect(gaugeContainer, linearGaugeContainerPaint);
    }
  }

  // Calculating Offset Height for Value Bar
  double _getOffsetHeight(ValueBarPosition position, double height,
      double valueBarOffset, RenderLinearGaugeContainer linearGaugeContainer) {
    switch (position) {
      case ValueBarPosition.center:
        return 0.0;
      case ValueBarPosition.top:
        return (linearGaugeContainer.yAxisForGaugeContainer -
            valueBarThickness -
            offset);
      case ValueBarPosition.bottom:
        return height +
            valueBarOffset +
            linearGaugeContainer.yAxisForGaugeContainer;
      case ValueBarPosition.left:
        return linearGaugeContainer.xAxisForGaugeContainer - valueBarOffset;
      case ValueBarPosition.right:
        return height +
            valueBarOffset +
            linearGaugeContainer.xAxisForGaugeContainer;
      default:
        return 0;
    }
  }

  RRect _getRoundedContainer({
    required Rect gaugeContainer,
    required var linearGaugeContainer,
  }) {
    GaugeOrientation gaugeOrientation =
        linearGaugeContainer.getGaugeOrientation;
    RRect rectangularBox;
    switch (edgeStyle) {
      case LinearEdgeStyle.startCurve:
        gaugeOrientation == GaugeOrientation.horizontal
            ? rectangularBox = RRect.fromRectAndCorners(
                gaugeContainer,
                topLeft: Radius.circular(borderRadius!),
                bottomLeft: (linearGaugeContainer.getGaugeOrientation ==
                        GaugeOrientation.horizontal)
                    ? Radius.circular(borderRadius!)
                    : Radius.zero,
                topRight: (linearGaugeContainer.getGaugeOrientation ==
                        GaugeOrientation.horizontal)
                    ? Radius.zero
                    : Radius.circular(borderRadius!),
              )
            : rectangularBox = RRect.fromRectAndCorners(
                gaugeContainer,
                topRight: (linearGaugeContainer.getGaugeOrientation ==
                        GaugeOrientation.horizontal)
                    ? Radius.circular(borderRadius!)
                    : Radius.zero,
                bottomLeft: (linearGaugeContainer.getGaugeOrientation ==
                        GaugeOrientation.horizontal)
                    ? Radius.zero
                    : Radius.circular(borderRadius!),
                bottomRight: Radius.circular(borderRadius!),
              );
        break;
      case LinearEdgeStyle.endCurve:
        gaugeOrientation == GaugeOrientation.horizontal
            ? rectangularBox = RRect.fromRectAndCorners(
                gaugeContainer,
                topRight: (linearGaugeContainer.getGaugeOrientation ==
                        GaugeOrientation.horizontal)
                    ? Radius.circular(borderRadius!)
                    : Radius.zero,
                bottomLeft: (linearGaugeContainer.getGaugeOrientation ==
                        GaugeOrientation.horizontal)
                    ? Radius.zero
                    : Radius.circular(borderRadius!),
                bottomRight: Radius.circular(borderRadius!),
              )
            : rectangularBox = RRect.fromRectAndCorners(
                gaugeContainer,
                topLeft: Radius.circular(borderRadius!),
                bottomLeft: (linearGaugeContainer.getGaugeOrientation ==
                        GaugeOrientation.horizontal)
                    ? Radius.circular(borderRadius!)
                    : Radius.zero,
                topRight: (linearGaugeContainer.getGaugeOrientation ==
                        GaugeOrientation.horizontal)
                    ? Radius.zero
                    : Radius.circular(borderRadius!),
              );
        break;

      default:
        rectangularBox = RRect.fromRectAndRadius(
          gaugeContainer,
          Radius.circular(borderRadius!),
        );
        break;
    }

    return rectangularBox;
  }
}
