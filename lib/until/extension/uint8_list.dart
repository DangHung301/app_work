import 'dart:io';
import 'dart:typed_data';

extension Uni8ListExtension on Uint8List {
  File get convertToFile => File.fromRawPath(this);
}