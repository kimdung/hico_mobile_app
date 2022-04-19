class ExtendModel {
  int timeExtend;
  int money;
  bool isChoose;

  ExtendModel(this.timeExtend, this.money, this.isChoose);
}

final dataExtendList = [
  ExtendModel(15, 40, true),
  ExtendModel(20, 60, false),
  ExtendModel(30, 80, false),
  ExtendModel(60, 140, false),
  ExtendModel(90, 280, false),
];
