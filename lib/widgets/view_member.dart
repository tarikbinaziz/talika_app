import 'package:flutter/material.dart';

void viewMember(Map<String, String> member, BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                member['name'] ?? '',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text("📍 বিভাগ: ${member['division']}",
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text("📞 ফোন: ${member['phone']}",
                style: const TextStyle(fontSize: 16, color: Colors.teal)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("বন্ধ করুন"),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
