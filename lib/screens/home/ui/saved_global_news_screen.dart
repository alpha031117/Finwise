import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/model/global_screen_news_model.dart';
import 'package:vhack_finwise_app/screens/home/ui/global_screen_news.dart';


class SavedGlobalNewsScreen extends StatefulWidget {
  // final List<SearchScreenNews> savedNews;
  final List<GlobalNews> savedGlobalNews;

  SavedGlobalNewsScreen({required this.savedGlobalNews} );

  @override
  State<SavedGlobalNewsScreen> createState() => _SavedGlobalNewsScreenState();
}

class _SavedGlobalNewsScreenState extends State<SavedGlobalNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Global News'),
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
                itemCount: widget.savedGlobalNews.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  GlobalNewsScreen(globalnews: widget.savedGlobalNews[index]),
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
                            widget.savedGlobalNews[index].title,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 5, 49, 85),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '${widget.savedGlobalNews[index].date.year}-${widget.savedGlobalNews[index].date.month}-${widget.savedGlobalNews[index].date.day}',
                            style: TextStyle(
                              fontSize: 11.0,
                              color: const Color.fromARGB(255, 5, 49, 85),
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            '${widget.savedGlobalNews[index].author}',
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
            ),            
          ],
        ),
      ),
      


    );
  }
}
