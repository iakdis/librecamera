import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:librecamera/src/utils/preferences.dart';

class FormatButton extends StatefulWidget {
  const FormatButton({Key? key}) : super(key: key);

  @override
  State<FormatButton> createState() => _FormatButtonState();
}

class _FormatButtonState extends State<FormatButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: const Padding(
        padding: EdgeInsets.only(left: 4.0),
        child: Icon(Icons.image),
      ),
      value: getCompressFormat(),
      items: const [
        DropdownMenuItem<CompressFormat>(
          value: CompressFormat.jpeg,
          child: Text('JPEG/JPG'),
        ),
        DropdownMenuItem<CompressFormat>(
          value: CompressFormat.png,
          child: Text('PNG'),
        ),
        DropdownMenuItem<CompressFormat>(
          value: CompressFormat.webp,
          child: Text('WebP'),
        ),
      ],
      onChanged: (format) {
        setState(() {
          Preferences.setCompressFormat((format as CompressFormat).name);
        });
      },
    );
  }
}

CompressFormat getCompressFormat() {
  List<CompressFormat> formats = [
    CompressFormat.jpeg,
    CompressFormat.png,
    CompressFormat.webp,
  ];

  final formatString = Preferences.getCompressFormat();
  CompressFormat format = CompressFormat.jpeg;
  for (var f in formats) {
    if (f.name == formatString) format = f;
  }

  return format;
}
