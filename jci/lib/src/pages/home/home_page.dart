import 'package:flutter/material.dart';
import '../../models/MenuChoice.dart';
import '../../models/MenuModel.dart';
import '../../utils/AppColors.dart';
import '../../utils/AskForConfirmToLogout.dart';
import '../../utils/Constants.dart';
import '../../utils/Loading.dart';
import '../clean/clean_page.dart';
import '../dirty/dirty_page.dart';
import '../sterile/sterile_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  String _test = "";

  @override
  State<HomePage> createState() => _HomePageState();
}

const List<MenuChoice> choices = const <MenuChoice>[
  const MenuChoice(
      title: '${Constants.TEXT_PROFILE}',
      icon: Icons.person_outlined,
      key: "PROFILE"),
  const MenuChoice(
      title: '${Constants.TEXT_SETTING}',
      icon: Icons.settings_outlined,
      key: "SETTING"),
  const MenuChoice(
      title: '${Constants.TEXT_LOGOUT}',
      icon: Icons.logout_outlined,
      key: "LOGOUT")
];

class _HomePageState extends State<HomePage> {
  void _select(MenuChoice choice) {
    switch (choice.key) {
      case "SETTING":
        {
          break;
        }
      case "LOGOUT":
        {
          askForConfirmToLogout(context);
          break;
        }
    }
  }

  @override
  void initState() {
    // loading();
    // getFullName();
    getMachine();
    super.initState();
  }

  Future<void> getMachine() async {
    await generateMenu();
    if (this.mounted) {
      setState(() {});
    }
  }

  List<MenuModel> menuList = [];

  Future<void> generateMenu() async {
    menuList.clear();
    var _menu = <MenuModel>[
      MenuModel(
        name: "${Constants.STERILE_TITLE}",
        subName: "${Constants.STERILE_SUBTITLE}",
        route: SterilePage(),
        color: [AppColors.COLOR_GREEN2, AppColors.COLOR_GREEN],
        imgName: "home_sterile.png",
        isShow: true,
      ),
      MenuModel(
        name: "${Constants.DIRTY_TITLE}",
        subName: "${Constants.DIRTY_SUBTITLE}",
        route: DirtyPage(),
        color: [AppColors.COLOR_RED2, AppColors.COLOR_RED],
        imgName: "home_dirty.png",
        isShow: true,
      ),
      MenuModel(
        name: "${Constants.CLEAN_TITLE}",
        subName: "${Constants.CLEAN_SUBTITLE}",
        route: CleanPage(),
        color: [AppColors.COLOR_SECONDARY, AppColors.COLOR_PRIMARY],
        imgName: "home_clean.png",
        isShow: true,
      ),
    ];

    _menu.map((menu) {
      if (menu.isShow) {
        menuList.add(menu);
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('${Constants.IMAGE_DIR}/bg_login.png'),
                fit: BoxFit.cover),
          ),
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: 30, bottom: 30),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: _buildMenu(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    Constants.APP_TITLE,
                    style: TextStyle(
                        fontSize: 30,
                        color: AppColors.COLOR_DARK,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2),
                    // overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${menuList.length} Toolbars",
                    style: TextStyle(fontSize: 16, color: Colors.black45),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: PopupMenuButton(
              child: Icon(
                Icons.more_vert_outlined,
                size: 30,
              ),
              onSelected: _select,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              itemBuilder: (context) {
                return choices.map((MenuChoice choice) {
                  return PopupMenuItem<MenuChoice>(
                    value: choice,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          choice.icon,
                          color: choice.key == "LOGOUT"
                              ? AppColors.COLOR_RED
                              : AppColors.COLOR_DARK,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            choice.title,
                            style: TextStyle(
                                fontSize: 16,
                                color: choice.key == "LOGOUT"
                                    ? AppColors.COLOR_RED
                                    : AppColors.COLOR_DARK),
                          ),
                        )
                      ],
                    ),
                  );
                }).toList();
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenu() {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3.25;
    final double itemWidth = size.width / 2;
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (itemWidth / itemHeight),
        padding: EdgeInsets.all(0),
        mainAxisSpacing: 20,
        crossAxisSpacing: 15,
        controller: ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: List.generate(menuList.length, (index) {
          String _menuName = menuList[index].name;
          String _subName = menuList[index].subName;
          String _imgName = menuList[index].imgName;
          Widget _route = menuList[index].route;
          bool _isShow = menuList[index].isShow;
          List<Color> _color = menuList[index].color;
          // print(_color);
          return Visibility(
            visible: true,
            child: _buildMenuCard(
                menuName: "$_menuName",
                subName: "$_subName",
                imageName: "$_imgName",
                page: _route,
                color: _color),
          );
        }),
      ),
    );
  }

  Widget _buildMenuCard(
      {required String menuName,
      required String subName,
      required String imageName,
      required Widget page,
      required List<Color> color}) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: color,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(20),
          color: AppColors.COLOR_GREY),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => _menuRoute(page: page),
        child: Container(
          height: double.maxFinite,
          padding: EdgeInsets.only(left: 12, top: 14, right: 10, bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "${Constants.IMAGE_DIR}/$imageName",
                width: 46,
                height: 46,
              ),
              Expanded(child: SizedBox(height: 20)),
              Wrap(
                children: [
                  Text(
                    "$menuName",
                    style: TextStyle(
                        fontSize: 22,
                        color: AppColors.COLOR_WHITE,
                        fontWeight: FontWeight.w500),
                    // textAlign: TextAlign.start,
                  ),
                  Text(
                    "$subName",
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.COLOR_WHITE,
                        fontWeight: FontWeight.w500),
                    // textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _menuRoute({required Widget page}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    ).then((value) {});
  }
}
