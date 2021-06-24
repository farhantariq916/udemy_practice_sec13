import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as systemPaths;
import 'package:path/path.dart' as path;

class ImageInput extends StatefulWidget {
  // const ImageInput({Key? key}) : super(key: key);
  final Function onSelectImage;
  ImageInput({required this.onSelectImage});

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;
  final ImagePicker picker = ImagePicker();
  Future<void>_takePicture() async{
    final imagePickedFile = await picker.getImage(source: ImageSource.camera,maxWidth: 600,);
    if(imagePickedFile==null){
      return;
    }
    final imageFile= File(imagePickedFile.path);

    setState(() {
      _storedImage=imageFile;
    });
    final appDir = await systemPaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage= await imageFile.copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);

  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 180.0,
          height: 100.0,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text('No Image Taken ',textAlign: TextAlign.center,),
          alignment: Alignment.center,
        ),
        SizedBox(width: 10.0,),
        
        Expanded(
          child: FlatButton.icon(

            icon: Icon(Icons.camera),
            label: Text('Take Picture'),
            onPressed: _takePicture,
          ),
        ),
      ],
    );
  }
}
