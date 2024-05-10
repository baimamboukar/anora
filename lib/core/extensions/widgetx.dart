import 'package:flutter/material.dart';

extension WidgetX on Widget {
  Widget get shrink => const SizedBox.shrink();
  Widget get hPadding => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: this,
      );
  Widget get vPadding => Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: this,
      );
  Widget vPaddingx(double x) => Padding(
        padding: EdgeInsets.symmetric(vertical: x),
        child: this,
      );
  Widget hPaddingx(double x) => Padding(
        padding: EdgeInsets.symmetric(horizontal: x),
        child: this,
      );
  Widget get center => Align(
        child: this,
      );

  Widget get floatR => Align(
        alignment: Alignment.centerRight,
        child: this,
      );
  Widget get shiftR => Row(
        children: [this],
      );

  Widget get floatL => Align(
        alignment: Alignment.centerLeft,
        child: this,
      );
  Widget get floatC => Align(
        child: this,
      );
}
