import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idna_food/models/employee.dart';
import 'package:idna_food/screens/assign_screen/widgets/employee_card.dart';
import 'package:idna_food/widgets/custom_textfield.dart';

class EmployeeList extends StatelessWidget {
  const EmployeeList({super.key, required this.toggleView});

  final VoidCallback toggleView;

  static List<Employee> employees = [
    Employee(id: '001', fName: 'Adnane', lName: 'Khayrou'),
    Employee(id: '002', fName: 'Hicham', lName: 'Moulili'),
    Employee(id: '003', fName: 'Yassin', lName: 'Oularbi'),
    Employee(id: '004', fName: 'Abdelghani', lName: 'Benbyi'),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              prefixIcon: Icon(
                Icons.search,
                color: Color.fromRGBO(107, 114, 128, 1),
              ),
              enabledBorderColor: Color.fromRGBO(229, 231, 235, 1),
              focusedBorderColor: Color.fromRGBO(229, 231, 235, 1),

              hintText: 'Filtrer par nom ou Id',
              hintStyle: GoogleFonts.poppins(
                fontSize: 16,
                color: Color.fromRGBO(107, 114, 128, 1),
                fontWeight: FontWeight.w500,
              ),

              textStyle: GoogleFonts.poppins(
                fontSize: 16,
                color: Color.fromRGBO(19, 40, 54, 1),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Divider(
              color: Color.fromRGBO(229, 231, 235, 1),
              thickness: 1,
              height: 0,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  for (Employee employee in employees)
                    EmployeeCard(
                      name: employee.fName,
                      id: employee.id,
                      toggleView: () {
                        toggleView();
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
