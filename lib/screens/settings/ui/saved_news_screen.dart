import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vhack_finwise_app/data/users.dart';
import 'package:vhack_finwise_app/data/saved_news.dart';
import 'package:vhack_finwise_app/screens/home/ui/widgets/news_list_tile.dart';

import '../../../model/global_screen_news_model.dart';
import '../../../model/local_screen_news_model.dart';
import '../../../utils/global_variables.dart';
import '../../home/ui/global_screen_news.dart';
import '../../home/ui/local_screen_news.dart';
import '../../home/ui/widgets/Card/choice_card.dart';

class SavedNewsScreen extends StatefulWidget {
  const SavedNewsScreen({super.key});

  @override
  State<SavedNewsScreen> createState() => _SavedNewsScreenState();
}

class _SavedNewsScreenState extends State<SavedNewsScreen> {
  bool isGlobalSelected = true;
  int selectedLength = SavedNewsDatabase.savedGlobalNews.length;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Saved News',
            style: TextStyle(
              fontFamily: GlobalVariables.titleFont().fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: GlobalVariables.tertiaryColor,
              letterSpacing: 1,
            ),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(vertical:10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isGlobalSelected = true;
                          selectedLength= SavedNewsDatabase.savedGlobalNews.length;
                        });
                      },
                      child: const SizedBox(
                        width: 160, // Half of screen width
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              // Use Column for vertical arrangement
                              mainAxisSize:
                                  MainAxisSize.min, // Restrict card height
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage('assets/earth.jpg'),
                                  radius: 20,
                                ),
                                SizedBox(width: 15.0), // Adjust spacing as needed
                                Text(
                                  'Global',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isGlobalSelected = false;
                          selectedLength = SavedNewsDatabase.savedLocalNews.length;
                          print('local: ${SavedNewsDatabase.savedLocalNews.length}');
                        });
                      },
                      child: Container(
                        width: 160, // Half of screen width
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              // Use Column for vertical arrangement
                              mainAxisSize:
                                  MainAxisSize.min, // Restrict card height
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage('assets/local.jpg'),
                                  radius: 20,
                                ),
                                SizedBox(width: 15),
                                Text(
                                  'Local',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: selectedLength,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            if (isGlobalSelected) {
                              GlobalNews globalnews =
                                  SavedNewsDatabase.savedGlobalNews[index];
                              return GlobalNewsScreen(globalnews: globalnews);
                            } else {
                              LocalNews localnews =
                                  SavedNewsDatabase.savedLocalNews[index];
                              return LocalNewsScreen(localnews: localnews);
                            }
                          }),
                        );
                      },
                      child: NewsListTile(
                          globalOrLocalNews: isGlobalSelected
                              ? SavedNewsDatabase.savedGlobalNews[index]
                              : SavedNewsDatabase.savedLocalNews[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
