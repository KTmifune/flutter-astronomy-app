import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    FaIcon(
      FontAwesomeIcons.satelliteDish,
      size: 150,
    ),
    FaIcon(
      FontAwesomeIcons.rocket,
      size: 150,
    ),
    FaIcon(
      FontAwesomeIcons.star,
      size: 150,
    ),
  ];

  final List<TabModel> _tabs = [
    TabModel(
        id: 1,
        defaultIcon: const FaIcon(
          FontAwesomeIcons.satellite,
          size: 30,
          color: Colors.grey,
        ),
        activeIcon: const FaIcon(
          FontAwesomeIcons.satelliteDish,
          size: 30,
          color: Colors.indigo,
        ),
        name: "今日"),
    TabModel(
        id: 2,
        defaultIcon: const FaIcon(
          FontAwesomeIcons.shuttleSpace,
          size: 30,
          color: Colors.grey,
        ),
        activeIcon: const FaIcon(
          FontAwesomeIcons.rocket,
          size: 30,
          color: Colors.indigo,
        ),
        name: "探す"),
    TabModel(
        id: 3,
        defaultIcon: const FaIcon(
          FontAwesomeIcons.star,
          size: 30,
          color: Colors.grey,
        ),
        activeIcon: const FaIcon(
          FontAwesomeIcons.starOfDavid,
          size: 30,
          color: Colors.indigo,
        ),
        name: "お気に入り"),
  ];

  void _onBottomIconTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  SizedBox navigationBar() {
    return SizedBox(
      height: 80.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < _tabs.length; i++)
            GestureDetector(
              onTap: () => setState(() => _selectedIndex = i),
              child: iconBtn(i),
            ),
        ],
      ),
    );
  }

  SizedBox iconBtn(int i) {
    bool isActive = _selectedIndex == i ? true : false;
    var width = isActive ? 50.0 : 0.0;
    return SizedBox(
      width: 75.0,
      child: Column(
        children: [
          AnimatedContainer(
            height: 5,
            width: width,
            duration: const Duration(milliseconds: 150),
            child: isActive
                ? Container(
                    decoration: const BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  )
                : const SizedBox(),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              child: isActive ? _tabs[i].activeIcon : _tabs[i].defaultIcon),
          const SizedBox(
            height: 5,
          ),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 100),
            curve: Curves.bounceInOut,
            style: isActive
                ? const TextStyle(
                    color: Colors.indigo,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  )
                : const TextStyle(color: Colors.grey, fontSize: 12),
            child: Text(_tabs[i].name),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      // bottomNavigationBar: SizedBox(
      //   height: 78,
      //   child: BottomNavigationBar(
      //     selectedFontSize: 18,
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: FaIcon(FontAwesomeIcons.satelliteDish),
      //         activeIcon: FaIcon(FontAwesomeIcons.satellite),
      //         label: 'Today',
      //       ),
      //       BottomNavigationBarItem(
      //           icon: FaIcon(FontAwesomeIcons.shuttleSpace),
      //           activeIcon: FaIcon(FontAwesomeIcons.rocket),
      //           label: 'Daily'),
      //       BottomNavigationBarItem(
      //           icon: FaIcon(FontAwesomeIcons.star),
      //           activeIcon: FaIcon(FontAwesomeIcons.starOfDavid),
      //           label: 'Favorite'),
      //     ],
      //     currentIndex: _selectedIndex,
      //     onTap: _onBottomIconTapped,
      //   ),
      // ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: navigationBar(),
          )
        ],
        //child: _pages.elementAt(_selectedIndex),
      ),
    );
  }
}

class TabModel {
  final int id;
  final FaIcon defaultIcon;
  final FaIcon activeIcon;
  final String name;

  TabModel({
    required this.id,
    required this.defaultIcon,
    required this.activeIcon,
    required this.name,
  });
}
