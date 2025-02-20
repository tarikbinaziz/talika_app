import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarik_test/widgets/phone_call.dart';

// Controller (Handles logic and state)
class MemberController extends GetxController {
  final mobileController = TextEditingController();
  final nameController = TextEditingController();
  final memberIdController = TextEditingController();
  final selectedDivision = ''.obs;

  final divisions = ['ঢাকা', 'চট্টগ্রাম', 'খুলনা', 'রাজশাহী'];

  final memberList = [
    {'name': 'আব্দুল জব্বার', 'division': 'ঢাকা'},
    {'name': 'আব্দুল জব্বার', 'division': 'ঢাকা'},
    {'name': 'আব্দুল জব্বার', 'division': 'ঢাকা'},
    {'name': 'আব্দুল জব্বার', 'division': 'ঢাকা'},
  ].obs;

  void searchMembers() {
    // Implement search logic here
    update();
  }

  void viewMember(Map<String, String> member) {
    // Handle view action
  }

  void deleteMember(Map<String, String> member) {
    memberList.remove(member);
    update();
  }

  void phoneCall() {
    makePhoneCall("01700000000");
  }
}

// View (UI Presentation)
class MemberView extends StatelessWidget {
  final MemberController controller = Get.put(MemberController());

  MemberView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.menu),
        title: const Text('সদস্য', style: TextStyle(fontSize: 18)),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('খুঁজুন',
                  style: TextStyle(fontSize: 20, color: Colors.teal)),
              const SizedBox(height: 16),
              _buildSearchSection(controller),
              const SizedBox(height: 24),
              const Center(
                child: Text('তালিকা',
                    style: TextStyle(fontSize: 20, color: Colors.teal)),
              ),
              MemberList(
                controller: controller,
              ),
              const SizedBox(height: 16)
              //  _buildMemberList(controller)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchSection(MemberController controller) {
    return Column(
      children: [
        TextField(
          controller: controller.mobileController,
          decoration: const InputDecoration(
              labelText: 'মোবাইল নং', border: OutlineInputBorder()),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: controller.nameController,
          decoration: const InputDecoration(
              labelText: 'নাম', border: OutlineInputBorder()),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: controller.memberIdController,
          decoration: const InputDecoration(
              labelText: 'সদস্য আইডি', border: OutlineInputBorder()),
        ),
        const SizedBox(height: 12),
        Obx(() => DropdownButtonFormField<String>(
              value: controller.selectedDivision.value.isEmpty
                  ? null
                  : controller.selectedDivision.value,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'বিভাগ'),
              items: controller.divisions
                  .map((division) =>
                      DropdownMenuItem(value: division, child: Text(division)))
                  .toList(),
              onChanged: (value) =>
                  controller.selectedDivision.value = value ?? '',
            )),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            // width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: controller.searchMembers,
              icon: const Icon(Icons.search),
              label: const Text('অনুসন্ধান করুন'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            ),
          ),
        ),
      ],
    );
  }
}

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
                            onTap: () => controller.viewMember(member),
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
                            onTap: () => controller.phoneCall(),
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

// Main (Entry Point)
void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: MemberView(),
    theme: ThemeData(primarySwatch: Colors.teal),
  ));
}
