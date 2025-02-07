import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MediaUploadWidget extends StatelessWidget {
  const MediaUploadWidget({super.key});

  Future<void> _pickMedia(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    try {
      if (source == ImageSource.gallery) {
        final XFile? image = await picker.pickImage(source: source);
        if (image != null) {
          // TODO: Handle image
        }
      } else {
        final XFile? video = await picker.pickVideo(source: source);
        if (video != null) {
          // TODO: Handle video
        }
      }
    } catch (e) {
      debugPrint('Error picking media: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Upload Media',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    leading: const Icon(Icons.image),
                    title: const Text('Upload Image'),
                    onTap: () {
                      Navigator.pop(context);
                      _pickMedia(context, ImageSource.gallery);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.video_library),
                    title: const Text('Upload Video'),
                    onTap: () {
                      Navigator.pop(context);
                      _pickMedia(context, ImageSource.gallery);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      icon: const Icon(Icons.upload_file, size: 24),
      label: const Text(
        'Upload Media',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      ),
    );
  }
} 