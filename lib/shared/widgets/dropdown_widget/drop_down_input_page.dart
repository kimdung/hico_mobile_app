import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../constants/colors.dart';
import 'drop_down_widget.dart';

class DropdownPage<T> extends StatefulWidget {
  final List<DropdownItem<T>?>? items;
  final Function(T value)? onChanged;
  final T? value;
  final String? label;

  const DropdownPage(
      {Key? key, this.items, this.onChanged, this.value, this.label})
      : super(key: key);

  @override
  __DropdownPageState<T> createState() => __DropdownPageState<T>();
}

class __DropdownPageState<T> extends State<DropdownPage<T>> {
  final TextEditingController searchInputController = TextEditingController();
  final BehaviorSubject<List<DropdownItem<T>?>> searchItemsStream =
      BehaviorSubject();
  final searchInputFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.items != null) {
      searchItemsStream.add(widget.items!);
    }
    searchInputFocusNode.requestFocus();
  }

  @override
  void dispose() {
    searchInputFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          widget.label ?? '',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.textBlack
          ),
        ),
      ),
      body: Column(
        children: [
          // _buildSearchInput(),
          Expanded(
            child: StreamBuilder<List<DropdownItem<T>?>>(
                stream: searchItemsStream.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  }
                  return ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: AppColor.dividerColorLight,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final item = snapshot.data![index]!;

                      return ListTile(
                        tileColor: AppColor.primaryBackgroundColorLight,
                        title: Text(item.text),
                        onTap: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context, item);
                          }
                        },
                        trailing: widget.value == item.value
                            ? const Icon(
                                Icons.check,
                                color: AppColor.primary,
                              )
                            : null,
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }

  // void _onSearchInputChanged(String value) {
  //   final searchItems = widget.items!.where((element) {
  //     final normalizedValue = value.trim().toLowerCase();
  //     return element!.text.toLowerCase().contains(normalizedValue);
  //   }).toList();

  //   searchItemsStream.add(searchItems);
  // }

  // Widget _buildSearchInput() {
  //   return SearchInput(
  //     focusNode: searchInputFocusNode,
  //     controller: searchInputController,
  //     onChanged: (String value) {
  //       _onSearchInputChanged(value);
  //     },
  //   );
  // }
}
