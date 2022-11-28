import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewViewModel extends ChangeNotifier {
  WebViewController? _controller;
  bool _isError = false;
  int _progress = 100;

  bool get isError => _isError;

  int get progress => _progress;

  void refresh() {
    _isError = false;
    notifyListeners();
    _controller?.reload();
  }

  void setController(WebViewController controller, String url) {
    _controller = controller;
    _controller!.loadUrl(url);
  }

  void error() {
    _isError = true;
    notifyListeners();
  }

  void setProgress(int progress) {
    _progress = progress;
    notifyListeners();
  }
}
