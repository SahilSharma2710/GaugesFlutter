import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:geekyants_flutter_gauges/linear_gauge/linear_gauge_label.dart';

class RenderLinearGauge extends RenderBox {
  RenderLinearGauge({
    required LinearGaugeIndicator indicator,
    required double start,
    required double end,
    required double steps,
    required bool showLinearGaugeContainer,
    required GaugeOrientation gaugeOrientation,
    required TextStyle textStyle,
    required double primaryRulersWidth,
    required double primaryRulersHeight,
    required double secondaryRulersHeight,
    required double secondaryRulersWidth,
    required double labelTopMargin,
    required Color primaryRulerColor,
    required Color secondaryRulerColor,
    required LinearGaugeBoxDecoration linearGaugeBoxDecoration,
    required double secondaryRulerPerInterval,
    required Color linearGaugeContainerBgColor,
    required Color linearGaugeContainerValueColor,
    required bool showLabel,
    required RulerPosition rulerPosition,
    required double labelOffset,
    required bool showSecondaryRulers,
    required bool showPrimaryRulers,
    required double value,
    required List<RangeLinearGauge> rangeLinearGauge,
  })  : assert(start < end, "Start should be grater then end"),
        _start = start,
        _end = end,
        _steps = steps,
        _showLinearGaugeContainer = showLinearGaugeContainer,
        _gaugeOrientation = gaugeOrientation,
        _textStyle = textStyle,
        _primaryRulerColor = primaryRulerColor,
        _primaryRulersWidth = primaryRulersWidth,
        _primaryRulersHeight = primaryRulersHeight,
        _secondaryRulerColor = secondaryRulerColor,
        _secondaryRulersHeight = secondaryRulersHeight,
        _secondaryRulersWidth = secondaryRulersWidth,
        _labelTopMargin = labelTopMargin,
        _linearGaugeBoxDecoration = linearGaugeBoxDecoration,
        _secondaryRulerPerInterval = secondaryRulerPerInterval,
        _linearGaugeContainerBgColor = linearGaugeBoxDecoration.backgroundColor,
        _linearGaugeContainerValueColor = linearGaugeContainerValueColor,
        _showLabel = showLabel,
        _rulerPosition = rulerPosition,
        _labelOffset = labelOffset,
        _showSecondaryRulers = showSecondaryRulers,
        _showPrimaryRulers = showPrimaryRulers,
        _value = value,
        _indicator = indicator,
        _rangeLinearGauge = rangeLinearGauge;

  ///
  double _valueInPixel = 0;

  ///

