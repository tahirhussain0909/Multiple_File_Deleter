import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'file_utils.dart';

class FileDeleteScreen extends StatefulWidget {
  const FileDeleteScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _FileDeleteScreenState createState() => _FileDeleteScreenState();
}

class _FileDeleteScreenState extends State<FileDeleteScreen> {
  final TextEditingController _parentFolderPathController = TextEditingController();
  final TextEditingController _preserveFileNameController = TextEditingController();
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/file_delete.svg',
            width: 100,
            height: 100,
            color: Theme.of(context).hintColor,
          ),
          const SizedBox(height: 32),
          TextField(
            controller: _parentFolderPathController,
            decoration: const InputDecoration(
              labelText: 'Enter Parent Folder Path',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _preserveFileNameController,
            decoration: const InputDecoration(
              labelText: 'Enter File Name to Preserve (e.g., english.vtt)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              String parentFolderPath = _parentFolderPathController.text;
              String preserveFileName = _preserveFileNameController.text;
              _deleteFiles(parentFolderPath, preserveFileName);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              backgroundColor: Theme.of(context).primaryColor,
              textStyle: const TextStyle(fontSize: 18),
            ),
            child: const Text('Delete VTT Files'),
          ),
          const SizedBox(height: 24),
          Text(
            _message,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  void _deleteFiles(String parentFolderPath, String preserveFileName) {
    if (parentFolderPath.isEmpty || preserveFileName.isEmpty) {
      setState(() {
        _message = 'Please enter the required information.';
      });
      return;
    }

    deleteVttFiles(parentFolderPath, preserveFileName);
    setState(() {
      _message = 'Check the console for file deletion messages.';
    });
  }
}
