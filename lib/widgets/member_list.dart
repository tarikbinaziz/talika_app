import 'package:flutter/material.dart';
import 'package:tarik_test/controller/member_controller.dart';

class MemberList extends StatelessWidget {
  final MemberController controller;

  const MemberList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          // border: TableBorder.all(color: Colors.grey),
          columnWidths: const {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(3),
          },
          children: [
            /// Table Header
            TableRow(
              decoration: BoxDecoration(color: Colors.grey.shade300),
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: Text('নাম',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: Text('বিভাগ',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: Text('একশন',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ),
              ],
            ),

            /// Table Rows
            ...controller.memberList.map(
              (member) => TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(member['name'] ?? '')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(member['division'] ?? '')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () =>
                                controller.viewMemberDetails(member, context),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Text(
                                'বিস্তারিত',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () =>
                                controller.phoneCall(member['phone'] ?? ''),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Text(
                                'ফোন করুন',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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