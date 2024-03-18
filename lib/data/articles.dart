import 'package:vhack_finwise_app/model/article.dart';

class ArticleDatabase {
  static List<Article> articless = [
    Article(
      title:
            'Markets News, March 8, 2024: Stocks Sink After Jobs Report; Chip Sell-off Hits Nvidia',
        date: DateTime(2024, 03, 08),
        author: 'COLIN LAIDEY',
        type: 'Market',
        isBookMarked: false,
        com: 'Slabdsgn',
        text:
            'Stocks went on a rollercoaster ride Friday, ultimately closing lower after a closely watched jobs report contained some evidence the labor market cooled in February.',
        text2:
            'The Nasdaq Composite tumbled 1.2% Friday to finish the week down the same amount. The S&P 500 slid 0.7% and lost 0.3% over the week. The Dow Jones Industrial Average slipped 0.2% to end the week 0.9% lower.',
        text3:
            "The U.S. added 275,000 jobs in February, more than the 198,000 economists were expecting, according to data from the Labor Department.There were, however, signs the labor market was cooling. The unemployment rate ticked up 0.2 percentage points to 3.9%, while average hourly wage growth slowed from the month. And January's print of 353,000 new jobs was revised down to 229,000.",
        text4:
            'Treasury yields bounced around following the report. The yield on the 10-year and 2-year notes dropped as low as 4.04% and 4.42%, respectively, before climbing back up to their pre-report levels.',
        text5:
            'Costco (COST) shares fell after it reported slower sales growth than analysts had been expecting in its 2024 fiscal second quarter.',
        imagePath: 'assets/marketnews.jpg'),
    
  ];
}
