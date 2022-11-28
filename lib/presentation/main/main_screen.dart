import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../ui/service_colors.dart';
import '../common/seodaang_title.dart';
import 'main_view_model.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();

    viewModel.init(context);

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor:
            Theme.of(context).extension<ServiceColors>()!.backgroundGrey,
        appBar: AppBar(
          centerTitle: false,
          title: _buildContent(viewModel, context),
          toolbarHeight: 191.5,
          titleSpacing: 40,
          elevation: 0,
          backgroundColor: Theme.of(context).extension<ServiceColors>()!.white,
          foregroundColor:
              Theme.of(context).extension<ServiceColors>()!.textBlack,
          automaticallyImplyLeading: false,
        ),
        body: _buildIndexedStack(viewModel),
        bottomNavigationBar: _buildBottomNavigationBar(context, viewModel),
      ),
    );
  }

  Widget _buildIndexedStack(MainViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.fromLTRB(40, 40, 40, 0),
      child: IndexedStack(
        index: viewModel.state.nowPageIndex,
        children: viewModel.pages,
      ),
    );
  }

  Widget _buildBottomNavigationBar(
      BuildContext context, MainViewModel viewModel) {
    return SizedBox(
      height: 80,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor:
            Theme.of(context).extension<ServiceColors>()!.textBlack,
        unselectedItemColor:
            Theme.of(context).extension<ServiceColors>()!.secondaryTextGrey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: viewModel.state.nowBottomBarIndex,
        backgroundColor: Theme.of(context).extension<ServiceColors>()!.white,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: (index) => viewModel.setBottomBarIndex(context, index),
        items: List.generate(
          viewModel.bottomPageNames.length,
          (index) => BottomNavigationBarItem(
            icon: SvgPicture.asset(
              key: viewModel.globalKeys[index],
              viewModel.bottomPageIconPaths[index],
              width: 30,
            ),
            activeIcon: SvgPicture.asset(
              key: viewModel.globalKeys[index],
              viewModel.bottomPageActiveIconPaths[index],
              width: 30,
            ),
            label: viewModel.bottomPageNames[index],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(MainViewModel viewModel, BuildContext context) {
    final subPages = viewModel.getSubPageNames();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (viewModel.getSubPageNames().length > 1) const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SeodaangTitle(viewModel.pageTitles[viewModel.state.nowPageIndex]),
          ],
        ),
        if (subPages.length > 1) const SizedBox(height: 20),
        if (subPages.length > 1)
          Wrap(
            spacing: 12.5,
            children: List.generate(
              subPages.length,
              (i) => _buildButton(viewModel.getSubPageIndex() == i, subPages[i],
                  () {
                viewModel.setSubPageIndex(
                    context, viewModel.state.nowBottomBarIndex, i);
              }, context),
            ),
          ),
      ],
    );
  }

  Widget _buildButton(
      bool chosen, String text, Function() onClick, BuildContext context) {
    Color color = chosen
        ? Theme.of(context).extension<ServiceColors>()!.buttonPrimary!
        : Theme.of(context).extension<ServiceColors>()!.white!;
    Color borderColor = chosen
        ? Theme.of(context).extension<ServiceColors>()!.buttonPrimary!
        : Theme.of(context).extension<ServiceColors>()!.borderGrey!;

    return GestureDetector(
      onTap: onClick,
      child: AnimatedContainer(
        height: 45,
        width: 125,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor,
            width: 1.5,
          ),
        ),
        duration: const Duration(milliseconds: 200),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: chosen ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
