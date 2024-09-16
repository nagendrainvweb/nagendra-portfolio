class PortfolioData{
  String? id;
  String? title;
  String? desc;
  String? imageUrl;
  String? type;
  String? link;
  late bool isHover;

  PortfolioData({this.id, this.title, this.desc, this.imageUrl, this.type, this.link,});


  PortfolioData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
    imageUrl = json['imageUrl'];
    type = json['type'];
    link = json['link'];
    isHover = false;
  }

  static List<PortfolioData> getPortfolioList(){
    List<PortfolioData> portfolioList = [];
    for (var e in portfolioJson) {
      portfolioList.add(PortfolioData.fromJson(e));
    }
    return portfolioList;
  }

}


final portfolioJson = [
  {
    'id': '1',
    'title': 'Connecting Life',
    'desc': 'Connecting Life is a mobile application designed to connect blood donors and recipients. The app provides a platform where users can search for blood donors, post blood requests, and directly connect with potential donors. Built using MVVM architecture and Provider for state management, the app ensures a smooth and efficient experience for users.',
    'imageUrl': 'assets/images/portfolio/blood_logo.jpeg',
    'type': 'Mobile',
    'link': 'https://github.com/nagendrainvweb/connectingLife/'
  },
  {
    'id': '2',
    'title': 'Form E-Commerce',
    'desc': 'Farm E-Commerce is an e-commerce application that connects customers with fresh, organic farm products. The app allows users to browse products by category, view product details, and make purchases using the Razorpay payment gateway. Built using the MVVM architecture and Provider for state management, the app ensures a scalable and efficient user experience.',
    'imageUrl': 'assets/images/portfolio/drmeat_logo.png',
    'type': 'Mobile',
    'link': 'https://github.com/nagendrainvweb/Farm-E-Commerce/'
  },
  {
    'id': '3',
    'title': 'Diamond',
    'desc': 'Diamond is an administration app designed for diamond industry workers to manage and track their work details and salary. The app allows workers to register, log in, and access essential features such as salary tracking and profile updates. Built using the MVVM architecture and Provider for state management, the app is designed to handle worker management efficiently.',
    'imageUrl': 'assets/images/portfolio/diamond_logo.png',
    'type': 'Mobile',
    'link': 'https://github.com/nagendrainvweb/diamond/'
  },
  {
    'id': '4',
    'title': 'Money Profit',
    'desc': 'MoneyProfit is a comprehensive fintech application designed to help users manage their financial health. With features like CIBIL score checking, loan applications, and interest rate comparisons, the app provides a one-stop solution for all financial needs. Built using the MVVM architecture and Provider for state management, the app is optimized for seamless user experiences.',
    'imageUrl': 'assets/images/portfolio/money_pros_logo.png',
    'type': 'Mobile',
    'link': 'https://github.com/nagendrainvweb/moneyProfit/'
  },
];