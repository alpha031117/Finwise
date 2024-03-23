import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaderboardBar extends StatelessWidget {
  LeaderboardBar({
    super.key,
    required this.isPanelOpen,
    required this.isFirstPlace,
    required this.place,
  }) {
    assert(place == '1' || place == '2' || place == '3');
  }

  final bool isPanelOpen;
  final bool isFirstPlace;
  final String place;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        gradient: isFirstPlace == true
            ? LinearGradient(
                // Apply linear gradient
                colors: isPanelOpen
                    ? [
                        Colors.transparent,
                        Colors.transparent
                      ] // Transparent for open panel
                    : [
                        const Color.fromRGBO(247, 237, 151, 1),
                        const Color.fromRGBO(222, 166, 66, 1)
                      ], // Blue gradient for closed panel
                stops: const [
                  0.2,
                  0.5,
                ],
                begin: Alignment.topCenter, // Gradient starts from top-left
                end: Alignment.center, // Gradient ends at bottom-right
              )
            : null,
        color: isFirstPlace == true
            ? null
            : isPanelOpen
                ? (Colors.transparent)
                : const Color.fromRGBO(71, 167, 255, 1),
      ),
      child: Column(
        children: [
          isFirstPlace
              ? const SizedBox(
                  height: 30,
                )
              : const SizedBox(
                  height: 10,
                ),
          Text(
            place,
            style: TextStyle(
              fontSize: 85,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: GoogleFonts.oswald().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
