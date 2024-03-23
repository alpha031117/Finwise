import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vhack_finwise_app/model/user.dart';
import 'package:vhack_finwise_app/screens/leaderboard/ui/widgets/big_circular_avatar.dart';
import 'package:vhack_finwise_app/screens/leaderboard/ui/widgets/leaderboard_panel.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';
import 'dart:async';

import '../bloc/leaderboard_bloc.dart';
import 'widgets/leaderboard_bar.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({Key? key}) : super(key: key);

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  //only the first place avatar will move based on the container above them
  double firstPlaceSizedBox = 100;
  bool isPanelOpen = false;
  late List<MyUser> topThree;
  final _leaderboardBloc = LeaderboardBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //trigger LeaderboardInitialEvent
    _leaderboardBloc.add(LeaderboardInitialEvent());

    _leaderboardBloc.add(LeaderboardCalculatePointsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final panelController =
        PanelController(); //initialize panel Controller to have the drag handler
    return BlocConsumer<LeaderboardBloc, LeaderboardState>(
      bloc: _leaderboardBloc,
      listener: (context, state) {
        // TODO: implement listener
        if (state is LeaderboardShowNoFriendState) {
          //havent decide
        } else if (state is LeaderboardCalculatePoints) {
          final List<MyUser> topThreeUsers = (state).topThree;
          topThree = topThreeUsers;
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case LeaderboardLoadingState:
          case LeaderboardCalculatePoints:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case LeaderboardLoadedState:
            final List<MyUser> users = (state as LeaderboardLoadedState).users;
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text(
                  'Leaderboard',
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person_add_alt_1,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
              backgroundColor: GlobalVariables.secondaryColor,
              body: SlidingUpPanel(
                minHeight: MediaQuery.of(context).size.height * 0.4,
                maxHeight: MediaQuery.of(context).size.height * 0.60,
                parallaxEnabled: true,
                parallaxOffset: .2,
                backdropColor: Colors.transparent,
                color: Colors.transparent,
                panelBuilder: (controller) => LeaderboardPanel(
                  controller: controller,
                  panelController: panelController,
                  users: users,
                ),
                onPanelSlide: (position) {
                  //if panel fully opened, isPanedOpened = true
                  if (position == 1.0) {
                    Timer(const Duration(seconds: 1), () {
                      // Change color to transparent after 1 second
                      setState(() {
                        isPanelOpen = true;
                      });
                    });
                  } else {
                    setState(() {
                      isPanelOpen = false;
                    });
                  }
                },
                onPanelOpened: () {
                  setState(() {
                    // Increase height gradually
                    firstPlaceSizedBox = 120;
                  });
                },
                onPanelClosed: () {
                  setState(() {
                    // Increase height gradually
                    firstPlaceSizedBox = 100;
                  });
                },
                borderRadius: const BorderRadius.only(
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
                              duration: const Duration(seconds: 1),
                            ),
                            BigCircularAvatar(
                              imageUrl: topThree[0].profileUrl,
                              name: topThree[0].username,
                              points: topThree[0].points.toString(),
                              isFirst: true,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: LeaderboardBar(
                                isPanelOpen: isPanelOpen,
                                isFirstPlace: true,
                                place: '1',
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
                            const SizedBox(
                              height: 150,
                            ),
                            BigCircularAvatar(
                              imageUrl: topThree[1].profileUrl,
                              name: topThree[1].username,
                              points: topThree[1].points.toString(),
                              isFirst: false,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: LeaderboardBar(
                                isPanelOpen: isPanelOpen,
                                isFirstPlace: false,
                                place: '2',
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
                              imageUrl: topThree[2].profileUrl,
                              name: topThree[2].username,
                              points: topThree[2].points.toString(),
                              isFirst: false,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: LeaderboardBar(
                                isPanelOpen: isPanelOpen,
                                isFirstPlace: false,
                                place: '3',
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
          case LeaderboardErrorState:
            return const Center(
              child: Text('Error occured Loading users'),
            );
          default:
            return Center(
              child: Text('${state.runtimeType}'),
            );
        }
      },
    );
  }
}
