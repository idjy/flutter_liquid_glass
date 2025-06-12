import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CustomShadersWidget extends StatefulWidget {
  const CustomShadersWidget({super.key});

  @override
  State<CustomShadersWidget> createState() => _CustomShadersWidgetState();
}

/// LightSource class for managing light properties -> bound to be critical for the shader to look realistic
class LightSource {
  final Color color;
  final double angle; // in radians
  final Offset position;
  final double intensity;

  const LightSource({
    required this.color,
    required this.angle,
    required this.position,
    this.intensity = 1.0,
  });

  // Helper method to get color components as floats
  List<double> get colorComponents => [
    color.red / 255.0,
    color.green / 255.0,
    color.blue / 255.0,
    color.alpha / 255.0,
  ];

  // Helper method to get direction vector from angle
  Offset get direction => Offset(cos(angle), sin(angle));

  // Create a copy with modified properties
  LightSource copyWith({
    Color? color,
    double? angle,
    Offset? position,
    double? intensity,
  }) {
    return LightSource(
      color: color ?? this.color,
      angle: angle ?? this.angle,
      position: position ?? this.position,
      intensity: intensity ?? this.intensity,
    );
  }
}


class _CustomShadersWidgetState extends State<CustomShadersWidget> {
  FragmentShader? shader;

  @override
  Widget build(BuildContext context) {
    if (shader == null) {
      return const Center(child: CircularProgressIndicator());
    }


    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.shader(shader!),
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              'ITS Me, World!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadMyShader();
  }

  void loadMyShader() async {
    final program = await FragmentProgram.fromAsset(
      'assets/shaders/glass_shader.frag',
    );
    setState(() {
      shader = program.fragmentShader();
    });
  }
}
