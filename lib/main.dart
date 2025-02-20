import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarik_test/views/member_view.dart';

// Main (Entry Point)
void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: MemberView(),
    theme: ThemeData(primarySwatch: Colors.teal),
  ));
}
