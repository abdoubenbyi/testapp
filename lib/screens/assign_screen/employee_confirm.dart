import 'package:flutter/material.dart';
import 'package:idna_food/widgets/custom_text.dart';

class EmployeeConfirm extends StatelessWidget {
  const EmployeeConfirm({super.key, required this.toggleView});

  final VoidCallback toggleView;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'ADNANE KHAYROU',
                  size: 35,
                  weight: FontWeight.w600,
                  color: Color.fromRGBO(19, 40, 51, 1),
                ),
                const SizedBox(height: 10),
                CustomText(
                  text: '001',
                  size: 30,
                  weight: FontWeight.w600,
                  color: Color.fromRGBO(107, 114, 128, 1),
                ),
              ],
            ),
          ),
          Divider(
            color: Color.fromRGBO(229, 231, 235, 1),
            thickness: 1,
            height: 0,
            indent: 3,
            endIndent: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      toggleView();
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(
                        color: Color.fromRGBO(229, 231, 235, 1),
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(22),
                    ),
                    child: CustomText(text: 'Annuler', weight: FontWeight.w600),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      toggleView();
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Color.fromRGBO(29, 85, 74, 1),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(22),
                    ),
                    child: CustomText(
                      text: 'Associer les RFIDs',
                      weight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
