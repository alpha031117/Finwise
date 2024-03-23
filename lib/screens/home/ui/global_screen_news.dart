import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/model/global_screen_news_model.dart';
import 'package:vhack_finwise_app/screens/home/ui/widgets/Card/option_news_card.dart';
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

class GlobalNewsScreen extends StatefulWidget {
  final GlobalNews globalnews;
  const GlobalNewsScreen({Key? key, required this.globalnews}) : super(key: key);

  @override
  State<GlobalNewsScreen> createState() => _global_news_screen_State();
}

class  _global_news_screen_State extends State<GlobalNewsScreen> {
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
      widget.globalnews.isBookMarked = !widget.globalnews.isBookMarked;
      if (widget.globalnews.isBookMarked) {
        // If bookmarked, add the news to savedNews
        SavedNewsScreen.addSavedGlobalNews(widget.globalnews);
      } else {
        // If unbookmarked, remove the news from savedNews
        SavedNewsScreen.removeSavedGlobalNews(widget.globalnews);
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
            widget.globalnews.isBookMarked ? Icons.bookmark : Icons.bookmark_border,
            color: widget.globalnews.isBookMarked ? Colors.blue : null,
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
                    backgroundImage: AssetImage('${widget.globalnews.imagePath}'),
                    radius: 9.5,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '${widget.globalnews.com}',
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
                    getMonthName(widget.globalnews.date.month) +
                        ' ' +
                        '${widget.globalnews.date.day}, ${widget.globalnews.date.year}', // Format date
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[500]),
                  ),
            ]
              ),
              SizedBox(height: 8.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  '${widget.globalnews.title}',
                  style: TextStyle(fontSize:30.0,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '${widget.globalnews.text}',
                        style:
                            TextStyle(fontSize: 15.0, color: Colors.grey[800]),
                      ),
                    ), // Display the specific text (text5 in this case)
              SizedBox(height: 5.0),
              Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '${widget.globalnews.text2}',
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
                                      '${widget.globalnews.explanation}',
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
                              '${widget.globalnews.imagePath}'), // Use AssetImage for local assets
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              SizedBox(height: 20.0),
              Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '${widget.globalnews.text3}',
                        style:
                            TextStyle(fontSize: 15.0, color: Colors.grey[800]),
                      ),
                    ), 
              SizedBox(height: 20.0),
              Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '${widget.globalnews.text4}',
                        style:
                            TextStyle(fontSize: 15.0, color: Colors.grey[800]),
                      ),
                    ), 
              SizedBox(height: 20.0),
              Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '${widget.globalnews.text5}',
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
                    backgroundImage: AssetImage(widget.globalnews.imagePath),
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
                              '${widget.globalnews.com}',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                              maxLines: 2, // Adjust as needed
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(width: 8.0),
                            SizedBox(height: 3.0),
                            Text(
                              getfollowersNum(widget.globalnews.followers).toString()+getfollowers(widget.globalnews.followers)+' '+'followers' ,
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
                        widget.globalnews.quiztitle, // Access title property
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
                      for (int i = 0; i < widget.globalnews.options.length; i++)
                        OptionWidget(
                          option: widget.globalnews.options.keys.toList()[i],
                          color: isPressed
                              ? widget.globalnews.options.values.toList()[i] == true
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
