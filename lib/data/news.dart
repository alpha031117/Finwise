import 'package:vhack_finwise_app/model/new.dart';

class NewDatabase {
  static List<New> newss = [
    New(
      title: 'Markets News, March 8, 2024: Stocks Sink After Jobs Report; Chip Sell-off Hits Nvidia',
      date: DateTime(2024, 03, 08),
      author: 'COLIN LAIDEY',
      type:'Market',
      isBookMarked: false
    ),
    New(
      title: 'Rivan Stock Soars 13% as EV Maker Introduces Three New Models',
      date: DateTime(2024, 03, 07),
      author: 'BILL MCCOLL',
      type:'Companies',
      isBookMarked: false
    ),
    New(
      title: "Ahead of Oracle's Earnings Report Monday",
      date: DateTime(2024, 03, 08),
      author: 'NAOMI BUCHANAN',
      type:'Earnings',
      isBookMarked: false
    ),
    New(
      title: 'Top CD Rates Today: Lock in 5.00% or Better Until 2025, 2026, or Even 2027',
      date: DateTime(2024, 03, 08),
      author: 'SABRINA KARL',
      type:'CD Rates',
      isBookMarked: false
    ),
    New(
      title: '30-Year Mortgage Rates Fall to 3-week Low',
      date: DateTime(2024, 03, 08),
      author: 'SABRINA KARL',
      type:'Mortage Rates',
      isBookMarked: false
    ),
    New(
      title: 'US Economy New Today: Unemployment Rate Showing Signs of Slowdown',
      date: DateTime(2024, 03, 08),
      author: 'TAYLOR TOMPKINS & DICCON HYATT',
      type:'Economy',
      isBookMarked : false
    ),
    New(
      title: '4 Key Economic Takeaways From the State of the Union Address',
      date: DateTime(2024, 03, 08),
      author: 'TERRY LANE',
      type:'Government',
      isBookMarked : false
    ),
    New(
      title: "Bitcoin Kisses \$70K, Its Second All-Time High This Week, Then Promptly Falters",
      date: DateTime(2024, 03, 08),
      author: ' CHRISTIANA SCIAUDONE',
      type:'Crypto',
      isBookMarked : false
    ),
    New(
      title: 'SPY ETF Reaches Record High Amid Nvidia-Fueled AI Rally—Key Chart Pattern to Watch',
      date: DateTime(2024, 03, 08),
      author: 'TIMOTHY SMITH',
      type:'ETFs',
      isBookMarked : false
    ),
    New(
      title: 'Most Americans Worry About Retirement, Say Congress Should Act on Social Security Funding',
      date: DateTime(2024, 03, 08),
      author: 'KATHLEEN MARSHALL',
      type:'Personal Finance',
      isBookMarked : false
    ),
  ];
}
// class Article {
//   String title;
//   String subtitle;
//   DateTime date;
//   String author;
//   String text;

//   Article({
//     required this.title,
//     required this.subtitle,
//     required this.date,
//     required this.author,
//     required this.text,
//   });
// }