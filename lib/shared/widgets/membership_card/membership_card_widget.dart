import 'package:flutter/material.dart';
import '../../styles/text_style/text_style.dart';
import '../image_widget/fcore_image.dart';

class MembershipCard extends StatelessWidget {
  final MembershipCardModel membershipCard;
  final bool checkBoderMemberCard;
  MembershipCard(
      {Key? key,
      required this.membershipCard,
      this.checkBoderMemberCard = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: checkBoderMemberCard
            ? Border.all(color: Colors.white, width: 1)
            : null,
        borderRadius: checkBoderMemberCard ? BorderRadius.circular(16.0) : null,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: FCoreImage(
              membershipCard.backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(membershipCard.title,
                      style: TextAppStyle().textTitleMembershipCardStyle()),
                  Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(membershipCard.name,
                              style: TextAppStyle()
                                  .textTitleNameMembershipCardStyle()),
                          const SizedBox(height: 4),
                          Text('CMND: ${membershipCard.identityCard}',
                              style: TextAppStyle()
                                  .textDateOfBirthMembershipCardStyle()),
                          const SizedBox(height: 4),
                          Text('Ngày sinh: ${membershipCard.dateOfBirth}',
                              style: TextAppStyle()
                                  .textDateOfBirthMembershipCardStyle()),
                        ]),
                  ),
                  Text(membershipCard.number,
                      style: TextAppStyle().textNumberMembershipCardStyle()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MembershipCardModel {
  final String backgroundImage;
  final String title;
  final String name;
  final String identityCard;
  final String dateOfBirth;
  final String number;
  MembershipCardModel(this.backgroundImage, this.title, this.name,
      this.identityCard, this.dateOfBirth, this.number);
}
