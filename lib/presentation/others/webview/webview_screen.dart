import "package:flutter/material.dart";
import 'package:im_application/presentation/others/webview/webview_view_model.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../ui/service_colors.dart';
import '../../common/empty_result.dart';
import '../../common/page_header_navigator.dart';

class WebViewScreen extends StatelessWidget {
  final String title;
  final String url;

  const WebViewScreen({Key? key, required this.title, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WebViewViewModel>();

    return Scaffold(
      backgroundColor: Theme.of(context).extension<ServiceColors>()!.white,
      body: SafeArea(
        child: Column(
          children: [
            PageHeaderNavigator(
              buttons: [
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    viewModel.refresh();
                  },
                ),
              ],
              title: title,
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    color: Theme.of(context).extension<ServiceColors>()!.white,
                    child: viewModel.isError
                        ? EmptyResult(
                            title: "정보를 불러올 수 없습니다.",
                            buttonText: "다시 시도하기",
                            onTap: () {
                              viewModel.refresh();
                            },
                          )
                        : WebView(
                            javascriptMode: JavascriptMode.unrestricted,
                            zoomEnabled: false,
                            onProgress: (progress) {
                              viewModel.setProgress(progress);
                            },
                            onWebViewCreated: (controller) {
                              viewModel.setController(controller, url);
                            },
                            onWebResourceError: (error) {
                              viewModel.error();
                            },
                          ),
                  ),
                  LinearProgressIndicator(
                    value:
                    viewModel.progress < 100 ? viewModel.progress / 100 : 0,
                    backgroundColor: Colors.transparent,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
