import "package:flutter/material.dart";
import "package:im_application/presentation/setting/setting_view_model.dart";
import "package:provider/provider.dart";

import "../../ui/service_assets.dart";

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SettingViewModel>();

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(viewModel.menuTitles[index]),
                    ],
                  ),
                ),
                onTap: () {
                  viewModel.menuActions[index].call(context);
                },
              );
            },
            separatorBuilder: (context, index) => const Divider(height: 0),
            itemCount: viewModel.menuTitles.length,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ),
        GestureDetector(
          onTap: () {
            viewModel.touchBanner(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Image.asset(
              ServiceAssets.banner,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ],
    );
  }
}
