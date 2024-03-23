import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/model/meet_you_podcaster.dart';

import '../../../../utils/global_variables.dart';
import '../meet_your_podcaster_screen.dart';

class MeetYourPodcasterCard extends StatelessWidget {
  final MeetYourPodcaster meetYourPodcaster;
  const MeetYourPodcasterCard({
    super.key,
    required this.meetYourPodcaster,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 250,
        width: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 8,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return MeetYourPodcasterScreen(
                  meetYourPodcaster: meetYourPodcaster,
                );
              }));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      meetYourPodcaster.imagePath,
                      fit: BoxFit.cover,
                      height: 150,
                      width: 150,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 140,
                        child: Text(
                          '${meetYourPodcaster.day}, ${meetYourPodcaster.date} at ${meetYourPodcaster.startTime}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade500),
                        ),
                      ),
                      Text(
                        '${meetYourPodcaster.host}: ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontStyle: GlobalVariables.titleFont().fontStyle),
                      ),
                      //
                      Container(
                        width: 140,
                        child: Text(
                          meetYourPodcaster.eventName,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontStyle: GlobalVariables.titleFont().fontStyle),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
