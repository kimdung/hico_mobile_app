part of 'payment_method_screen.dart';

extension PaymentMethodComponent on PaymentMethodScreen {
  Widget buildRadioComponent({
    required int type,
    required String icon,
    required String title,
    required String description,
  }) {
    return InkWell(
      onTap: () => controller.selected(type),
      child: Row(
        children: [
          FCoreImage(
            type.isEqual(controller.paymentMethod.value)
                ? IconConstants.icRadioSelected
                : IconConstants.icRadioUnselect,
            fit: BoxFit.fill,
            width: 16,
            height: 16,
          ),
          const SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  FCoreImage(
                    icon,
                    fit: BoxFit.fill,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: TextAppStyle()
                        .normalTextStype()
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Text(
                description,
                style: TextAppStyle().smallTextGrey(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
