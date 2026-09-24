import 'dart:math';
import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  // AnimatedContainer properties
  double _width = 130.0;
  double _height = 130.0;
  Color _color = const Color(0xFF6366F1);
  Color _endColor = const Color(0xFF4338CA);
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(20);
  Alignment _alignment = Alignment.center;
  double _elevation = 8.0;
  IconData _icon = Icons.touch_app_rounded;
  String _stateName = 'State A (Compact)';

  // Preset tracking
  bool _isToggled = false;

  // Toggle between two predefined aesthetic states
  void _toggleState() {
    setState(() {
      _isToggled = !_isToggled;
      if (_isToggled) {
        _width = 250.0;
        _height = 150.0;
        _color = const Color(0xFFEC4899);
        _endColor = const Color(0xFFF43F5E);
        _borderRadius = BorderRadius.circular(75);
        _alignment = Alignment.centerRight;
        _elevation = 18.0;
        _icon = Icons.auto_awesome_rounded;
        _stateName = 'State B (Expanded Pill)';
      } else {
        _width = 130.0;
        _height = 130.0;
        _color = const Color(0xFF6366F1);
        _endColor = const Color(0xFF4338CA);
        _borderRadius = BorderRadius.circular(20);
        _alignment = Alignment.centerLeft;
        _elevation = 8.0;
        _icon = Icons.touch_app_rounded;
        _stateName = 'State A (Compact Box)';
      }
    });
  }

  // Randomize all visual properties dynamically
  void _randomizeProperties() {
    final random = Random();
    setState(() {
      _width = 90.0 + random.nextInt(170); // 90 to 260
      _height = 90.0 + random.nextInt(110); // 90 to 200

      // Random aesthetic colors
      final colors = [
        [const Color(0xFF3B82F6), const Color(0xFF1D4ED8)], // Blue
        [const Color(0xFF10B981), const Color(0xFF047857)], // Emerald
        [const Color(0xFFF59E0B), const Color(0xFFD97706)], // Amber
        [const Color(0xFF8B5CF6), const Color(0xFF6D28D9)], // Purple
        [const Color(0xFFEC4899), const Color(0xFFBE185D)], // Pink
        [const Color(0xFF06B6D4), const Color(0xFF0E7490)], // Cyan
      ];
      final selectedGradient = colors[random.nextInt(colors.length)];
      _color = selectedGradient[0];
      _endColor = selectedGradient[1];

      final radiusVal = random.nextDouble() * 70.0;
      _borderRadius = BorderRadius.circular(radiusVal);

      final alignments = [
        Alignment.topLeft,
        Alignment.topRight,
        Alignment.center,
        Alignment.bottomLeft,
        Alignment.bottomRight,
      ];
      _alignment = alignments[random.nextInt(alignments.length)];
      _elevation = 6.0 + random.nextInt(16);
      _icon = Icons.shuffle_rounded;
      _stateName = 'Randomized State';
    });
  }

  // Apply custom preset
  void _applyPreset(int presetIndex) {
    setState(() {
      switch (presetIndex) {
        case 1: // Circle
          _width = 150.0;
          _height = 150.0;
          _color = const Color(0xFF06B6D4);
          _endColor = const Color(0xFF0891B2);
          _borderRadius = BorderRadius.circular(100);
          _alignment = Alignment.center;
          _elevation = 12.0;
          _icon = Icons.circle_outlined;
          _stateName = 'Circle Preset';
          break;
        case 2: // Wide Banner
          _width = 280.0;
          _height = 90.0;
          _color = const Color(0xFF10B981);
          _endColor = const Color(0xFF059669);
          _borderRadius = BorderRadius.circular(16);
          _alignment = Alignment.topCenter;
          _elevation = 10.0;
          _icon = Icons.view_headline_rounded;
          _stateName = 'Banner Preset';
          break;
        case 3: // Card
          _width = 170.0;
          _height = 200.0;
          _color = const Color(0xFFF59E0B);
          _endColor = const Color(0xFFD97706);
          _borderRadius = BorderRadius.circular(28);
          _alignment = Alignment.bottomCenter;
          _elevation = 14.0;
          _icon = Icons.credit_card_rounded;
          _stateName = 'Card Preset';
          break;
      }
    });
  }

  // Reset to default
  void _resetToDefault() {
    setState(() {
      _isToggled = false;
      _width = 130.0;
      _height = 130.0;
      _color = const Color(0xFF6366F1);
      _endColor = const Color(0xFF4338CA);
      _borderRadius = BorderRadius.circular(20);
      _alignment = Alignment.center;
      _elevation = 8.0;
      _icon = Icons.touch_app_rounded;
      _stateName = 'Default Center';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Interactive AnimatedContainer',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1E293B),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: const Color(0xFFE2E8F0), height: 1),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Info Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF8B5CF6), Color(0xFF7C3AED)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF8B5CF6).withValues(alpha: 0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: Colors.white24,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.animation_rounded, color: Colors.white, size: 26),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Smooth Property Interpolation',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'AnimatedContainer automatically interpolates Size, Color, Border Radius & Alignment.',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Animation Canvas / Stage
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
                side: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Canvas Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFF10B981),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Interactive Stage',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF475569),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF1F5F9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              _stateName,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF64748B),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // Stage Container hosting the AnimatedContainer
                    Container(
                      height: 270,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                      ),
                      child: Stack(
                        children: [
                          // Animated Alignment wrapping AnimatedContainer
                          AnimatedAlign(
                            alignment: _alignment,
                            duration: const Duration(milliseconds: 650),
                            curve: Curves.easeInOutCubic,
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: GestureDetector(
                                onTap: _toggleState,
                                child: AnimatedContainer(
                                  key: const Key('interactive_animated_container'),
                                  duration: const Duration(milliseconds: 650),
                                  curve: Curves.easeInOutCubic,
                                  width: _width,
                                  height: _height,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [_color, _endColor],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: _borderRadius,
                                    boxShadow: [
                                      BoxShadow(
                                        color: _color.withValues(alpha: 0.4),
                                        blurRadius: _elevation * 1.5,
                                        offset: Offset(0, _elevation * 0.4),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: SingleChildScrollView(
                                      physics: const NeverScrollableScrollPhysics(),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(_icon, color: Colors.white, size: 32),
                                          const SizedBox(height: 6),
                                          const Text(
                                            'Animated',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            '${_width.toInt()}x${_height.toInt()}',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Colors.white.withValues(alpha: 0.8),
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

            // Controls Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Animation Triggers',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Primary Toggle Button
                    ElevatedButton.icon(
                      onPressed: _toggleState,
                      icon: Icon(
                        _isToggled ? Icons.toggle_on_rounded : Icons.toggle_off_rounded,
                        size: 26,
                      ),
                      label: Text(
                        _isToggled ? 'Switch to State A' : 'Switch to State B',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: const Color(0xFF8B5CF6),
                        foregroundColor: Colors.white,
                        elevation: 3,
                        shadowColor: const Color(0xFF8B5CF6).withValues(alpha: 0.4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Secondary Action Buttons Row
                    Row(
                      children: [
                        // Randomize Button
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _randomizeProperties,
                            icon: const Icon(Icons.casino_outlined, size: 20),
                            label: const Text(
                              'Randomize',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              foregroundColor: const Color(0xFF6366F1),
                              side: const BorderSide(color: Color(0xFF6366F1), width: 1.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        // Reset Button
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _resetToDefault,
                            icon: const Icon(Icons.refresh_rounded, size: 20),
                            label: const Text(
                              'Reset',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              foregroundColor: const Color(0xFF64748B),
                              side: const BorderSide(color: Color(0xFFCBD5E1), width: 1.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Quick Presets
                    const Text(
                      'Quick Presets:',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: _buildPresetButton('Circle', () => _applyPreset(1), const Color(0xFF06B6D4)),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _buildPresetButton('Banner', () => _applyPreset(2), const Color(0xFF10B981)),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _buildPresetButton('Card', () => _applyPreset(3), const Color(0xFFF59E0B)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

            // Live Property Inspector Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.tune_rounded, color: Color(0xFF6366F1), size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Live Property Inspector',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                      ],
                    ),
                    const Divider(color: Color(0xFFF1F5F9), height: 24),
                    _buildInspectorRow('Dimensions', '${_width.toInt()} px × ${_height.toInt()} px'),
                    _buildInspectorRow('Alignment', _alignment.toString()),
                    _buildInspectorRow('Duration', '650 ms (easeInOutCubic)'),
                    _buildInspectorRow('Elevation / Blur', '${_elevation.toStringAsFixed(1)} px'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildPresetButton(String title, VoidCallback onPressed, Color color) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withValues(alpha: 0.12),
        foregroundColor: color,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: color.withValues(alpha: 0.3)),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildInspectorRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              color: Color(0xFF64748B),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                value,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E293B),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
