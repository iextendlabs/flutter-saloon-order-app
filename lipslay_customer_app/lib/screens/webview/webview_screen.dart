import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class WebviewScreen extends StatefulWidget {
  WebviewScreen({super.key, required this.title, required this.url});

  final String title;
  final String url;

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  final ProgressController _controller = Get.put(ProgressController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: TSizes.fontSizeLg),
        ),
        backgroundColor: TColors.primary,
      ),
      backgroundColor: TColors.primary,
      body: Stack(children: [
        Obx(() => LinearProgressIndicator(
          value: _controller.progress.value,
          minHeight: 4,
          color: TColors.pinkAccent,
        )),
        WebViewWidget(
          controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0x00000000))
            ..setNavigationDelegate(
              NavigationDelegate(
                onProgress: (int progress) {
                  _controller.progress.value = progress / 100;
                  print(progress);
                  // Update loading bar.
                },
              ),
            )
            ..loadRequest(Uri.parse(widget.url)),
        ),
      ]),
    );
  }
}

class ProgressController extends GetxController {
  var progress = 0.0.obs;

  void updateProgress(double value) {
    progress.value = value;
  }

  @override
  void dispose() {
    Get.delete<ProgressController>();
    super.dispose();
  }
}
