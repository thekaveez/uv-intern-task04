import 'package:flutter/material.dart';
import 'package:uv_intern_task04/components/popup_page.dart';
import 'package:uv_intern_task04/pages/play_page.dart';

import 'alarm_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showFullScreenDialog(context);
    });
  }

  void showFullScreenDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel, // Add this line
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
        return const PopupPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D1B69),
      body: Stack(
        children: [

          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF0a0617),
                    Color(0xFF1A103F)],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // Top Bar
                Stack(
                  children: [
                    Container(
                        width: double.infinity,
                        child: const Image(image: AssetImage('assets/background_top.png'), fit: BoxFit.cover,)
                    ),
                    // Container(color: Colors.red, width: double.infinity, height: 200,),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.lock, color: Colors.white, size: 16),
                                  SizedBox(width: 4),
                                  Text(
                                    'Upgrade',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.search, color: Colors.white),
                              onPressed: () {},
                            ),
                          ],
                          ),
                        ),
                        const SizedBox(height: 150),
                        // Categories
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              _buildCategoryChip('All', true),
                              _buildCategoryChip('Meditation', false),
                              _buildCategoryChip('Soundscapes', false),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // User Avatars
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              _buildUserAvatar('Jenny W.', 'assets/avatar1.png'),
                              _buildUserAvatar('Jane', 'assets/avatar2.png', ),
                              _buildUserAvatar('Regina', 'assets/avatar3.png', ),
                              _buildUserAvatar('Bessie', 'assets/avatar4.png', ),
                              _buildUserAvatar('Lily', 'assets/avatar5.png', ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ],
                ),

                // Content Grid
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    padding: const EdgeInsets.all(16),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: [
                      _buildContentCard(
                        'Deep Sleep',
                        'Jenny',
                        '13 min',
                        'assets/deep_sleep.png',
                        true,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const PlayPage()));
                        },
                        child: _buildContentCard(
                          'Magical City',
                          'Regina',
                          '17 min',
                          'assets/magical_city.png',
                          false,
                        ),
                      ),
                      _buildContentCard(
                        'You Are Not Alone',
                        'Kathryn',
                        '10 min',
                        'assets/not_alone.png',
                        true,
                      ),
                      _buildContentCard(
                        'Planet Of Crystals',
                        'Irma',
                        '25 min',
                        'assets/crystals.png',
                        true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),

          // Bottom Navigation Bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.transparent,
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNavItem(Icons.home, 'Home', false, () {}),
                      _buildNavItem(Icons.library_books, 'Library', true, () {}),
                      _buildNavItem(Icons.add_box_outlined, 'Create', false, () {}),
                      _buildNavItem(Icons.alarm, 'Alarm', false, () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AlarmPage()));
                      }),
                      _buildNavItem(Icons.emoji_events_outlined, 'Awards', false, () {}),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF8B5CF6) : Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildUserAvatar(String name, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image(image: AssetImage(imagePath)), // Replace with actual image
            ),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentCard(
      String title,
      String author,
      String duration,
      String imagePath,
      bool isFree,
      ) {
    return Container(

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image(image: AssetImage(imagePath),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,), // Replace with actual image
          ),
          Positioned(
            left: 12,
            top: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.white, size: 12),
                  const SizedBox(width: 4),
                  Text(
                    duration,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),

            Positioned(
              right: 12,
              top: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isFree ? const Color(0xFF8B5CF6) : const Color(0xFFF6583E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  isFree ? 'free' : 'new',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          Positioned(
            left: 12,
            bottom: 12,
            right: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  author,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected, Function() onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFF8B5CF6) : Colors.white.withOpacity(0.5),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xFF8B5CF6) : Colors.white.withOpacity(0.5),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}