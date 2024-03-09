import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vhack_finwise_app/screens/leaderboard/ui/widgets/big_circular_avatar.dart';
import 'package:vhack_finwise_app/screens/leaderboard/ui/widgets/leaderboard_panel.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({Key? key});

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  double firstPlaceSizedBox = 100;
  final double slidedFirstPlaceSizedBox = 20;
  bool isPanelOpen = false;

  @override
  Widget build(BuildContext context) {
    final panelController =
        PanelController(); //initialize panel Controller to have the drag handler
    return Scaffold(
      backgroundColor: GlobalVariables.secondaryColor,
      body: SlidingUpPanel(
        minHeight: MediaQuery.of(context).size.height * 0.4,
        maxHeight: MediaQuery.of(context).size.height * 0.65,
        parallaxEnabled: true,
        parallaxOffset: .2,
        panelBuilder: (controller) => LeaderboardPanel(
          controller: controller,
          panelController: panelController,
        ),
        onPanelSlide: (position) {
          //if panel fully opened, isPanedOpened = true
          if (position == 1.0) {
            Timer(Duration(seconds: 1), () {
              // Change color to transparent after 1 second
              setState(() {
                isPanelOpen = true;
              });
            });
          } else if (position == 0.0) {
            setState(() {
              isPanelOpen = false;
            });
          }
        },
        onPanelOpened: () {
          setState(() {
            // Increase height gradually
            firstPlaceSizedBox = 150;
          });
        },
        onPanelClosed: () {
          setState(() {
            // Increase height gradually
            firstPlaceSizedBox = 100;
          });
        },
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    AnimatedContainer(
                      height: firstPlaceSizedBox,
                      duration: Duration(seconds: 1),
                    ),
                    BigCircularAvatar(
                        imageUrl:
                            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FBillie_Eilish&psig=AOvVaw0I8OTkWz7wXVhuYU_qV0rx&ust=1710039358531000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCIjCpJaX5oQDFQAAAAAdAAAAABAE',
                        name: 'Doodle',
                        points: '69'),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 400,
                        color:
                            isPanelOpen ? (Colors.transparent) : Colors.orange,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              '1',
                              style:
                                  TextStyle(fontSize: 80, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    BigCircularAvatar(
                        imageUrl:
                            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FBillie_Eilish&psig=AOvVaw0I8OTkWz7wXVhuYU_qV0rx&ust=1710039358531000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCIjCpJaX5oQDFQAAAAAdAAAAABAE',
                        name: 'Doodle',
                        points: '69'),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: 200,
                        color: Colors.orange,
                        child: Text('1'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    BigCircularAvatar(
                        imageUrl:
                            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FBillie_Eilish&psig=AOvVaw0I8OTkWz7wXVhuYU_qV0rx&ust=1710039358531000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCIjCpJaX5oQDFQAAAAAdAAAAABAE',
                        name: 'Doodle',
                        points: '69'),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: 400,
                        color: Colors.orange,
                        child: Text('1'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
