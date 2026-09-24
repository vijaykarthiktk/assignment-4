import 'package:flutter/material.dart';
import '../widgets/concept_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Flutter Core Concepts',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            letterSpacing: -0.2,
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Welcome / Overview Hero Banner
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF312E81), Color(0xFF4338CA), Color(0xFF6366F1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF4338CA).withValues(alpha: 0.35),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/profile.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => const CircleAvatar(
                              backgroundColor: Colors.white24,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vijay Karthik T K',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'vijaykarthiktk@gmail.com',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white70,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Explore the three core Flutter paradigms implemented using structured architecture, Material 3, and named route navigation.',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white70,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Concept Modules Section Header
            const Row(
              children: [
                Icon(Icons.explore_outlined, size: 20, color: Color(0xFF4F46E5)),
                SizedBox(width: 8),
                Text(
                  'Core Modules',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Concept Card 1: User Input & Forms
            ConceptCard(
              title: 'User Input & Forms',
              subtitle: 'Form validation with GlobalKey, TextFormField, controllers & feedback.',
              badgeText: 'FormState & Validation',
              icon: Icons.dynamic_form_rounded,
              primaryColor: const Color(0xFF4F46E5),
              onTap: () {
                // Named route navigation
                Navigator.pushNamed(context, '/form');
              },
            ),

            const SizedBox(height: 16),

            // Concept Card 2: Images, Assets & Fonts
            ConceptCard(
              title: 'Images, Assets & Fonts',
              subtitle: 'Local asset management, GridView.count & Google Font Poppins.',
              badgeText: 'Asset & Font Showcase',
              icon: Icons.photo_library_rounded,
              primaryColor: const Color(0xFF0D9488),
              onTap: () {
                // Named route navigation
                Navigator.pushNamed(context, '/gallery');
              },
            ),

            const SizedBox(height: 16),

            // Concept Card 3: Interactive Animations
            ConceptCard(
              title: 'Interactive Animations',
              subtitle: 'Explicit state transitions with AnimatedContainer for size, color & shape.',
              badgeText: 'AnimatedContainer',
              icon: Icons.auto_awesome_motion_rounded,
              primaryColor: const Color(0xFF8B5CF6),
              onTap: () {
                // Named route navigation
                Navigator.pushNamed(context, '/animation');
              },
            ),

            const SizedBox(height: 26),

            // Architecture Footer Info Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline_rounded, size: 20, color: Color(0xFF64748B)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'All screens navigate via Navigator.pushNamed() with dedicated context-aware AppBar titles.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Color(0xFF64748B),
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
