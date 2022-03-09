import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hico/base/base_controller.dart';
import 'package:hico/shared/styles/text_style/text_style.dart';
import 'package:image_picker/image_picker.dart';

class ImageWidgetController extends BaseController {
  Future<ImageSource?> showImageSource(BuildContext context) async {
    if (Platform.isIOS) {
      return showCupertinoModalPopup<ImageSource>(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () => Navigator.of(context).pop(ImageSource.camera),
              child: Text(
                'Camera',
                style: TextAppStyle().genaralTextStyle(),
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () => Navigator.of(context).pop(ImageSource.gallery),
              child: Text(
                'Gallery',
                style: TextAppStyle().genaralTextStyle(),
              ),
            )
          ],
        ),
      );
    } else {
      return showModalBottomSheet(
        context: context,
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Padding(
                padding: EdgeInsets.only(top: 5, left: 20),
                child: Icon(Icons.camera_alt),
              ),
              title: Text(
                'Camera',
                style: TextAppStyle().genaralTextStyle(),
              ),
              onTap: () => Navigator.of(context).pop(ImageSource.camera),
            ),
            ListTile(
              leading: const Padding(
                padding: EdgeInsets.only(top: 5, left: 20),
                child: Icon(Icons.image),
              ),
              title: Text(
                'Gallery',
                style: TextAppStyle().genaralTextStyle(),
              ),
              onTap: () => Navigator.of(context).pop(ImageSource.gallery),
            )
          ],
        ),
      );
    }
  }
}
