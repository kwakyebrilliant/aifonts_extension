import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  // List of fonts to choose from
  final List<String> _fonts = GoogleFonts.asMap().keys.toList();

  // Selected font
  String _selectedFont = 'Inter';

  // Selected font size
  double _fontSize = 13.0;

  // Selected font weight
  double _fontWeightValue = 400.0;

  // suggestedfonts list
  final List<String> suggestedfonts = [
    'inter',
    'Open',
    'New',
    'Old',
    'Calm',
    'Hi',
    'Hue',
  ];

  // suggestedfonts list
  final Set<String> _suggestedFontsList = {};

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

  Future<List<String>> _fetchFonts(String query) async {
    final List<String> matchingFonts = _fonts
        .where((font) => font.toLowerCase().contains(query.toLowerCase()))
        .toList();

    // Shuffle the list of matching fonts
    matchingFonts.shuffle();

    // Return the first 10 fonts or all if there are less than 10
    return matchingFonts.take(10).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: CustomScrollView(
        slivers: [
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Wrap around container for preview font
                  Wrap(
                    children: [
                      // Container for preview font
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD3D3D3),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          // Preview font text here
                          child: Text(
                            'Preview Font',
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

                        // TypeAheadField for font selection
                        TypeAheadField<String>(
                          suggestionsCallback: (pattern) async {
                            return await _fetchFonts(pattern);
                          },
                          builder: (context, controller, focusNode) {
                            // Container for textfield in typeaheadfield
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: const Color(0xFFFFFFFF),
                                border: Border.all(
                                  color: const Color(0xFF800080),
                                ),
                              ),

                              // Textfield for searching fonts
                              child: TextField(
                                controller: controller,
                                focusNode: focusNode,
                                autofocus: true,
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  labelText: 'Search Fonts',
                                  labelStyle: GoogleFonts.inter(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF494B45),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemBuilder: (context, font) {
                            // ListTile to display fonts in suggestions
                            return ListTile(
                              title: Text(
                                font,
                                style: GoogleFonts.inter(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF494B45),
                                ),
                              ),
                            );
                          },
                          onSelected: (font) {
                            setState(() {
                              _selectedFont = font;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  // Font size slider
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Font Size',
                          style: GoogleFonts.inter(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF000000),
                          ),
                        ),
                        const SizedBox(height: 5.0),
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

                  // Font weight slider
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Font Weight',
                          style: GoogleFonts.inter(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF000000),
                          ),
                        ),
                        const SizedBox(height: 5.0),
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

                  // Suggested Fonts
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Suggested Fonts',
                          style: GoogleFonts.inter(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF000000),
                          ),
                        ),

                        // Padding around different font suggestions
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                            top: 20.0,
                          ),

                          // Wrap starts here
                          child: StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return Wrap(
                                children: suggestedfonts.map((suggestedfonts) {
                                  final isSelected = _suggestedFontsList
                                      .contains(suggestedfonts);
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (_suggestedFontsList
                                            .contains(suggestedfonts)) {
                                          _suggestedFontsList
                                              .remove(suggestedfonts);
                                        } else {
                                          _suggestedFontsList
                                              .add(suggestedfonts);
                                        }
                                      });
                                    },

                                    // Container with border around each genre
                                    child: Container(
                                      padding: const EdgeInsets.all(3.0),
                                      margin: const EdgeInsets.only(
                                          right: 10.0, top: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: const Color(0xFFF9F9FA),
                                      ),

                                      // Container for each genre
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                          left: 16.0,
                                          right: 16.0,
                                          top: 8.0,
                                          bottom: 8.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? const Color(0xFFF6C00A)
                                              : const Color(0xFFFFFFFF)
                                                  .withOpacity(0.8),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),

                                        // Text for each genre
                                        child: Text(
                                          suggestedfonts,
                                          style: GoogleFonts.inter(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                            color: isSelected
                                                ? const Color(0xFFFFFFFF)
                                                : const Color(0xFF000000),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                          // Wrap ends here
                        ),
                      ],
                    ),
                  ),

                  // Apply and reset Button
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Apply button
                        Container(
                          width: MediaQuery.of(context).size.width / 3 + 150.0,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 35.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFF800080),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Center(
                            child: Text(
                              'Apply Font',
                              style: GoogleFonts.inter(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ),

                        // Reset Button
                        Container(
                          width: MediaQuery.of(context).size.width / 3 + 150.0,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 35.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFF800080),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Center(
                            child: Text(
                              'Reset Font',
                              style: GoogleFonts.inter(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFFFFFF),
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
        ],
      ),
    );
  }
}
