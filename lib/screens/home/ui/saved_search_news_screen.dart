// import 'package:flutter/material.dart';
// import 'package:vhack_finwise_app/model/search_screen_model.dart';
// import 'package:vhack_finwise_app/model/new.dart';

// class Saved_News_Screen extends StatefulWidget {
//   // final List<SearchScreenNews> savedNews;
//   final List<News> savedNewsCard;

//   Saved_News_Screen({required this.savedNews, required this.savedNewsCard} );

//   @override
//   State<Saved_News_Screen> createState() => _SavedNewsScreenState();
// }

// class _SavedNewsScreenState extends State<Saved_News_Screen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Saved News'),
//       ),
//       backgroundColor:
//             Colors.grey[200], // Set the background color of the body here
//        body: Padding(
//           padding: EdgeInsets.all(15.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(height: 10.0),
//               Expanded(
//               child: ListView.builder(
//                 itemCount: widget.savedNews.length,
//                 itemBuilder: (context, index) => InkWell(
//                   onTap: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) =>  news_more_screen(more_screen_newss: widget.more_screen_newss[index]),
//                     //   ),
//                     // );
//                   },
//                   child: Card(
//                     elevation: 3,
//                     margin: EdgeInsets.symmetric(vertical: 8.0),
//                     child: Padding(
//                       padding: EdgeInsets.all(12.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             widget.savedNews[index].title,
//                             style: TextStyle(
//                               color: const Color.fromARGB(255, 5, 49, 85),
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 8.0),
//                           Text(
//                             '${widget.savedNews[index].date.year}-${widget.savedNews[index].date.month}-${widget.savedNews[index].date.day}',
//                             style: TextStyle(
//                               fontSize: 11.0,
//                               color: const Color.fromARGB(255, 5, 49, 85),
//                             ),
//                           ),
//                           SizedBox(height: 4.0),
//                           Text(
//                             '${widget.savedNews[index].author}',
//                             style: TextStyle(
//                               fontSize: 11.0,
//                               color: const Color.fromARGB(255, 5, 49, 85),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: widget.savedNewsCard.length,
//                 itemBuilder: (context, index) => InkWell(
//                   onTap: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) =>  news_more_screen(more_screen_newss: widget.more_screen_newss[index]),
//                     //   ),
//                     // );
//                   },
//                   child: Card(
//                     elevation: 3,
//                     margin: EdgeInsets.symmetric(vertical: 8.0),
//                     child: Padding(
//                       padding: EdgeInsets.all(12.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             widget.savedNewsCard[index].title,
//                             style: TextStyle(
//                               color: const Color.fromARGB(255, 5, 49, 85),
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 8.0),
//                           Text(
//                             '${widget.savedNewsCard[index].date.year}-${widget.savedNewsCard[index].date.month}-${widget.savedNewsCard[index].date.day}',
//                             style: TextStyle(
//                               fontSize: 11.0,
//                               color: const Color.fromARGB(255, 5, 49, 85),
//                             ),
//                           ),
//                           SizedBox(height: 4.0),
//                           Text(
//                             '${widget.savedNewsCard[index].author}',
//                             style: TextStyle(
//                               fontSize: 11.0,
//                               color: const Color.fromARGB(255, 5, 49, 85),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
            
//           ],
//         ),
//       ),
      


//     );
//   }
// }
