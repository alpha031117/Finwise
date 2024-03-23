import 'package:flutter/material.dart';

import '../../../../utils/global_variables.dart';
class ListenPodcastBarButton extends StatelessWidget {
  final Function(String) onPressed;
  const ListenPodcastBarButton({
    super.key, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () => onPressed('Recent'),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        'Recent',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontStyle:
                                GlobalVariables.titleFont().fontStyle),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () => onPressed('You Might Like'),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        'You Might Like',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontStyle:
                                GlobalVariables.titleFont().fontStyle),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () => onPressed('Liked Podcasts'),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        'Liked Podcasts',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontStyle:
                                GlobalVariables.titleFont().fontStyle),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

