import 'package:flutter/material.dart';
import 'dart:math' as math;

class AudioWaveform extends StatefulWidget {
  final double progress;
  final Color activeColor;
  final Color inactiveColor;
  final int barsCount;

  const AudioWaveform({
    Key? key,
    this.progress = 0.0,
    this.activeColor = Colors.purple,
    this.inactiveColor = const Color(0xFF4A4A4A),
    this.barsCount = 40,
  }) : super(key: key);

  @override
  State<AudioWaveform> createState() => _AudioWaveformState();
}

class _AudioWaveformState extends State<AudioWaveform>
    with SingleTickerProviderStateMixin {
  late List<double> barHeights;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _generateRandomBarHeights();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..repeat(reverse: true);
  }

  void _generateRandomBarHeights() {
    final random = math.Random();
    barHeights = List.generate(widget.barsCount, (index) {
      // Create a more musical pattern with some bars being taller
      double height = 0.3 + random.nextDouble() * 0.7;
      // Add some pattern to make it look more like music
      if (index % 4 == 0) height *= 1.5;
      if (index % 6 == 0) height *= 0.5;
      return height.clamp(0.1, 1.0);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final barWidth = constraints.maxWidth / (widget.barsCount * 2 - 1);

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(widget.barsCount, (index) {
                final isActive = index / widget.barsCount <= widget.progress;
                final color = isActive ? widget.activeColor : widget.inactiveColor;
                double heightMultiplier = barHeights[index];

                // Add subtle animation to active bars
                if (isActive) {
                  heightMultiplier *= 1 + (_animationController.value * 0.1);
                }

                return Container(
                  width: barWidth,
                  height: constraints.maxHeight * heightMultiplier,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(barWidth / 2),
                  ),
                );
              }).expand((widget) => [
                widget,
                SizedBox(width: barWidth),
              ]).toList()..removeLast(),
            );
          },
        );
      },
    );
  }
}