import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:librecamera/src/utils/preferences.dart';

class FormatButton extends StatefulWidget {
  const FormatButton({super.key});

  @override
  State<FormatButton> createState() => _FormatButtonState();
}

class _FormatButtonState extends State<FormatButton> {
  CompressFormat? _compressFormat;
  String _nameByCompressFormat(CompressFormat format) => switch (format) {
    .jpeg => 'JPEG/JPG',
    .png => 'PNG',
    .heic => 'HEIC',
    .webp => 'WebP',
  };

  @override
  void initState() {
    super.initState();

    _compressFormat = CompressFormat.values.firstWhere(
      (format) => format.name == Preferences.getCompressFormat(),
      orElse: () => CompressFormat.jpeg,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: const Padding(
        padding: .only(left: 4),
        child: Icon(Icons.image),
      ),
      value: _compressFormat,
      items: [
        ...CompressFormat.values.map(
          (format) => DropdownMenuItem<CompressFormat>(
            value: format,
            child: Text(_nameByCompressFormat(format)),
          ),
        ),
      ],
      onChanged: (format) async {
        await Preferences.setCompressFormat((format!).name);
        setState(() => _compressFormat = format);
      },
    );
  }
}
