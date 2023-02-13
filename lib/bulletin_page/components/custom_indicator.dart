import 'package:flutter/material.dart';

class CustomIndicator extends Decoration {
  final BoxPainter _painter;

  CustomIndicator({required Color color, required double radius})
      : _painter = _CustomIndicator(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;

  //   throw UnimplementedError();
  // }
}

class _CustomIndicator extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CustomIndicator(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Offset customOffset = offset +
        Offset(configuration.size!.width / 2,
            configuration.size!.height - radius + 2);

    //canvas.drawCircle(customOffset, radius, _paint);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCenter(
                center: customOffset,
                width: 50, //configuration.size!.width,
                height: 6),
            Radius.circular(radius)),
        _paint);
  }
}
