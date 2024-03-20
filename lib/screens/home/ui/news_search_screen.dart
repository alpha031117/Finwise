import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/model/search_screen_model.dart';
import 'package:vhack_finwise_app/screens/home/Card/option_news_card.dart';
import 'package:vhack_finwise_app/screens/home/ui/saved_search_news_screen.dart';
import 'package:vhack_finwise_app/model/saved_news_model.dart';


String getMonthName(int month) {
  switch (month) {
    case 1:
      return 'January';
    case 2:
      return 'February';
    case 3:
      return 'March';
    case 4:
      return 'April';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'August';
    case 9:
      return 'September';
    case 10:
      return 'October';
    case 11:
      return 'November';
    case 12:
      return 'December';
    default:
      return '';
  }
}


String getfollowers(int followers) {
  if (followers >= 1000) {
    return 'k';
  } else if(followers >= 10000)
    return 'm';
  else{
    return '';
  }
}


double getfollowersNum(int followers) {
  if (followers >= 1000) {
    return followers/1000;
  } else if(followers >= 10000)
    return followers/10000;
  else{
    return followers.toDouble();
  }
}



class news_search_screen extends StatefulWidget {
  final search_screen_new search_screen_newss;
  const news_search_screen({Key? key, required this.search_screen_newss}) : super(key: key);

  @override
  State<news_search_screen> createState() => news_search_screenState();
}


class news_search_screenState extends State<news_search_screen> {
  late final PageController _pageController;
  bool isPressed = false;
  bool isBookmarked = false;



  void changeColor() {
    setState(() {
      isPressed = true;
    });
  }

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
      if (isBookmarked) {
        // If bookmarked, add the news to savedNews
        SavedNewsScreen.addSavedNews(widget.search_screen_newss);
      } else {
        // If unbookmarked, remove the news from savedNews
        SavedNewsScreen.removeSavedNews(widget.search_screen_newss);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            actions: <Widget>[
        IconButton(
          icon: Icon(
            isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            color: isBookmarked ? Colors.blue : null,
          ),
          onPressed: () {
            toggleBookmark();

          },
        ),
        SizedBox(width: 3), // Space between the icon buttons
        IconButton(
          icon: Icon(Icons.share_rounded),
          onPressed: () {
            // Implement functionality for settings icon button
          },
        ),
      ],
          ),
        ),
      backgroundColor: Colors.grey[200], // Set the background color of the body here
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 4),
                  CircleAvatar(
                    backgroundImage: AssetImage('${widget.search_screen_newss.imagePath}'),
                    radius: 9.5,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '${widget.search_screen_newss.com}',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 8,
                      ),
                      Positioned(
                        top: 1.5,
                        left: 1.0,
                        child: Icon(
                          Icons.check,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                  Container(
                    width: 1,
                    height: 14,
                    color: Colors.grey,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                  ),
                  SizedBox(width: 5),
                  Text('5 min Read'),
                  SizedBox(width: 5),
                  Container(
                    width: 1,
                    height: 14,
                    color: Colors.grey,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                  ),  
                  SizedBox(width: 3),
                  Text(
                    getMonthName(widget.search_screen_newss.date.month) +
                        ' ' +
                        '${widget.search_screen_newss.date.day}, ${widget.search_screen_newss.date.year}', // Format date
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[500]),
                  ),
            ]
              ),
              SizedBox(height: 8.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  '${widget.search_screen_newss.title}',
                  style: TextStyle(fontSize:30.0,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '${widget.search_screen_newss.text}',
                        style:
                            TextStyle(fontSize: 15.0, color: Colors.grey[800]),
                      ),
                    ), // Display the specific text (text5 in this case)
              SizedBox(height: 5.0),
              Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '${widget.search_screen_newss.text2}',
                        style:
                            TextStyle(fontSize: 15.0, color: Colors.grey[800]),
                      ),
                    ), 
              SizedBox(height: 5.0),
              Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 150.0, // Adjust image width as needed
                          height: 50.0, // Adjust image height as needed
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextButton(
                              onPressed: () {
                                showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      '',
                                      style: TextStyle(),
                                    ),
                                    content: Text(
                                      '${widget.search_screen_newss.explanation}',
                                      style: TextStyle(),
                                      ),
                                    actions: [
                                      SizedBox(height: 20),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Close the dialog
                                        },
                                        child: Text("Close"),
                                      )
                                    ],
                                  );
                                }
                                );
                              },
                              child: Text(
                                'TO LAZY TO READ ?',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10.0),
                              )),
                        ),
                      ],
                    ),
              SizedBox(height: 10.0),
              Container(
                      width: 330.0, // Adjust image width as needed
                      height: 200.0, // Adjust image height as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(
                              '${widget.search_screen_newss.imagePath}'), // Use AssetImage for local assets
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              SizedBox(height: 20.0),
              Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '${widget.search_screen_newss.text3}',
                        style:
                            TextStyle(fontSize: 15.0, color: Colors.grey[800]),
                      ),
                    ), 
              SizedBox(height: 20.0),
              Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '${widget.search_screen_newss.text4}',
                        style:
                            TextStyle(fontSize: 15.0, color: Colors.grey[800]),
                      ),
                    ), 
              SizedBox(height: 20.0),
              Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '${widget.search_screen_newss.text5}',
                        style:
                            TextStyle(fontSize: 15.0, color: Colors.grey[800]),
                      ),
                    ),
              SizedBox(height: 20),
              Divider(),
                Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.grey[200],
                ),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                    backgroundImage: AssetImage(widget.search_screen_newss.imagePath),
                    radius: 50,
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.search_screen_newss.com}',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                              maxLines: 2, // Adjust as needed
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(width: 8.0),
                            SizedBox(height: 3.0),
                            Text(
                              getfollowersNum(widget.search_screen_newss.followers).toString()+getfollowers(widget.search_screen_newss.followers)+' '+'followers' ,
                              style:
                                  TextStyle(fontSize: 14.0, color: Colors.grey),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 2.5,
                          right: 85,
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ],
                ),
                ),
                Divider(),
                Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                width: MediaQuery.of(context).size.width *
                    0.8, // Adjust width as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.blue[500],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 7.0),
                      child: Text(
                        widget.search_screen_newss.quiztitle, // Access title property
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 0.0),
                      child: const Divider(color: Colors.white),
                    ),
                    SizedBox(height: 5.0),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < widget.search_screen_newss.options.length; i++)
                        OptionWidget(
                          option: widget.search_screen_newss.options.keys.toList()[i],
                          color: isPressed
                              ? widget.search_screen_newss.options.values.toList()[i] == true
                                  ? Colors.green
                                  : Colors.red
                              : Colors.white,
                          onTap: changeColor,
                        ),
                    ],
                    
                  ),
                  SizedBox(height: 5.0),
                  ],
                ),
              ) 
            ],
          ),
        ),
    )
    );
  }
}
