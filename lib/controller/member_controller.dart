import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarik_test/widgets/phone_call.dart';
import 'package:tarik_test/widgets/view_member.dart';

class MemberController extends GetxController {
  final mobileController = TextEditingController();
  final nameController = TextEditingController();
  final memberIdController = TextEditingController();
  final selectedDivision = ''.obs;

  final divisions = ['ঢাকা', 'চট্টগ্রাম', 'খুলনা', 'রাজশাহী'];

  final memberList = [
    {'name': 'আব্দুল জব্বার', 'division': 'ঢাকা', 'phone': '0123456789'},
    {'name': 'মোঃ হাসান', 'division': 'চট্টগ্রাম', 'phone': '01712345678'},
    {'name': 'রহিম উদ্দিন', 'division': 'সিলেট', 'phone': '01898765432'},
    {'name': 'করিম আলী', 'division': 'খুলনা', 'phone': '01987654321'},
  ].obs;

  void searchMembers() {
    // Implement search logic here
    update();
  }

  void viewMemberDetails(Map<String, String> member, BuildContext context) {
    viewMember(member, context);
  }

  void deleteMember(Map<String, String> member) {
    memberList.remove(member);
    update();
  }

  void phoneCall(String phoneNumber) {
    makePhoneCall(phoneNumber);
  }
}
