import "package:flutter/material.dart";

import '../../../oss_licenses.dart';
import '../../../ui/service_colors.dart';
import '../../common/page_header_navigator.dart';
import 'lisence_detail_screen.dart';

class LicenseScreen extends StatelessWidget {
  const LicenseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    List<Package> showingLicenses = List.from(ossLicenses);
    showingLicenses.sort((a, b) {
      if (a.isDirectDependency != b.isDirectDependency) {
        return (a.isDirectDependency ? -1 : 1);
      } else {
        return a.name.compareTo(b.name);
      }
    });

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
                child: ListView.separated(
                  controller: controller,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => _generateListItem(
                    context,
                    showingLicenses[index],
                    (package) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LicenseDetailScreen(package),
                        ),
                      );
                    },
                  ),
                  itemCount: showingLicenses.length,
                  separatorBuilder: (context, index) => const Divider(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _generateListItem(
      BuildContext context, Package package, Function(Package) onTap) {
    return ListTile(
      title: Text(package.name),
      subtitle: Text(
        package.description,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: package.isDirectDependency
          ? Text(
              "Direct Dependency",
              style: TextStyle(
                color:
                    Theme.of(context).extension<ServiceColors>()!.buttonPrimary,
                fontWeight: FontWeight.bold,
              ),
            )
          : null,
      onTap: () {
        onTap.call(package);
      },
    );
  }
}
