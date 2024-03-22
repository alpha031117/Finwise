import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vhack_finwise_app/model/local_screen_news_model.dart';
import 'package:vhack_finwise_app/data/local_screen_news_data.dart';



import 'package:vhack_finwise_app/screens/home/ui/local_screen_news.dart';
class LocalScreen extends StatefulWidget {
  final List<LocalNews> localnews; // Pass articles list from parent widget
  const LocalScreen({required this.localnews});


  @override
  State<LocalScreen> createState() => _local_screenState();
}

class _local_screenState extends State<LocalScreen> {
  
  late final PageController _pageController;

    List<LocalNews> localnews = LocalNewsDatabase.localnews;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Local News',
                style: TextStyle(
                  color: const Color.fromARGB(255, 5, 44, 102),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 270,
                child: PageView.builder(
                  controller: _pageController,
                  itemBuilder: (_, index) {
                    LocalNews localnews = widget.localnews[index];
                    return GestureDetector(

                      onTap: () {
                          Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  LocalNewsScreen( 
                          localnews: widget.localnews[index]),
                      ),
                    );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 6.0),
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 150, // Adjust image height as needed
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
                                image: DecorationImage(
                                  image: AssetImage(localnews.imagePath), // Use AssetImage for local assets
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                   localnews.title,
                                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    'Author: ${localnews.author}',
                                    style: TextStyle(fontSize: 12.0, color: Colors.grey),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    'Date: ${localnews.date.toString()}',
                                    style: TextStyle(fontSize: 12.0, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: widget.localnews.length > 5 ? 5 : widget.localnews.length,
                  physics: PageScrollPhysics(),
                ),
              ),

              SizedBox(height: 10.0),
              Text(
                'More News',
                style: TextStyle(
                  color: const Color.fromARGB(255, 5, 44, 102),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: widget.localnews.length > 5 ? 5 : widget.localnews.length,
                  itemBuilder: (context, index) {
                    LocalNews localnews= widget.localnews[widget.localnews.length - 5 + index];
                    return GestureDetector(
                     onTap: () {
                          Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  LocalNewsScreen( 
                          localnews: widget.localnews[index]),
                      ),
                    );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 8.0),
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Container(
                                  width: 80.0, // Adjust image width as needed
                                  height: 80.0, // Adjust image height as needed
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    image: DecorationImage(
                                      image: AssetImage(localnews.imagePath), // Use AssetImage for local assets
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                            SizedBox(width: 12.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    localnews.title,
                                    style: TextStyle(
                                        fontSize: 14.0, fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Date: ${localnews.date.toString()}',
                                    style:
                                        TextStyle(fontSize: 12.0, color: Colors.grey),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    'Author: ${localnews.author}',
                                    style:
                                        TextStyle(fontSize: 12.0, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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