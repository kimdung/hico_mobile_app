part of 'supplier_list_screen.dart';

extension SupplierListExtension on SupplierListScreen {
  Widget buildFilter(BuildContext context) {
    return Container(
      width: 200,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19161616),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 1,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                controller.sortOrder(context);
              },
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Color(0xffdcdcdc),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 5),
                      child: FCoreImage(IconConstants.icArrowUpDown),
                    ),
                    Text(
                      'Sắp xếp',
                      style: TextAppStyle().normalTextPink(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                controller.filter();
              },
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 5),
                      child: FCoreImage(IconConstants.icFilter),
                    ),
                    Text(
                      'Bộ lọc',
                      style: TextAppStyle().normalTextPink(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
