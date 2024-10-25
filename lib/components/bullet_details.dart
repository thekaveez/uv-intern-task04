import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BulletDetails extends StatelessWidget {

  final String text;
  const BulletDetails({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,0,0,16),
      child: Row(
        children: [
          Image.asset('assets/bullet_green.png', ),
          const SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
