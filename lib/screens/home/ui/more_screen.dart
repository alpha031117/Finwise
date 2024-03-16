import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/model/new.dart';
import 'package:vhack_finwise_app/data/news.dart';

class more_screen extends StatefulWidget {
  const more_screen({Key? key}) : super(key: key);

  @override
  State<more_screen> createState() => _more_screenState();
}

class _more_screenState extends State<more_screen> {
  List<New> newsdata = NewDatabase.newss;
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
              SizedBox(height: 10.0),
              Expanded(
              child: ListView.builder(
                itemCount: newsdata.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>  NewsScreen(articlenewss: newsdata),
                    //   ),
                    // );
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
                            newsdata[index].title,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 5, 49, 85),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '${newsdata[index].date.year}-${newsdata[index].date.month}-${newsdata[index].date.day}',
                            style: TextStyle(
                              fontSize: 11.0,
                              color: const Color.fromARGB(255, 5, 49, 85),
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            '${newsdata[index].author}',
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