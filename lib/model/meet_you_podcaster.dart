// ignore_for_file: public_member_api_docs, sort_constructors_first
class MeetYourPodcaster {
  String day;
  String date;
  String startTime;
  String endTime;
  String host;
  String eventName;
  String location;
  String description;
  String imagePath;
  String topicType;
  int coinsToParticipate;
  MeetYourPodcaster({
    required this.day,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.host,
    required this.eventName,
    required this.location,
    required this.description,
    required this.topicType,
    required this.coinsToParticipate,
    required this.imagePath,
  });

  static List<MeetYourPodcaster> meetYourPodcasterList = [
    MeetYourPodcaster(
      day: 'SUNDAY',
      date: '02-Dec 2024',
      startTime: '12:00pm',
      endTime: '2:00pm',
      host: 'Money TV',
      eventName: 'Savings 101',
      location: 'Publika, Solaris Dutamas',
      description:
          "Join us at the upcoming Investment Meet-Up event, where opportunities abound for savvy investors looking to expand their portfolios. Discover cutting-edge insights from industry experts, delve into emerging market trends, and network with like-minded professionals. Gain valuable knowledge on diverse investment vehicles, from stocks and bonds to cryptocurrencies and real estate. Whether you're a seasoned investor or just starting out, this event promises valuable information and connections to help you make informed investment decisions. Don't miss out on this unique opportunity to grow your wealth and financial acumen!\n\nExperience the power of networking and learning at our Investment Meet-Up event! Connect with top-tier investors, explore new investment strategies, and gain actionable insights from renowned experts in finance. Discover the latest trends in sustainable investing, fintech innovations, and global market opportunities. Whether you're interested in traditional assets or cutting-edge technologies, this event offers a dynamic platform to expand your investment knowledge and explore lucrative opportunities. Elevate your investment game and join us for a transformative experience that can reshape your financial future!",
      coinsToParticipate: 10000,
      imagePath: 'assets/podcast/mrmoney/mrmoney.png',
      topicType: 'Financial management',
    ),
    MeetYourPodcaster(
      day: 'SUNDAY',
      date: '02-Feb 2024',
      startTime: '2:00pm',
      endTime: '6:00pm',
      host: 'IHERNG',
      eventName: 'Property Investy = Money Flipping game?',
      location: 'Setia City Convention centre',
      description:
          "Join us at the upcoming Investment Meet-Up event, where opportunities abound for savvy investors looking to expand their portfolios. Discover cutting-edge insights from industry experts, delve into emerging market trends, and network with like-minded professionals. Gain valuable knowledge on diverse investment vehicles, from stocks and bonds to cryptocurrencies and real estate. Whether you're a seasoned investor or just starting out, this event promises valuable information and connections to help you make informed investment decisions. Don't miss out on this unique opportunity to grow your wealth and financial acumen!\n\nExperience the power of networking and learning at our Investment Meet-Up event! Connect with top-tier investors, explore new investment strategies, and gain actionable insights from renowned experts in finance. Discover the latest trends in sustainable investing, fintech innovations, and global market opportunities. Whether you're interested in traditional assets or cutting-edge technologies, this event offers a dynamic platform to expand your investment knowledge and explore lucrative opportunities. Elevate your investment game and join us for a transformative experience that can reshape your financial future!",
      coinsToParticipate: 20000,
      imagePath: 'assets/podcast/iherng/iherng.jpg',
      topicType: 'Property Investment',
    ),
    MeetYourPodcaster(
      day: 'SUNDAY',
      date: '02-May 2024',
      startTime: '2:00pm',
      endTime: '5:00pm',
      host: 'Faiz',
      eventName: 'Your First Move in Mutual Stocks',
      location: 'Publika, Solaris Dutamas',
      description:
          "Join us at the upcoming Investment Meet-Up event, where opportunities abound for savvy investors looking to expand their portfolios. Discover cutting-edge insights from industry experts, delve into emerging market trends, and network with like-minded professionals. Gain valuable knowledge on diverse investment vehicles, from stocks and bonds to cryptocurrencies and real estate. Whether you're a seasoned investor or just starting out, this event promises valuable information and connections to help you make informed investment decisions. Don't miss out on this unique opportunity to grow your wealth and financial acumen!\n\nExperience the power of networking and learning at our Investment Meet-Up event! Connect with top-tier investors, explore new investment strategies, and gain actionable insights from renowned experts in finance. Discover the latest trends in sustainable investing, fintech innovations, and global market opportunities. Whether you're interested in traditional assets or cutting-edge technologies, this event offers a dynamic platform to expand your investment knowledge and explore lucrative opportunities. Elevate your investment game and join us for a transformative experience that can reshape your financial future!",
      coinsToParticipate: 10000,
      imagePath: 'assets/podcast/financial faiz/financialfaiz_ep.jpg',
      topicType: 'Stock Market',
    ),
  ];
}
