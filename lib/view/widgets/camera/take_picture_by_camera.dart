import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TakePictureByCamera extends StatefulWidget {
  TakePictureByCamera({Key? key, required this.camera}) : super(key: key);
  final List<CameraDescription>? camera;

  @override
  State<TakePictureByCamera> createState() => _TakePictureByCameraState();
}

class _TakePictureByCameraState extends State<TakePictureByCamera> {
  late CameraController _cameraController;
  bool _isRearCameraSelected = true;

  @override
  void dispose(){
    // Dispose of the controller when the widget is disposed.
    _cameraController.dispose();
    super.dispose();
  }
  @override
  void iniState(){
    super.initState();
    // initialize the rear camera
    initCamara(widget.camera![0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Camera")),
      body: _buildCamera(),
    );
  }

  Widget _buildCamera(){
    return SafeArea(
        child: _cameraController.value.isInitialized ? CameraPreview(_cameraController) : Center(child: CircularProgressIndicator()),
    );
  }
  /*
    @ Initialize camera
  * */
    Future initCamara(CameraDescription cameraDescription) async{
      //Create a Camera Controller
      _cameraController = CameraController(cameraDescription, ResolutionPreset.high);
     /*
        @ Next, initialize the controller. This returns a Future.
     * */
      try{
        await _cameraController.initialize().then((_){
            if (!mounted) return;
            setState((){});
        });
      }on CameraException catch (e){
            debugPrint("camera error $e");
      }
    }
}
