import "package:flutter/material.dart";
import 'package:im_application/oss_licenses.dart';

import '../../../ui/service_colors.dart';
import '../../common/page_header_navigator.dart';
import '../../common/seodaang_title.dart';
import '../webview/webview_screen.dart';

class LicenseDetailScreen extends StatelessWidget {
  final Package package;

  const LicenseDetailScreen(this.package, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    final width = MediaQuery.of(context).size.width;
    final url = package.repository ?? (package.homepage ?? "");

    return Scaffold(
      backgroundColor: Theme.of(context).extension<ServiceColors>()!.white,
      body: SafeArea(
        child: Column(
          children: [
            const PageHeaderNavigator(
              title: "오픈소스 라이선스",
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).extension<ServiceColors>()!.white,
                child: SingleChildScrollView(
                  controller: controller,
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (package.isDirectDependency)
                          Text(
                            "Direct Dependency",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .extension<ServiceColors>()!
                                  .buttonPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        SeodaangTitle(package.name, isMini: true),
                        Text("version: ${package.version}"),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          width: width,
                          child: Text(package.description),
                        ),
                        GestureDetector(
                          child: Text(
                            url,
                            style: const TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => WebViewScreen(
                                  title: "오픈소스 라이선스",
                                  url: url,
                                ),
                              ),
                            );
                          },
                        ),
                        Divider(
                          height: 50.0,
                          color: Theme.of(context)
                              .extension<ServiceColors>()!
                              .buttonBorderGrey,
                        ),
                        SizedBox(
                          width: width,
                          child: Text(package.license ?? ""),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
