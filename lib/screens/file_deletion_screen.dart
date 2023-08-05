import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/file_utils.dart';


class FileDeleteScreen extends StatefulWidget {
  @override
  _FileDeleteScreenState createState() => _FileDeleteScreenState();
}

class _FileDeleteScreenState extends State<FileDeleteScreen> {
  TextEditingController _parentFolderPathController = TextEditingController();
  TextEditingController _preserveFileNameController = TextEditingController();
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
          SizedBox(height: 32),
          TextField(
            controller: _parentFolderPathController,
            decoration: InputDecoration(
              labelText: 'Enter Parent Folder Path',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _preserveFileNameController,
            decoration: InputDecoration(
              labelText: 'Enter File Name to Preserve (e.g., english.vtt)',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              String parentFolderPath = _parentFolderPathController.text;
              String preserveFileName = _preserveFileNameController.text;
              _deleteFiles(parentFolderPath, preserveFileName);
            },
            child: Text('Delete VTT Files'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              primary: Theme.of(context).primaryColor,
              textStyle: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 24),
          Text(
            _message,
            style: TextStyle(fontSize: 16),
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
