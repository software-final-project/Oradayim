// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CircularProgressIndicatorWidget extends StatefulWidget {
  final double strokeWidth;
  final Duration duration;

  const CircularProgressIndicatorWidget({
    super.key,
    this.strokeWidth = 4.0,
    this.duration = const Duration(seconds: 2),
  });

  @override
  _StateCircularProgressIndicatorWidgetState createState() =>
      _StateCircularProgressIndicatorWidgetState();
}

class _StateCircularProgressIndicatorWidgetState
    extends State<CircularProgressIndicatorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Center(
          child: CircularProgressIndicator(
            value: _controller.value,
            strokeWidth: widget.strokeWidth,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            backgroundColor: Colors.white,
          ),
        );
      },
    );
  }
}
