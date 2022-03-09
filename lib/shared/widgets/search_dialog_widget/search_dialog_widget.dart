import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../search_bar_widget/search_bar_widget.dart';

class SearchDialogWidget extends StatefulWidget {
  const SearchDialogWidget({required this.objects});
  
  final List<dynamic> objects;

  @override
  _SearchDialogWidgetState createState() => _SearchDialogWidgetState();
}

class _SearchDialogWidgetState extends State<SearchDialogWidget> {
  TextEditingController searchController = TextEditingController();
  List<dynamic> listDisplayObjects = [];

  @override
  void initState() {
    listDisplayObjects.addAll(widget.objects);
    searchController.addListener(() {
      listDisplayObjects = widget.objects.where((element) {
        final _content = element.toString().toLowerCase();
        return _content.contains(searchController.text.toLowerCase());
      }).toList();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: const EdgeInsets.all(20),
      width: Get.width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          SearchBarWidget(
            onChangeData: (){},
            textController: searchController,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: ListView.separated(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(listDisplayObjects[index]);
                  },
                  child: Text(
                    listDisplayObjects[index].toString(),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                separatorBuilder: (context, index) => const Divider(
                  height: 30,
                ),
                itemCount: listDisplayObjects.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
