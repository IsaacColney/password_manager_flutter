import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';

class InitializeScreen extends StatelessWidget {
  const InitializeScreen({Key? key}) : super(key: key);

  Future<List<List>> importCSVFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    List<List> csvDataList = [];
    if (result != null) {
      File file = File((result.files.single.path).toString());
      final open = file.openRead();
      csvDataList = await open
          .transform(utf8.decoder)
          .transform(const CsvToListConverter())
          .toList();
    }
    return csvDataList;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              "Import Google Password(csv) file",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontStyle: FontStyle.normal),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: importCSVFile,
              child: const Text("Import CSV"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
            ),
            const SizedBox(
              height: 50,
            ),
          ]),
    );
  }
}
