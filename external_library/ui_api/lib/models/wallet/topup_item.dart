class TopupItem {
  static List<TopupItem> topupItems = [
    TopupItem('500 JPY', 500),
    TopupItem('1000 JPY', 1000),
    TopupItem('2000 JPY', 2000),
    TopupItem('3000 JPY', 3000),
    TopupItem('5000 JPY', 5000),
    TopupItem('10000 JPY', 10000),
  ];

  String title;
  double price;

  TopupItem(this.title, this.price);
}
