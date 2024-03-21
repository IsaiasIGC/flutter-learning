import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/models/layout_model.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:disenos_app/src/routes/routes.dart';

// import 'package:disenos_app/src/pages/slideshow_page.dart';


class LauncherTabletPage extends StatelessWidget {
  const LauncherTabletPage({super.key});


  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;
    final layoutModel = Provider.of<LayoutModel>(context);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Diseños en Flutter - Tablet'),
        backgroundColor: accentColor,
      ),
      drawer: _MenuPrincipal(),

      body: Row(
        children: <Widget>[
          Container(
            width: 300,
            height: double.infinity,
            child: const _ListaOpciones(),
          ),

          Container(
            width: 10,
            height: double.infinity,
            color: (appTheme.darkTheme) ? Colors.grey : accentColor,
          ),

          Expanded(
            child: layoutModel.currentPage
          )
        ],
      ),
   );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones();

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: ( context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(

        leading: FaIcon(pageRoutes[i].icon, color: appTheme.colorScheme.secondary),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon(Icons.chevron_right, color: appTheme.colorScheme.secondary),
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => pageRoutes[i].page));
          final layoutModel = Provider.of<LayoutModel>(context, listen: false);
          layoutModel.currentPage = pageRoutes[i].page;
        },

      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;

    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
      
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: const Text('IG', style: TextStyle(fontSize: 50, color: Colors.white)),
                ),
              ),
            ),
      
            const Expanded(
              child: _ListaOpciones(),
            ),
      
            ListTile(
              leading: Icon( Icons.lightbulb_outline, color: accentColor),
              title: const Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: accentColor,
                onChanged: (value) => appTheme.darkTheme = value
              ),
            ),
      
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon( Icons.add_to_home_screen, color: accentColor),
                title: const Text('Custom Theme'),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: accentColor,
                  onChanged: (value) => appTheme.customTheme = value
                ),
              ),
            ),
      
          ],
        ),
      ),
    );
  }
}