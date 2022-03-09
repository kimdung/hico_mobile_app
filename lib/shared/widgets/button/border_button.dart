import 'package:flutter/material.dart';
import '../../../shared/constants/colors.dart';

class BorderButton extends StatelessWidget {
  BorderButton({
    double strokeWidth = 1,
    double radius = 10,
    Gradient? gradient,
    String text = '',
    Color? textColor,
    Widget? child,
    VoidCallback? onPressed,
    this.backgroundColor = Colors.transparent,
  })  : _painter = _GradientPainter(
          strokeWidth: strokeWidth,
          radius: radius,
          gradient: gradient ??
              LinearGradient(
                colors: [
                  hexToColor('#4CAF50'),
                  hexToColor('#087f23'),
                ],
              ),
        ),
        _child = child,
        _callback = onPressed,
        _radius = radius,
        _text = text,
        _textColor = textColor ?? hexToColor('#2F9AA0');

  final _GradientPainter _painter;
  final String _text;
  final Widget? _child;
  final VoidCallback? _callback;
  final double _radius;
  final Color backgroundColor;
  final Color _textColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _callback,
        child: InkWell(
          borderRadius: BorderRadius.circular(_radius),
          onTap: _callback,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(_radius)),
            constraints: const BoxConstraints(minWidth: 88),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_text != '')
                  Text(
                    _text,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _textColor,
                    ),
                  )
                else
                  _child!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  _GradientPainter({
    required double strokeWidth,
    required double radius,
    required Gradient gradient,
  })  : strokeWidth = strokeWidth = 0.0,
        radius = radius = 0.0,
        // ignore: prefer_initializing_formals
        gradient = gradient;

  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    final outerRect = Offset.zero & size;
    final outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    final innerRect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    final innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - strokeWidth));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    final path1 = Path()..addRRect(outerRRect);
    final path2 = Path()..addRRect(innerRRect);
    final path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
