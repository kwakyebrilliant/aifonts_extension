import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'ai',
                style: GoogleFonts.inter(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF800080),
                ),
              ),
              TextSpan(
                text: 'fonts',
                style: GoogleFonts.roboto(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF000000),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print('Hello, World!');
          },
          child: Text('Hello, World!'),
        ),
      ),
    );
  }
}
