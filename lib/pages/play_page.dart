import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Main artwork and background
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF1C123B).withOpacity(0.2),
                    Color(0xFF090818),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Container(
                      alignment: Alignment.topCenter,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/japanese_scene.png',
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: const Alignment(0, -0.5),
                        colors: [
                          const Color(0xFF0C0A1E),
                          const Color(0xFF100C28).withOpacity(0.05),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: 50,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: const Image(
                                  image: AssetImage('assets/down_arrow_icon.png'),
                              )
                            ),
                            const Text(
                              'NOW PLAYING',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                letterSpacing: 2,
                              ),
                            ),
                            InkWell(
                                onTap: () {},
                                child: const Image(
                                  image: AssetImage('assets/heart_icon.png'),
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),


                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 330,
                        padding: const EdgeInsets.fromLTRB(24, 16, 24, 48),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: const Alignment(0, -0.5),
                            colors: [
                              const Color(0xFF100C28).withOpacity(0.25),
                              const Color(0xFF0C0A1E),
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Cherry Blossom',
                                  style: GoogleFonts.poppins(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.person_3_rounded,
                                      color: Color(0xff9760D1),
                                      size: 16,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      'Bessie Jones',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: const Color(0xff9760D1),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),
                            // Progress bar
                            Column(
                              children: [
                                SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: Color(0xff9760D1),
                                    inactiveTrackColor: Colors.grey[800],
                                    thumbColor: Color(0xff9760D1),
                                    trackHeight: 2,
                                  ),
                                  child: Slider(
                                    value: 0.23, // Current progress
                                    onChanged: (value) {},
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '3:30',
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '15:00',
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 60),
                            // Playback controls
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.shuffle),
                                  onPressed: () {},
                                  color: Colors.white70,
                                ),
                                IconButton(
                                  icon: const Icon(Icons.skip_previous),
                                  onPressed: () {},
                                  iconSize: 35,
                                  color: Colors.white,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xff9760D1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.play_arrow),
                                    onPressed: () {},
                                    iconSize: 35,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.skip_next),
                                  onPressed: () {},
                                  iconSize: 35,
                                  color: Colors.white,
                                ),
                                IconButton(
                                  icon: const Icon(Icons.repeat),
                                  onPressed: () {},
                                  color: Colors.white70,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Music controls section

        ],
      ),
    );
  }
}

// Custom painter for the Japanese scene

