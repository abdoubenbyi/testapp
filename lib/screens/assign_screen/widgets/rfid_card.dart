import 'package:flutter/material.dart';
import 'package:idna_food/widgets/custom_text.dart';

class RfidCard extends StatelessWidget {
  const RfidCard({super.key, required this.uid, required this.onDelete});
  final String uid;
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color.fromRGBO(229, 231, 235, 1), width: 1),
        ),
      ),
      padding: EdgeInsets.fromLTRB(16, 6, 30, 6),
      child: Row(
        children: [
          CustomText(
            text: uid,
            weight: FontWeight.w500,
            color: Color.fromRGBO(31, 41, 55, 1),
          ),
          Spacer(),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              overlayColor: Colors.transparent,
            ),
            onPressed: () {
              onDelete();
            },
            child: CustomText(
              text: 'Supprimer',
              weight: FontWeight.w600,
              color: Color.fromRGBO(255, 59, 48, 1),
            ),
          ),
        ],
      ),
    );
  }
}