  ///
  /// Getter and Setter for the [_start] parameter.
  ///
  double get getStart => _start;
  double _start;
  set setStart(double start) {
    if (_start == start) return;
    _start = start;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_end] parameter.
  ///
  get getEnd => _end;
  double _end;
  set setEnd(end) {
    if (_end == end) return;
    _end = end;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_steps] parameter.
  ///
  get getSteps => _steps;
  double _steps;
  set setSteps(steps) {
    if (_steps == steps) return;

    _steps = steps;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_showLinearGaugeContainer] parameter.
  ///
  get getShowLinearGaugeContainer => _showLinearGaugeContainer;
  bool _showLinearGaugeContainer;
  set setShowLinearGaugeContainer(showLinearGaugeContainer) {
    if (_showLinearGaugeContainer == showLinearGaugeContainer) return;

    _showLinearGaugeContainer = showLinearGaugeContainer;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [gaugeOrientation] parameter.
  ///
  get getGaugeOrientation => _gaugeOrientation;
  GaugeOrientation _gaugeOrientation;

  set setGaugeOrientation(gaugeOrientation) {
    if (_gaugeOrientation == gaugeOrientation) return;

    _gaugeOrientation = gaugeOrientation;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [textStyle] parameter.
  ///
  get getTextStyle => _textStyle;
  TextStyle _textStyle;
  set setTextStyle(textStyle) {
    if (_textStyle == textStyle) return;

    _textStyle = textStyle;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [primaryRulersWidth] parameter.
  ///
  get getPrimaryRulersWidth => _primaryRulersWidth;
  double _primaryRulersWidth;
  set setPrimaryRulersWidth(primaryRulersWidth) {
    if (_primaryRulersWidth == primaryRulersWidth) return;

    _primaryRulersWidth = primaryRulersWidth;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [primaryRulersHeight] parameter.
  ///
  get getPrimaryRulersHeight => _primaryRulersHeight;

  double _primaryRulersHeight;

  set setPrimaryRulersHeight(primaryRulersHeight) {
    if (_primaryRulersHeight == primaryRulersHeight) return;

    _primaryRulersHeight = primaryRulersHeight;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [secondaryRulersHeight] parameter.
  ///
  get getSecondaryRulersHeight => _secondaryRulersHeight;

  double _secondaryRulersHeight;

  set setSecondaryRulersHeight(secondaryRulersHeight) {
    if (_secondaryRulersHeight == secondaryRulersHeight) return;

    _secondaryRulersHeight = secondaryRulersHeight;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [secondaryRulersWidth] parameter.
  ///

  get getSecondaryRulersWidth => _secondaryRulersWidth;
  double _secondaryRulersWidth;
  set setSecondaryRulersWidth(secondaryRulersWidth) {
    if (_secondaryRulersWidth == secondaryRulersWidth) return;

    _secondaryRulersWidth = secondaryRulersWidth;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [LinearGaugeIndicator] parameter.
  ///
  LinearGaugeIndicator get getLinearGaugeIndicator => _indicator;
  LinearGaugeIndicator _indicator;

  set setLinearGaugeIndicator(linearGaugeIndicator) {
    _indicator = linearGaugeIndicator;

    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [labelTopMargin] parameter.
  ///
  get getLabelTopMargin => _labelTopMargin;
  double _labelTopMargin;

  set setLabelTopMargin(labelTopMargin) {
    if (_labelTopMargin == labelTopMargin) return;

    _labelTopMargin = labelTopMargin;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [primaryRulerColor] parameter.
  ///
  Color get getPrimaryRulerColor => _primaryRulerColor;
  Color _primaryRulerColor;

  set setPrimaryRulerColor(primaryRulerColor) {
    if (_primaryRulerColor == primaryRulerColor) return;
    _primaryRulerColor = primaryRulerColor;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [secondaryRulerColor] parameter.
  ///
  Color get getSecondaryRulerColor => _secondaryRulerColor;
  Color _secondaryRulerColor;

  set setSecondaryRulerColor(secondaryRulerColor) {
    if (_secondaryRulerColor == secondaryRulerColor) return;
    _secondaryRulerColor = secondaryRulerColor;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [linearGaugeBoxDecoration] parameter.
  ///
  LinearGaugeBoxDecoration get getLinearGaugeBoxDecoration =>
      _linearGaugeBoxDecoration;

  LinearGaugeBoxDecoration _linearGaugeBoxDecoration;
  set setLinearGaugeBoxDecoration(linearGaugeBoxDecoration) {
    if (_linearGaugeBoxDecoration == linearGaugeBoxDecoration) return;
    _linearGaugeBoxDecoration = linearGaugeBoxDecoration;
    markNeedsPaint();
  }

  ///
  ///
  ///
  double get getSecondaryRulerPerInterval => _secondaryRulerPerInterval;
  double _secondaryRulerPerInterval;

  set setSecondaryRulerPerInterval(secondaryRulerPerInterval) {
    if (_secondaryRulerPerInterval == secondaryRulerPerInterval) {
      return;
    }
    _secondaryRulerPerInterval = secondaryRulerPerInterval;
    markNeedsPaint();
  }

  ///
  ///
  ///
  Color get getLinearGaugeContainerBgColor => _linearGaugeContainerBgColor;
  Color _linearGaugeContainerBgColor;
  set setLinearGaugeContainerBgColor(Color linearGaugeContainerBgColor) {
    if (_linearGaugeContainerBgColor == linearGaugeContainerBgColor) {
      return;
    }
    _linearGaugeContainerBgColor = linearGaugeContainerBgColor;
    markNeedsPaint();
  }

  Color get getLinearGaugeContainerValueColor =>
      _linearGaugeContainerValueColor;
  Color _linearGaugeContainerValueColor;
  set setLinearGaugeContainerValueColor(Color linearGaugeContainerValueColor) {
    if (_linearGaugeContainerValueColor == linearGaugeContainerValueColor) {
      return;
    }
    _linearGaugeContainerValueColor = linearGaugeContainerValueColor;
    markNeedsPaint();
  }

  double get getValue => _value;
  double _value;
  set setValue(double val) {
    if (_value == val) {
      return;
    }
    _value = val;
    markNeedsPaint();
  }

  bool get showLabel => _showLabel;
  bool _showLabel;
  set setShowLabel(bool val) {
    if (_showLabel == val) return;
    _showLabel = val;
    markNeedsPaint();
  }

  RulerPosition get rulerPosition => _rulerPosition;
  RulerPosition _rulerPosition;
  set setRulerPosition(RulerPosition val) {
    if (_rulerPosition == val) return;
    _rulerPosition = val;
    markNeedsPaint();
  }

  double get getLabelOffset => _labelOffset;
  double _labelOffset;
  set setLabelOffset(double val) {
    if (_labelOffset == val) return;
    _labelOffset = val;
    markNeedsPaint();
  }

  bool get showSecondaryRulers => _showSecondaryRulers;
  bool _showSecondaryRulers;
  set setShowSecondaryRulers(bool val) {
    if (_showSecondaryRulers == val) return;
    _showSecondaryRulers = val;
    markNeedsPaint();
  }

  bool get showPrimaryRulers => _showPrimaryRulers;
  bool _showPrimaryRulers;
  set setShowPrimaryRulers(bool val) {
    if (_showPrimaryRulers == val) return;
    _showPrimaryRulers = val;
    markNeedsPaint();
  }

  List<RangeLinearGauge>? get rangeLinearGauge => _rangeLinearGauge;
  List<RangeLinearGauge>? _rangeLinearGauge = <RangeLinearGauge>[];
  set setRangeLinearGauge(List<RangeLinearGauge>? val) {
    if (_rangeLinearGauge == val) return;
    _rangeLinearGauge = val;
    markNeedsPaint();
  }

  LinearGaugeLabel get getLinearGaugeLabel {
    return _linearGaugeLabel;
  }

  final Paint _linearGaugeContainerPaint = Paint();
  final Paint _primaryRulersPaint = Paint();
  final Paint _secondaryRulersPaint = Paint();
  final Paint _linearGaugeContainerValuePaint = Paint();
  final LinearGaugeLabel _linearGaugeLabel = LinearGaugeLabel();

  late Size _startLabelSize, _endLabelSize;

  void _calculateRulerPoints() {
    double screenSize = 3 * size.width;
    final double count = math.max(screenSize / 100, 1.0);
    double interval = (getEnd - getStart) / (screenSize / 100);
    final List<double> intervalDivisions = <double>[10, 5, 2, 1];
    late double currentInterval;
    num v = math.pow(10, (math.log(interval) / math.log(10)).floor());

    for (final double intervalDivision in intervalDivisions) {
      currentInterval = v * intervalDivision;

      if (count < ((getEnd - getStart) / currentInterval)) {
        break;
      }
      interval = currentInterval;
    }

    _linearGaugeLabel.addLabels(
      distanceValueInRangeOfHundred: getSteps == 0.0 ? interval : getSteps,
      start: getStart,
      end: getEnd,
    );

    _startLabelSize = _linearGaugeLabel.getLabelSize(
        textStyle: getTextStyle, value: getStart);

    _endLabelSize =
        _linearGaugeLabel.getLabelSize(textStyle: getTextStyle, value: getEnd);

    _linearGaugeLabel.generateOffSetsForLabel(
        _startLabelSize,
        _endLabelSize,
        size,
        getEnd,
        getPrimaryRulersHeight,
        getLinearGaugeBoxDecoration.height,
        getLabelTopMargin,
        _indicator);
  }

  void _drawLabels(Canvas canvas, String text, List<Offset> list) {
    final ui.ParagraphStyle paragraphStyle = ui.ParagraphStyle(
      textDirection: TextDirection.ltr,
    );
    final String labelText = text;
    final double? value = double.tryParse(text);

    final ui.TextStyle labelTextStyle = ui.TextStyle(
      color: getTextStyle.color,
      fontSize: getTextStyle.fontSize,
      background: getTextStyle.background,
      decoration: getTextStyle.decoration,
      decorationColor: getTextStyle.decorationColor,
      decorationStyle: getTextStyle.decorationStyle,
      decorationThickness: getTextStyle.decorationThickness,
      fontFamily: getTextStyle.fontFamily,
      fontFamilyFallback: getTextStyle.fontFamilyFallback,
      fontFeatures: getTextStyle.fontFeatures,
      fontStyle: getTextStyle.fontStyle,
      fontVariations: getTextStyle.fontVariations,
      fontWeight: getTextStyle.fontWeight,
      foreground: getTextStyle.foreground,
      height: getTextStyle.height,
      leadingDistribution: getTextStyle.leadingDistribution,
      letterSpacing: getTextStyle.letterSpacing,
      locale: getTextStyle.locale,
      shadows: getTextStyle.shadows,
      textBaseline: getTextStyle.textBaseline,
      wordSpacing: getTextStyle.wordSpacing,
    );

    final ui.ParagraphBuilder paragraphBuilder =
        ui.ParagraphBuilder(paragraphStyle)
          ..pushStyle(labelTextStyle)
          ..addText(labelText);
    final ui.Paragraph paragraph = paragraphBuilder.build();
    final Size labelSize =
        _linearGaugeLabel.getLabelSize(textStyle: getTextStyle, value: value);

    paragraph.layout(ui.ParagraphConstraints(width: labelSize.width));

    // offset for drawing the label on the canvas
    Offset labelPosition;

    switch (rulerPosition) {
      case RulerPosition.top:
        labelPosition = Offset(
          (list[0].dx - (labelSize.width / 2)),
          -(getPrimaryRulersHeight + getLabelOffset + labelSize.height - 2),
        );
        break;
      default:
        double labelOffset =
            (getLabelTopMargin == 0.0) ? getLabelOffset : getLabelTopMargin;
        labelPosition = Offset(
          (list[0].dx - (labelSize.width / 2)),
          (list[0].dy + getPrimaryRulersHeight + labelOffset),
        );
        break;
    }

    canvas.drawParagraph(
      paragraph,
      labelPosition,
    );
  }

  void _paintGaugeContainer(Canvas canvas, Size size) {
    Offset offset = const Offset(0, 0);
    late double end;
    late double start;

    if (showLabel) {
      end = size.width -
          ((_endLabelSize.width / 2) +
              (_startLabelSize.width / 2) +
              (_indicator.width!));

      start =
          (offset.dx + (_startLabelSize.width / 2) + (_indicator.width! / 2));
    } else {
      end = size.width;
      start = offset.dx;
    }

    late Rect gaugeContainer;
    if (getGaugeOrientation == GaugeOrientation.horizontal) {
      gaugeContainer = Rect.fromLTWH(
          start, offset.dy, end, getLinearGaugeBoxDecoration.height);
    }

    // get 50 % of total width;
    double removeStartPercentage = (getStart * 100) / getEnd;

    double totalWidth = end;
    double percentageInVal = (getValue * 100) / (getEnd);

//todo : create a function for thisx
    // double calculateValuePixelWidth(double value) {
    //   double percentInVal = (value * 100) / (getEnd);
    //   double totalValOnPixel = ((value * percentInVal) / 100) -
    //       ((value * removeStartPercentage) / 100);
    //   return totalValOnPixel;
    // }

    double totalValOnPixel = ((totalWidth * percentageInVal) / 100) -
        ((totalWidth * removeStartPercentage) / 100);

    // if pointer value is null then draw the value in the gauge container
    if (_indicator.getPointerValue == null) {
      _valueInPixel = totalValOnPixel;
    } else {
      double percentageInValPointer =
          (_indicator.getPointerValue * 100) / (getEnd);
      double totalValOnPixelPointer =
          ((totalWidth * percentageInValPointer) / 100) -
              ((totalWidth * removeStartPercentage) / 100);
      _valueInPixel = totalValOnPixelPointer;
    }

    if (getLinearGaugeBoxDecoration.borderRadius != null) {
      canvas.drawRRect(
          RRect.fromRectAndRadius(
            gaugeContainer,
            Radius.circular(getLinearGaugeBoxDecoration.borderRadius!),
          ),
          _linearGaugeContainerPaint);

      _linearGaugeContainerValuePaint.color = getLinearGaugeContainerValueColor;
      gaugeContainer = Rect.fromLTWH(start, offset.dy, totalValOnPixel,
          getLinearGaugeBoxDecoration.height);
      if (getLinearGaugeBoxDecoration.linearGradient != null) {
        _linearGaugeContainerValuePaint.shader = getLinearGaugeBoxDecoration
            .linearGradient!
            .createShader(gaugeContainer);
      }
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          gaugeContainer,
          Radius.circular(getLinearGaugeBoxDecoration.borderRadius!),
        ),
        _linearGaugeContainerValuePaint,
      );
    } else {
      canvas.drawRect(gaugeContainer, _linearGaugeContainerPaint);

      //Todo: Need to change the Color values HERE!!

      _linearGaugeContainerValuePaint.color = getLinearGaugeContainerValueColor;
      gaugeContainer = Rect.fromLTWH(start, offset.dy, totalValOnPixel,
          getLinearGaugeBoxDecoration.height);
      if (getLinearGaugeBoxDecoration.linearGradient != null) {
        _linearGaugeContainerValuePaint.shader = getLinearGaugeBoxDecoration
            .linearGradient!
            .createShader(gaugeContainer);
      }

      ///* Normal DrawRect
      // canvas.drawRect(
      //   gaugeContainer,
      //   _linearGaugeContainerValuePaint,
      // );

      /// For loop for calculating colors in [Linear-Gauge-Color]
      for (int i = 0; i < rangeLinearGauge!.length; i++) {
        // Method to cal exact width
        double calculateValuePixelWidth(double value) {
          return (totalWidth * (value / getEnd)) -
              ((totalWidth * removeStartPercentage) / 100);
        }

        // Start of the ColorRange
        double colorRangeStart =
            calculateValuePixelWidth(rangeLinearGauge![i].start) + start;

        // width of the colorRange
        double colorRangeWidth =
            calculateValuePixelWidth(rangeLinearGauge![i].end) -
                calculateValuePixelWidth(rangeLinearGauge![i].start);

        _linearGaugeContainerValuePaint.color = rangeLinearGauge![i].color;
        gaugeContainer = Rect.fromLTWH(colorRangeStart, offset.dy,
            colorRangeWidth, getLinearGaugeBoxDecoration.height);
        _linearGaugeContainerValuePaint.color = rangeLinearGauge![i].color;
        canvas.drawRect(
          gaugeContainer,
          _linearGaugeContainerValuePaint,
        );
        // x += width;
      }
    }
  }

  void _drawPrimaryRulers(Canvas canvas) {
    _setPrimaryRulersPaint();

    _linearGaugeLabel.getPrimaryRulersOffset.forEach((key, value) {
      double y;
      double x;
      Offset primaryRulerStartPoint;
      Color primaryRulerColor = getPrimaryRulerColor;

      for (int i = 0; i < rangeLinearGauge!.length; i++) {
        var range = rangeLinearGauge![i].end;

        var offset = double.parse(key);
        if (offset >= rangeLinearGauge![i].start && offset <= range) {
          primaryRulerColor = rangeLinearGauge![i].color;
          break;
        }
      }

      switch (rulerPosition) {
        case RulerPosition.top:
          //y co-ordinate will be simply inverted on negative side by adding -ve sign
          //no need to adjust y co-ordinate by adding the height of gauge container
          y = -value[1].dy;
          x = value[1].dx;
          primaryRulerStartPoint = value[0];
          break;
        case RulerPosition.center:
          //the y co-ordinate of the ending point is halved from it's original position

          y = (value[1].dy + getLinearGaugeBoxDecoration.height) / 2;
          x = value[1].dx;
          //the staring point is shifted half of the primary ruler height from the
          //center of the gauge container
          primaryRulerStartPoint =
              Offset(value[0].dx, value[0].dy / 2 - getPrimaryRulersHeight / 2);
          break;
        case RulerPosition.bottom:
          //there is need to adjust y co-ordinate by adding the height of gauge container
          //bcz line will start drawing from behind of gauge container
          y = value[1].dy + getLinearGaugeBoxDecoration.height;
          x = value[1].dx;
          primaryRulerStartPoint = value[0];
          break;
      }

      //the ending point of the primary ruler

      Offset a = Offset(x, y);
      _primaryRulersPaint.color = primaryRulerColor;

      canvas.drawLine(primaryRulerStartPoint, a, _primaryRulersPaint);
      if (showLabel) {
        _drawLabels(canvas, key, value);
      }
    });
  }

  void _drawSecondaryRulers(Canvas canvas) {
    _linearGaugeLabel.generateSecondaryRulers(
        getSecondaryRulerPerInterval,
        canvas,
        _secondaryRulersPaint,
        getSecondaryRulersHeight + getLinearGaugeBoxDecoration.height,
        rulerPosition,
        getLinearGaugeBoxDecoration.height,
        _indicator,
        rangeLinearGauge!);
  }

  void _setPrimaryRulersPaint() {
    _primaryRulersPaint.color = getPrimaryRulerColor;
    _primaryRulersPaint.strokeWidth = getPrimaryRulersWidth;
  }

  void _setSecondaryRulersPaint() {
    _secondaryRulersPaint.color = getSecondaryRulerColor;
    _secondaryRulersPaint.strokeWidth = getSecondaryRulersWidth;
  }

  void _setLinearGaugeContainerPaint() {
    _linearGaugeContainerPaint.color = getLinearGaugeContainerBgColor;
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final desiredWidth = constraints.maxWidth;
    //final desiredHeight = constraints.maxHeight;
    final desiredSize = Size(desiredWidth, 50);
    return constraints.constrain(desiredSize);
  }

  @override
  bool get isRepaintBoundary => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas canvas = context.canvas;

    canvas.save();
    canvas.translate(offset.dx, offset.dy);
    _setLinearGaugeContainerPaint();
    _setSecondaryRulersPaint();

    _calculateRulerPoints();

    if (rulerPosition == RulerPosition.center) {
      if (getShowLinearGaugeContainer) {
        _paintGaugeContainer(canvas, size);
      }
    }

    if (showPrimaryRulers) {
      _drawPrimaryRulers(canvas);
    }

    if (showSecondaryRulers) {
      _drawSecondaryRulers(canvas);
    }

    if (rulerPosition != RulerPosition.center) {
      if (getShowLinearGaugeContainer) {
        _paintGaugeContainer(canvas, size);
      }
    }

    double value = getLinearGaugeIndicator.value ?? _valueInPixel;

    var firstOffset = Offset(_valueInPixel, 0.0);
    if (_indicator.getPointerValue == null) {
      _indicator.setPointerValue = value;
    }

    var firstOff =
        _linearGaugeLabel.getPrimaryRulersOffset["0"]![0] + firstOffset;

    getLinearGaugeIndicator.drawPointer(
        _indicator.shape!, canvas, firstOff, this);

    canvas.restore();
  }
}
