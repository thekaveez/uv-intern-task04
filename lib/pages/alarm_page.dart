import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uv_intern_task04/pages/home_page.dart';

class AlarmPage extends StatelessWidget {
  const AlarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient and image (your existing code)
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF0a0617),
                    Color(0xFF1A103F)
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: const Image(
              image: AssetImage('assets/alarm_bg.png'),
              fit: BoxFit.cover,
            ),
          ),

          // Main content
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      SizedBox(height: 48),
                      // Work days section
                      const SizedBox(height: 16),
                      _buildAlarmCard(
                        bedtime: '11:00 PM',
                        wakeup: '07:00 AM',
                        sleepDuration: '8 hr 00 min in sleep',
                        days: 'Mo, Tu, We, Th, Fr',
                        sound: 'Cherry Blossom',
                        sectionTitle: 'Work days',
                        isEnabled: true,
                      ),

                      const SizedBox(height: 8),

                      // Sleep on weekends section
                      const SizedBox(height: 16),
                      _buildAlarmCard(
                        bedtime: '00:30 AM',
                        wakeup: '09:30 AM',
                        sleepDuration: '8 hr 25 min in sleep',
                        days: 'Sa, Su',
                        sound: 'Deep Sleep',
                        sectionTitle: 'Sleep on weekends',
                        isEnabled: false,
                      ),

                      SizedBox(height: 100),

                      // Create Alarm button
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            width: 200,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff4d039a),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  'Create Alarm',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Navigation bar (your existing code)
                Container(
                  color: Colors.transparent,
                  child: SafeArea(
                    top: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildNavItem(Icons.home, 'Home', false),
                          _buildNavItem(Icons.library_books, 'Library', false),
                          _buildNavItem(Icons.add_box_outlined, 'Create', false),
                          _buildNavItem(Icons.alarm, 'Alarm', true),
                          _buildNavItem(Icons.emoji_events_outlined, 'Awards', false),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, bool isEnabled) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        CupertinoSwitch(
          value: isEnabled,
          onChanged: (_) {},
          activeColor: const Color(0xff4d039a),
        ),
      ],
    );
  }

  Widget _buildAlarmCard({
    required String bedtime,
    required String wakeup,
    required String sleepDuration,
    required String days,
    required String sound,
    required String sectionTitle,
    required bool isEnabled,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1F1F3D),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16),
              ),
              child: _buildSectionHeader(sectionTitle, isEnabled),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                children: [
                  _buildTimeRow(
                    icon: Icons.bedtime,
                    iconColor: const Color(0xFFFFB74D),
                    label: 'Bedtime',
                    time: bedtime,
                    additionalInfoTitle: 'Repeat',
                    additionalInfo: days,
                  ),

                  // Sleep duration
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Row(
                      children: [
                        const SizedBox(width: 40),
                        Text(
                          sleepDuration,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Wake up row
                  _buildTimeRow(
                    icon: Icons.alarm,
                    iconColor: Colors.blue,
                    label: 'Wake up',
                    time: wakeup,
                    additionalInfo: sound,
                  ),

                ],
              ),
            ),
          )
          // Bedtime row





        ],
      ),
    );
  }

  Widget _buildTimeRow({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String time,
    required String additionalInfo,
    String additionalInfoTitle = 'Sound',
  }) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    additionalInfoTitle,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    additionalInfo,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    return Column(
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
    );
  }
}