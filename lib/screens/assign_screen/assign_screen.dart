import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:idna_food/screens/assign_screen/employee_confirm.dart';
import 'package:idna_food/screens/assign_screen/employee_list.dart';
import 'package:idna_food/screens/assign_screen/widgets/rfid_card.dart';
import 'package:idna_food/services/data_service.dart';
import 'package:idna_food/widgets/custom_text.dart';

enum ViewType { employeeList, employeeConfirm }

class AssignScreen extends StatefulWidget {
  const AssignScreen({super.key});

  @override
  State<AssignScreen> createState() => _AssignScreenState();
}

class _AssignScreenState extends State<AssignScreen> {
  ViewType viewType = ViewType.employeeList;
  late Timer _cardFetchTimer;

  void toggleView() {
    setState(() {
      viewType =
          viewType == ViewType.employeeList
              ? ViewType.employeeConfirm
              : ViewType.employeeList;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCards();

    // Start a periodic timer to fetch cards every second
    _cardFetchTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      fetchCards();
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _cardFetchTimer.cancel();
    super.dispose();
  }

  Future<bool?> showExitDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.exit_to_app_rounded, color: Colors.red),
                const SizedBox(width: 10),
                CustomText(
                  text: "Quitter l'application",
                  size: 16,
                  weight: FontWeight.w600,
                ),
              ],
            ),
            content: CustomText(
              text: "Voulez-vous quitter l'application ?",
              size: 14,
              weight: FontWeight.w400,
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                onPressed:
                    () => Navigator.of(context).pop(false), // Stay in the app
                child: CustomText(
                  text: 'Annuler',
                  size: 13,
                  weight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromRGBO(29, 85, 74, 1), //
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                onPressed:
                    () => Navigator.of(context).pop(true), // Exit the app
                child: CustomText(
                  text: 'Quitter',
                  size: 13,
                  weight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
    );
  }

  void fetchCards() async {
    await DataService.fetchScannedCards();
    setState(() {});
  }

  void deleteCard(String uid) async {
    await DataService.deleteScannedCard(uid);
    await DataService.fetchScannedCards();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) return;
        final bool shouldExit = await showExitDialog(context) ?? false;
        if (context.mounted && shouldExit) {
          //Navigator.pop(context, true);
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/idna_logo.png', height: 60),
                  Spacer(),
                  /*IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      fetchCards();
                    },
                  ),
                  Spacer(),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      deleteCard('234200256075');
                    },
                  ),
                  Spacer(),*/
                  Image.asset('assets/agri_logo.png', height: 100),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color.fromRGBO(231, 231, 231, 1)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Liste des RFIDs Scannés',
                                weight: FontWeight.w600,
                                size: 16,
                                color: Color.fromRGBO(19, 40, 51, 1),
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    //borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: Color.fromRGBO(229, 231, 235, 1),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 16,
                                        ),
                                        child: Row(
                                          children: [
                                            CustomText(
                                              text: 'UID',
                                              size: 14,
                                              color: Color.fromRGBO(
                                                107,
                                                114,
                                                128,
                                                1,
                                              ),
                                              weight: FontWeight.w500,
                                            ),
                                            Spacer(),
                                            CustomText(
                                              text: 'ACTION',
                                              size: 14,
                                              color: Color.fromRGBO(
                                                107,
                                                114,
                                                128,
                                                1,
                                              ),
                                              weight: FontWeight.w500,
                                            ),
                                            const SizedBox(width: 60),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Color.fromRGBO(229, 231, 235, 1),
                                        thickness: 1,
                                        height: 0,
                                      ),
                                      //RfidCard(),
                                      /*ListView.builder(
                                        itemCount: uids.length,
                                        itemBuilder: (context, index) {
                                          return RfidCard(uid: uids[index]);
                                        },
                                      ),*/
                                      Expanded(
                                        child: ListView(
                                          children: [
                                            for (String uid in DataService.uids)
                                              RfidCard(
                                                uid: uid,
                                                onDelete: () {
                                                  deleteCard(uid);
                                                },
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      VerticalDivider(color: Color.fromRGBO(231, 231, 231, 1)),
                      //EmployeeList(),
                      viewType == ViewType.employeeList
                          ? EmployeeList(toggleView: toggleView)
                          : EmployeeConfirm(toggleView: toggleView),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
