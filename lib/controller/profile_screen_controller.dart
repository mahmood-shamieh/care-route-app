import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreenController {
  ProfileScreenController({required this.context});
  late BuildContext context;
  final imageProvider = StateProvider.autoDispose<File?>((ref) => null);

  void changeImage({required WidgetRef ref}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      ref.read(imageProvider.notifier).state = File(result.files.single.path!);
    } else {
      // User canceled the picker
    }
  }

  File? watchImageProviderValue({required WidgetRef ref}) {
    return ref.watch(imageProvider);
  }
}
