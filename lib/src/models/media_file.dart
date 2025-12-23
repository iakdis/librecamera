enum ImageFormats { png, jpg, webp, heic }

enum VideoFormats { mp4, mov }

sealed class MediaFile {}

class ImageMediaFile extends MediaFile {
  ImageMediaFile(this.format);
  final ImageFormats format;
}

class VideoMediaFile extends MediaFile {
  VideoMediaFile(this.format);
  final VideoFormats format;
}

extension MediaFileExtension on String {
  MediaFile? mediaFileByEnding() {
    final fileExtensionIndex = lastIndexOf('.');
    if (fileExtensionIndex == -1) {
      return null;
    }

    switch (substring(fileExtensionIndex).toLowerCase()) {
      case '.png':
        return ImageMediaFile(ImageFormats.png);
      case '.jpg':
      case '.jpeg':
        return ImageMediaFile(ImageFormats.jpg);
      case '.webp':
        return ImageMediaFile(ImageFormats.webp);
      case '.heic':
        return ImageMediaFile(ImageFormats.heic);
      case '.mp4':
        return VideoMediaFile(VideoFormats.mp4);
      case '.mov':
        return VideoMediaFile(VideoFormats.mov);
      default:
        throw UnsupportedError(
          'Unsupported image format: ${substring(fileExtensionIndex)}',
        );
    }
  }
}
