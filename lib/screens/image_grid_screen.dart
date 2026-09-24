import 'package:flutter/material.dart';
import '../widgets/image_detail_dialog.dart';

class ImageItem {
  final String title;
  final String category;
  final String description;
  final String assetPath;

  const ImageItem({
    required this.title,
    required this.category,
    required this.description,
    required this.assetPath,
  });
}

class ImageGridScreen extends StatefulWidget {
  const ImageGridScreen({super.key});

  @override
  State<ImageGridScreen> createState() => _ImageGridScreenState();
}

class _ImageGridScreenState extends State<ImageGridScreen> {
  // Local image assets list registered in pubspec.yaml
  final List<ImageItem> _images = const [
    ImageItem(
      title: 'Vijay Karthik',
      category: 'Profile',
      description: 'Flutter Full Stack Developer (vijaykarthiktk@gmail.com) • LinkedIn: @vijaykaarthiktk.',
      assetPath: 'assets/images/profile.jpg',
    ),
    ImageItem(
      title: 'Serene Valley',
      category: 'Nature',
      description: 'A breathtaking vista of lush green valleys, meandering rivers, and distant mountain ridges.',
      assetPath: 'assets/images/nature.jpg',
    ),
    ImageItem(
      title: 'Misty Forest',
      category: 'Woodland',
      description: 'Enchanting morning fog weaving through towering pine and fir trees in the deep wilderness.',
      assetPath: 'assets/images/forest.jpg',
    ),
    ImageItem(
      title: 'Azure Coastline',
      category: 'Ocean',
      description: 'Pristine turquoise sea waters gently meeting warm sun-kissed sandy shores.',
      assetPath: 'assets/images/ocean.jpg',
    ),
    ImageItem(
      title: 'Golden Canopy',
      category: 'Sunlight',
      description: 'Luminous sunbeams filtering down through a vibrant canopy of autumn leaves.',
      assetPath: 'assets/images/sunlight.jpg',
    ),
    ImageItem(
      title: 'Canyon Odyssey',
      category: 'Travel',
      description: 'An open scenic highway stretching toward dramatic red sandstone rock formations.',
      assetPath: 'assets/images/travel.jpg',
    ),
    ImageItem(
      title: 'Alpine Summit',
      category: 'Mountains',
      description: 'Majestic snow-capped alpine peaks reflecting crisp morning sunlight.',
      assetPath: 'assets/images/mountains.jpg',
    ),
  ];

  // Set of favorited image indices for interactive feedback
  final Set<int> _favorites = {};

  void _showImageDetails(ImageItem item) {
    showDialog(
      context: context,
      builder: (context) => ImageDetailDialog(
        imagePath: item.assetPath,
        title: item.title,
        category: item.category,
        description: item.description,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Images, Assets & Fonts',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header: Custom Font & Asset Banner
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0D9488), Color(0xFF14B8A6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0D9488).withValues(alpha: 0.25),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white24,
                          radius: 20,
                          child: Icon(Icons.photo_library_rounded, color: Colors.white, size: 22),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Custom Poppins Font & Assets',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Global font family: Poppins (Google Fonts) configured in pubspec.yaml & ThemeData.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white70,
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Poppins weight showcase chips
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        _buildFontBadge('Regular 400', FontWeight.w400),
                        _buildFontBadge('Medium 500', FontWeight.w500),
                        _buildFontBadge('SemiBold 600', FontWeight.w600),
                        _buildFontBadge('Bold 700', FontWeight.w700),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Gallery Section Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'Local Image Gallery',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1E293B),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0F2FE),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${_images.length} Image.asset Items',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0284C7),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // GridView.count implementation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.80,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(_images.length, (index) {
                  final item = _images[index];
                  final isFav = _favorites.contains(index);

                  return Card(
                    elevation: 3,
                    shadowColor: Colors.black.withValues(alpha: 0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () => _showImageDetails(item),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // Local Image using Image.asset()
                          Image.asset(
                            item.assetPath,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey.shade200,
                                child: const Center(
                                  child: Icon(Icons.broken_image, color: Colors.grey, size: 36),
                                ),
                              );
                            },
                          ),

                          // Gradient shadow overlay for text readability
                          Positioned.fill(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withValues(alpha: 0.2),
                                    Colors.black.withValues(alpha: 0.85),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: const [0.4, 0.65, 1.0],
                                ),
                              ),
                            ),
                          ),

                          // Top-right favorite icon button
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Material(
                              color: Colors.black.withValues(alpha: 0.4),
                              shape: const CircleBorder(),
                              child: InkWell(
                                customBorder: const CircleBorder(),
                                onTap: () {
                                  setState(() {
                                    if (isFav) {
                                      _favorites.remove(index);
                                    } else {
                                      _favorites.add(index);
                                    }
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Icon(
                                    isFav ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                                    color: isFav ? Colors.redAccent : Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Category Tag
                          Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.55),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                item.category,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                          // Bottom Title & Subtitle
                          Positioned(
                            bottom: 12,
                            left: 12,
                            right: 12,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  item.title,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black54,
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Tap to inspect asset',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white.withValues(alpha: 0.8),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildFontBadge(String text, FontWeight weight) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white30),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 11,
          color: Colors.white,
          fontWeight: weight,
        ),
      ),
    );
  }
}
