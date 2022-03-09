import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';

const double _itemSize = 12;

class StepWidget extends StatelessWidget {
  const StepWidget({
    required this.currentStepIndex,
    Key? key,
    required this.items,
  }) : super(key: key);

  final int currentStepIndex;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final distance = (Get.width - 32 - (items.length * (_itemSize + 4) * 2)) /
        (items.length - 1);
    return Container(
      width: Get.width,
      height: 100,
      child: Column(
        children: [
          Container(
            height: (_itemSize + 4) * 2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Row(
                children: [
                  index != 0
                      ? Container(
                          width: distance,
                          height: 2,
                          color: index > currentStepIndex
                              ? const Color(0xffC4C4C4)
                              : const Color(0xff0CA72C).withOpacity(0.4),
                        )
                      : const SizedBox.shrink(),
                  CircleItem(
                    index: (index + 1).toString(),
                    status: currentStepIndex == index
                        ? StepStatus.Current
                        : index < currentStepIndex
                            ? StepStatus.Pass
                            : StepStatus.NotYet,
                    title: items[index],
                  ),
                ],
              ),
              itemCount: items.length,
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 16),
              height: 14,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List<Widget>.generate(
                  items.length,
                  (index) => Text(
                    items[index],
                    style: TextStyle(
                      color: AppColor.primaryTextColorLight,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class CircleItem extends StatelessWidget {
  const CircleItem({
    required this.index,
    Key? key,
    this.status = StepStatus.NotYet,
    required this.title,
  }) : super(key: key);

  final StepStatus status;
  final String index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      minRadius: _itemSize + 4,
      maxRadius: _itemSize + 4,
      backgroundColor: status == StepStatus.NotYet
          ? const Color(0xff888888).withOpacity(0.2)
          : status == StepStatus.Current
              ? Colors.transparent
              : const Color(0xff0CA72C).withOpacity(0.2),
      child: CircleAvatar(
        minRadius: _itemSize,
        maxRadius: _itemSize,
        backgroundColor: status == StepStatus.NotYet
            ? const Color(0xffBBBBBB).withOpacity(0.2)
            : const Color(0xff0CA72C),
        child: Text(index,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: Colors.white,
                )),
      ),
    );
  }
}

enum StepStatus { Pass, Current, NotYet }
