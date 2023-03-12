import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/presentation/main/pages/home/view/home_page_view.dart';
import 'package:shop_app_mvvm/presentation/main/pages/notification/view/notification_page.dart';
import 'package:shop_app_mvvm/presentation/main/pages/search/view/search_page.dart';
import 'package:shop_app_mvvm/presentation/main/pages/settings/view/settings_page.dart';
import 'package:shop_app_mvvm/presentation/resources/color_manger.dart';
import 'package:shop_app_mvvm/presentation/resources/strings_manager.dart';
import 'package:shop_app_mvvm/presentation/resources/values_manager.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = [
    const HomePageView(),
    const SearchPage(),
    const NotificationPage(),
    const SettingsPage()
  ];
  List<String> titles = [
    AppStrings.home,
    AppStrings.search,
    AppStrings.notifications,
    AppStrings.settings,
  ];

  String _title = AppStrings.home;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorManager.lightGrey,
              spreadRadius: AppSize.s1,
            )
          ],
        ),
        child: BottomNavigationBar(
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.grey,
          currentIndex: _currentIndex,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: AppStrings.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: AppStrings.search,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
              ),
              label: AppStrings.notifications,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: AppStrings.settings,
            ),
          ],
        ),
      ),
    );
  }

  onTap(int index) {
    setState(() {
      _currentIndex = index;
      _title = titles[index];
    });
  }
}
