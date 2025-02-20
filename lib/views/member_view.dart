import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarik_test/controller/member_controller.dart';
import 'package:tarik_test/widgets/member_list.dart';

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
