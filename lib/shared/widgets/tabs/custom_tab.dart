import 'package:flutter/material.dart';

class CustomTab extends StatefulWidget {
  const CustomTab({
    required this.items,
    Key? key,
    this.selectedIdx = 0,
    this.normalStyle = const TextStyle(
      color: Color(0xFF888888),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    this.selectedStyle = const TextStyle(
      color: Color(0xff019748),
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    this.onTabChanged,
    this.constraints = const BoxConstraints(maxHeight: 35),
    this.paddingStart = 0,
    this.itemSpace = 12,
    this.paddingEnd = 0,
    this.itemDecoration = const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      color: Color(0xFFF3F5F9),
    ),
    this.activeItemDecoration = const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      color: Colors.red,
    ),
  })  : assert(items.length != 0, 'items must not be null or empty'),
        super(key: key);

  final List<String> items;
  final int selectedIdx;
  final TextStyle selectedStyle;
  final TextStyle normalStyle;
  final void Function(int index)? onTabChanged;
  final BoxConstraints constraints;
  final double paddingStart;
  final double itemSpace;
  final double paddingEnd;
  final Decoration activeItemDecoration;
  final Decoration itemDecoration;

  @override
  _CustomTabState createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  int selectedIdx = 0;

  @override
  void initState() {
    selectedIdx = widget.selectedIdx;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    selectedIdx = widget.selectedIdx;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final length = widget.items.length;
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: DefaultTabController(
        length: length,
        child: TabBar(
          physics: const BouncingScrollPhysics(),
          indicatorPadding: const EdgeInsets.only(bottom: 0),
          labelPadding: EdgeInsets.zero,
          isScrollable: true,
          indicatorColor: Colors.transparent,
          onTap: (index) {
            setState(() {
              selectedIdx = index;
            });
            widget.onTabChanged?.call(index);
          },
          tabs: widget.items
              .asMap()
              .map(
                (i, e) => MapEntry(
                  i,
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: i == 0 ? widget.paddingStart : widget.itemSpace,
                        right: i == length - 1 ? widget.paddingEnd : 0,
                      ),
                      child: TabItem(
                        decoration: i == selectedIdx
                            ? widget.activeItemDecoration
                            : widget.itemDecoration,
                        constraints: widget.constraints,
                        child: Text(
                          e,
                          textAlign: TextAlign.center,
                          style: i == selectedIdx
                              ? widget.selectedStyle
                              : widget.normalStyle,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .values
              .toList(),
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({
    required this.child,
    Key? key,
    this.decoration,
    this.constraints = const BoxConstraints(),
  }) : super(key: key);

  final Widget child;
  final Decoration? decoration;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 22, right: 22),
      decoration: decoration,
      constraints: constraints,
      child: Center(child: child),
    );
  }
}
