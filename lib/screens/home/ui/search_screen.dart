import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:vhack_finwise_app/screens/home/ui/news_search_screen.dart';
import 'package:vhack_finwise_app/screens/home/ui/news_screen.dart';
import 'package:vhack_finwise_app/model/new.dart';
import 'package:vhack_finwise_app/data/news.dart';
import 'package:vhack_finwise_app/model/saved_news_model.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final PageController _pageController;
  List<News> SearchScreenNewss = NewDatabase.newss;


  

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


  void updateList(String value) {
    setState(() {
      SearchScreenNewss = NewDatabase.newss.where((element) =>element.title.toLowerCase().contains(value.toLowerCase())||
      element.date.year.toString().contains(value.toLowerCase())||
      element.date.month.toString().contains(value.toLowerCase())||
      element.date.day.toString().contains(value.toLowerCase())||
      element.author.toLowerCase().contains(value.toLowerCase())
      ).toList();});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(60.0), // specify the preferred height here
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
        ),
        backgroundColor:
            Colors.grey[200], // Set the background color of the body here
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Search for News',
                style: TextStyle(
                  color: const Color.fromARGB(255, 5, 44, 102),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                onChanged: (value) => updateList(value),
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "eg: Trading / Real estate",
                ),
              ),
              SizedBox(height: 10.0),
              Expanded(
              child: ListView.builder(
                itemCount: SearchScreenNewss.length,
                itemBuilder: (context, index) => InkWell(
                  
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsScreen(news: SearchScreenNewss[index]),
                    ),
                  );
                  },
                  child: Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            SearchScreenNewss[index].title,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 5, 49, 85),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '${SearchScreenNewss[index].date.year}-${SearchScreenNewss[index].date.month}-${SearchScreenNewss[index].date.day}',
                            style: TextStyle(
                              fontSize: 11.0,
                              color: const Color.fromARGB(255, 5, 49, 85),
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            '${SearchScreenNewss[index].author}',
                            style: TextStyle(
                              fontSize: 11.0,
                              color: const Color.fromARGB(255, 5, 49, 85),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
