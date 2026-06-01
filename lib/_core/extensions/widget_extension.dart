import 'package:flutter/material.dart';
import 'package:product_catelog_app/main.export.dart';

extension SeparatedIterableEx on Iterable<Widget> {
  List<Widget> separatedBy(Widget separator, {bool includeLast = false}) {
    final result = <Widget>[];
    final iterator = this.iterator;

    if (iterator.moveNext()) {
      result.add(iterator.current);
      while (iterator.moveNext()) {
        result
          ..add(separator)
          ..add(iterator.current);
      }

      if (includeLast) {
        result.add(separator);
      }
    }

    return result;
  }

  List<Widget> gapBy(double gap, {bool includeLast = false}) => separatedBy(Gap(gap), includeLast: includeLast);
}

extension ColorEX on Color {
  Color op(double opacity) => withValues(alpha: opacity);
  Color get op1 => op(.1);
  Color get op2 => op(.2);
  Color get op3 => op(.3);
  Color get op4 => op(.4);
  Color get op5 => op(.5);
  Color get op6 => op(.6);
  Color get op7 => op(.7);
  Color get op8 => op(.8);
  Color get op9 => op(.9);

  ColorFilter toFilter() => ColorFilter.mode(this, BlendMode.srcIn);
}
