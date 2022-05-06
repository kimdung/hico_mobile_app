class TopupItem {
  static List<TopupItem> topupItems = [
    TopupItem('50 JPY', 50),
    TopupItem('150 JPY', 150),
    TopupItem('200 JPY', 200),
    TopupItem('250 JPY', 250),
    TopupItem('500 JPY', 500),
    TopupItem('1000 JPY', 1000),
    TopupItem('2000 JPY', 2000),
    TopupItem('3000 JPY', 3000),
  ];

  String title;
  double price;

  TopupItem(this.title, this.price);
}
