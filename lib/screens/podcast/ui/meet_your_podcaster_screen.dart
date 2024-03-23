import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

import '../../../model/meet_you_podcaster.dart';

class MeetYourPodcasterScreen extends StatefulWidget {
  final MeetYourPodcaster meetYourPodcaster;
  const MeetYourPodcasterScreen({super.key, required this.meetYourPodcaster});

  @override
  State<MeetYourPodcasterScreen> createState() =>
      _MeetYourPodcasterScreenState();
}

class _MeetYourPodcasterScreenState extends State<MeetYourPodcasterScreen> {
  ScrollController _scrollController = ScrollController();
  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 300 && !_showTitle) {
        setState(() {
          _showTitle = true;
        });
      } else if (_scrollController.offset <= 0 && _showTitle) {
        setState(() {
          _showTitle = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: _showTitle ? Text(widget.meetYourPodcaster.eventName) : null,
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  widget.meetYourPodcaster.imagePath,
                  fit: BoxFit.cover,
                  height: 300,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: GlobalVariables.horizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.meetYourPodcaster.day}, ${widget.meetYourPodcaster.date} • ${widget.meetYourPodcaster.startTime}',
                      style: TextStyle(
                        fontFamily: GlobalVariables.titleFont().fontFamily,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Text(
                      widget.meetYourPodcaster.eventName,
                      style: TextStyle(
                        fontFamily: GlobalVariables.titleFont().fontFamily,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: GlobalVariables.tertiaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 3,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Coins to participate: ${widget.meetYourPodcaster.coinsToParticipate} 🟡',
                          style: TextStyle(
                            fontFamily: GlobalVariables.textFont().fontFamily,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 3,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  widget.meetYourPodcaster.host,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text('5k followers')
                              ],
                            ),
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateColor.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return GlobalVariables.secondaryColor;
                                  }
                                  return GlobalVariables.secondaryColor;
                                }),
                              ),
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Follow',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: GlobalVariables.primaryColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.meetYourPodcaster.location,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: Divider(),
                    ),
                    Text(
                      'About this event',
                      style: TextStyle(
                        fontFamily: GlobalVariables.titleFont().fontFamily,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: GlobalVariables.tertiaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          widget.meetYourPodcaster.topicType,
                          style: TextStyle(
                            fontFamily: GlobalVariables.titleFont().fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: GlobalVariables.tertiaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.meetYourPodcaster.description,
                      style: TextStyle(
                          fontFamily: GlobalVariables.textFont().fontFamily),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: Divider(),
                    ),
                    Text(
                      'Location',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          fontFamily: GlobalVariables.titleFont().fontFamily),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: GlobalVariables.primaryColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.meetYourPodcaster.location,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Text(
                        '1, Jln Dutamas 1, Solaris Dutamas, 50480 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
                        style: TextStyle(
                            fontFamily: GlobalVariables.textFont().fontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Container(
                        width: 200,
                        height: 60, // Adjust the width as per your requirement
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                              (states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return GlobalVariables.secondaryColor;
                                }
                                return GlobalVariables.secondaryColor;
                              },
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Get Tickets',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
