import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turbo_coone1/views/drawer/app_drawer.dart';
import 'package:turbo_coone1/views/screens/favoriteScreen.dart';
import 'package:turbo_coone1/views/screens/fixtures_screen.dart';
import 'package:turbo_coone1/views/screens/news_screen.dart';
import 'package:turbo_coone1/views/screens/standingsScreen.dart';
import 'package:turbo_coone1/views/screens/video_screen.dart';
import '/consts/consts.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({
    Key? key,
    this.page = 0,
  }) : super(key: key);
  final int page;

  @override
  ParentScreenState createState() => ParentScreenState();
}

class ParentScreenState extends State<ParentScreen> {
  //AuthController authController = Get.find();
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = widget.page;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.parentBackground,
        title: Image.asset(
          AppAssets.textlogo,
          height: AppSizes.newSize(3.6),
        ),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        actions: [
          InkWell(
            onTap: () async {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageIcon(
                const AssetImage(AppAssets.drawer),
                color: Colors.black,
                size: AppSizes.size22,
              ),
            ),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      drawer: const AppDrawer(),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          FixtureScreen(),
          FavouriteScreen(),
          VideoScreen(),
          NewsScreen(),
          StandingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.navbarColor,
        selectedItemColor: AppColors.navbarSelectedColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
            fontSize: AppSizes.size13,
            color: Colors.white,
            fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(
          fontSize: AppSizes.size12,
          color: Colors.white.withOpacity(.8),
        ),
        unselectedItemColor: Colors.white.withOpacity(.7),
        type: BottomNavigationBarType.fixed,
        items: [
          bottomNavBarItem(AppAssets.fixture, 'FIXTURE'),
          bottomNavBarItem(AppAssets.favorite, 'FAVORITE'),
          bottomNavBarItem(AppAssets.video, 'VIDEO'),
          bottomNavBarItem(AppAssets.news, 'NEWS'),
          bottomNavBarItem(AppAssets.standing, 'STANDINGS'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem bottomNavBarItem(String image, String label) {
    return BottomNavigationBarItem(
      activeIcon: Builder(builder: (context) {
        return Image.asset(
          image,
          color: AppColors.navbarSelectedColor,
          height: 24,
          width: 24,
        );
      }),
      icon: Builder(builder: (context) {
        return Image.asset(
          image,
          height: 21,
          width: 21,
          color: Colors.white,
        );
      }),
      label: label,
    );
  }
}
