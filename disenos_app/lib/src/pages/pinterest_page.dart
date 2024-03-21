import 'package:disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:disenos_app/src/widgets/pinterest_menu.dart';


class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            const PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
         ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  double widthPantalla = MediaQuery.of(context).size.width;
  final mostrar = Provider.of<_MenuModel>(context).mostrar;
  final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

  if ( widthPantalla > 500 ) {
    widthPantalla = widthPantalla - 300;
  }

  return Positioned(
      bottom: 30,
      child: Container(
        width: widthPantalla,
        child: Align(
          child: PinterestMenu(
            mostrar: mostrar,
            backgroundColor: appTheme.scaffoldBackgroundColor,
            activeColor: appTheme.colorScheme.secondary,
            inactiveColor: Colors.blueGrey,
            items: [
              PinterestButton(icon: Icons.pie_chart, onPressed: () { print('Icon pie_chart');}),
              PinterestButton(icon: Icons.search, onPressed: () { print('Icon search');}),
              PinterestButton(icon: Icons.notifications, onPressed: () { print('Icon notifications');}),
              PinterestButton(icon: Icons.supervised_user_circle, onPressed: () { print('Icon supervised_user_circle');}),
            ],
          ),
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {

  ScrollController controller = ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {

    controller.addListener(() {

      if ( controller.offset > scrollAnterior && controller.offset > 150 ) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }

      scrollAnterior = controller.offset;

    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    int count;
    if ( MediaQuery.of(context).size.width > 500 ) {
      count = 9;
    } else {
      count = 2;
    }

    return SingleChildScrollView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: StaggeredGrid.count(
          crossAxisCount: count,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          children: List.generate(
            200,
            (index) => _PinterestItem(index),
          ),
        ),
      ),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem(this.index);
  
  @override
  Widget build(BuildContext context) {

    int count;
    if ( MediaQuery.of(context).size.width > 500 ) {
      count = 3;
    } else {
      count = 1;
    }

    int mainCount;
    if ( MediaQuery.of(context).size.width > 500 ) {
      mainCount = index.isEven ? 3 : 5;
    } else {
      mainCount = index.isEven ? 1 : 2;
    }

    return StaggeredGridTile.count(
      crossAxisCellCount: count,
      mainAxisCellCount: mainCount,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.blue,
        ),
        margin: const EdgeInsets.all(5),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('$index', style: const TextStyle(color: Colors.black)),
          ),
        ),
      ),
    );
  }

}


class _MenuModel with ChangeNotifier {

  bool _mostrar = true;

  bool get mostrar => _mostrar;

  set mostrar( bool valor ) {
    _mostrar = valor;
    notifyListeners();
  }

}