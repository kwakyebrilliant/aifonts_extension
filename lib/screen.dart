import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  // List of fonts to choose from
  final List<String> _fonts = [
    'Inter',
    'Roboto',
    'Lobster',
    'Oswald',
    'Poppins'
  ];

  // Selected font
  String _selectedFont = 'Inter';

  // Selected font size
  double _fontSize = 13.0;

  // Selected font weight
  double _fontWeightValue = 400.0;

  // Map slider value to FontWeight
  FontWeight _getFontWeight(double value) {
    switch (value.round()) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w400;
      case 500:
        return FontWeight.w500;
      case 600:
        return FontWeight.w600;
      case 700:
        return FontWeight.w700;
      case 800:
        return FontWeight.w800;
      default:
        return FontWeight.w400;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: CustomScrollView(
        slivers: [
          // SliverAppBar for scrollable AppBar
          SliverAppBar(
            pinned: true,
            expandedHeight: 80.0,
            flexibleSpace: FlexibleSpaceBar(
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
            backgroundColor: const Color(0xFFFFFFFF),
          ),

          // SliverToBoxAdapter to wrap regular widgets in a scrollable context
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD3D3D3),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            'Select Text',
                            style: GoogleFonts.getFont(
                              _selectedFont,
                              fontSize: _fontSize,
                              fontWeight: _getFontWeight(_fontWeightValue),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Dropdown for selecting a font
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Google fonts text
                        Text(
                          'Google Fonts',
                          style: GoogleFonts.inter(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF000000),
                          ),
                        ),

                        const SizedBox(height: 10.0),

                        // Dropdown here
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: const Color(0xFF800080),
                              width: 1.0,
                            ),
                          ),
                          child: DropdownButtonFormField<String>(
                            value: _selectedFont,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedFont = newValue!;
                              });
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none, // No additional border
                            ),
                            dropdownColor: const Color(0xFFFFFFFF),
                            items: _fonts
                                .map<DropdownMenuItem<String>>((String font) {
                              return DropdownMenuItem<String>(
                                value: font,
                                child: Text(
                                  font,
                                  style: GoogleFonts.inter(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF494B45),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Font size text
                        Text(
                          'Font Size',
                          style: GoogleFonts.inter(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF000000),
                          ),
                        ),

                        const SizedBox(height: 5.0),

                        // Font size slider
                        Slider(
                          value: _fontSize,
                          min: 13,
                          max: 100,
                          divisions: 99,
                          label: _fontSize.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _fontSize = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Font weight text
                        Text(
                          'Font Weight',
                          style: GoogleFonts.inter(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF000000),
                          ),
                        ),

                        const SizedBox(height: 5.0),

                        // Font weight slider
                        Slider(
                          value: _fontWeightValue,
                          min: 100,
                          max: 800,
                          divisions: 7,
                          label: _fontWeightValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _fontWeightValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
