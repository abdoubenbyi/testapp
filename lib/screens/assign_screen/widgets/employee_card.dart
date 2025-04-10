import 'package:flutter/material.dart';
import 'package:idna_food/widgets/custom_text.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({
    super.key,
    required this.name,
    required this.id,
    required this.toggleView,
  });
  final String name;
  final String id;
  final VoidCallback toggleView;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color.fromRGBO(247, 247, 247, 1), width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: name,
                  size: 18,
                  weight: FontWeight.w600,
                  color: Color.fromRGBO(19, 40, 51, 1),
                ),
                const SizedBox(height: 5),
                CustomText(
                  text: id,
                  color: Color.fromRGBO(107, 114, 128, 1),
                  size: 15,
                  weight: FontWeight.w600,
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              height: 50,
              width: 50,
              child: IconButton.filled(
                iconSize: 30,
                style: IconButton.styleFrom(
                  backgroundColor: Color.fromRGBO(29, 85, 74, 1),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  toggleView();
                },
                icon: Icon(Icons.add_circle_outline_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
