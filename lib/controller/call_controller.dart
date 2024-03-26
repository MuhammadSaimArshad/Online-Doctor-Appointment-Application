import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';

class CallController extends GetxController {
  static CallController get to => Get.find();
  RTCVideoRenderer localRenderer = RTCVideoRenderer();
  RTCVideoRenderer remoteRenderer = RTCVideoRenderer();
  bool ismute = false;

  initilizeRTcREneders() {
    localRenderer.initialize();
    remoteRenderer.initialize();
    update();
  }

  dispozeRtcRenders() {
    localRenderer.dispose();
    remoteRenderer.dispose();
    update();
  }

  changeMuteStatus(bool value) {
    ismute = value;
    update();
  }
}
