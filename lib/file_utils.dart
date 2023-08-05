import 'dart:io';

void deleteSubtitleFiles(String parentFolderPath, String preserveFileName) {
  try {
    final directory = Directory(parentFolderPath);
    if (!directory.existsSync()) {
      print("Directory does not exist: $parentFolderPath");
      return;
    }

    directory.listSync(recursive: true).forEach((FileSystemEntity entity) {
      if (entity is File) {
        String fileName = entity.uri.pathSegments.last;
        if (fileName.toLowerCase().endsWith(".srt") &&
            fileName.toLowerCase() != preserveFileName.toLowerCase()) {
          try {
            entity.deleteSync();
            print("File deleted: ${entity.path}");
          } catch (e) {
            print("Error deleting file: ${entity.path}");
          }
        }
      }
    });
  } catch (e) {
    print("An error occurred: $e");
  }
}
