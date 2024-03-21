import 'package:disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
 
class SliverListPage extends StatelessWidget {
  const SliverListPage({super.key});

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: _Titulo()
      //body: _ListaTareas()
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _BotonNuevaLista()
            
          ),
 
        ],
      )
   );
  }
}
 
class _BotonNuevaLista extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
 
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);
 
    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      child: MaterialButton(
        onPressed: (){},
        color: ( appTheme.darkTheme ) ? appTheme.currentTheme.colorScheme.secondary :const Color(0xffED6762),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only( topLeft: Radius.circular(10))
        ),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: appTheme.currentTheme.scaffoldBackgroundColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}
 
class _MainScroll extends StatelessWidget {
  
  final items = const [
   _ListItem( color: Color(0xffF08F66), titulo: 'Orange' ),
   _ListItem( color: Color(0xffF2A38A), titulo: 'Family',  ),
   _ListItem( color: Color(0xffF7CDD5), titulo: 'Subscriptions', ),
   _ListItem( color: Color(0xffFCEBAF), titulo: 'Books', ),
   _ListItem( color: Color(0xffF08F66), titulo: 'Orange',  ),
   _ListItem( color: Color(0xffF2A38A), titulo: 'Family',  ),
   _ListItem( color: Color(0xffF7CDD5), titulo: 'Subscriptions',  ),
   _ListItem( color: Color(0xffFCEBAF), titulo: 'Books',  ),
   _ListItem( color: Color(0xffF08F66), titulo: 'Orange' ),
   _ListItem( color: Color(0xffF2A38A), titulo: 'Family',  ),
   _ListItem( color: Color(0xffF7CDD5), titulo: 'Subscriptions', ),
   _ListItem( color: Color(0xffFCEBAF), titulo: 'Books', ),
   _ListItem( color: Color(0xffF08F66), titulo: 'Orange',  ),
   _ListItem( color: Color(0xffF2A38A), titulo: 'Family',  ),
   _ListItem( color: Color(0xffF7CDD5), titulo: 'Subscriptions',  ),
   _ListItem( color: Color(0xffFCEBAF), titulo: 'Books',  ),
 ];
 
  @override
  Widget build(BuildContext context) {
 
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
 
    return CustomScrollView(
      slivers: [
 
        //SliverAppBar(
        //  floating: true,
        //  elevation: 0,
        //  backgroundColor: Colors.red,
        //  title: Text('Hola Mundo'),
        //),
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minheight: 170,
            maxheight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: appTheme.scaffoldBackgroundColor,
              child: _Titulo(),
            )
          )
        ),
 
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            const SizedBox( height: 100 ),
          ])
        )
      ],
    );
  }
}
 
class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
 
  final double minheight;
  final double maxheight;
  final Widget child;
 
  _SliverCustomHeaderDelegate({
    required this.minheight, 
    required this.maxheight, 
    required this.child,
  });
 
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand( child: child );
  }
 
  @override
  double get maxExtent => maxheight;
 
  @override
  double get minExtent => minheight;
 
  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
           minheight != oldDelegate.minheight ||
           child     != oldDelegate.child;
  }
}
 
class _Titulo extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
 
    final appTheme = Provider.of<ThemeChanger>(context);
 
    return Column(
      children: [
        const SizedBox( height: 30 ),
        Container(
          margin: const EdgeInsets.symmetric( horizontal: 30, vertical: 10 ),
          child: Text('New', 
            style: TextStyle( 
              //color: Color(0xff532128),
              color: ( appTheme.darkTheme ) ? Colors.grey : const Color(0xff532128), 
              fontSize: 50 )
            ),
        ),
 
        Stack(
          children: [
            const SizedBox( width: 100 ),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                //color: Color(0xffF7CDD5),
                color: ( appTheme.darkTheme ) ? Colors.grey : const Color(0xffF7CDD5),
              ),
            ),
 
            Container(
              child: const Text('List', style: TextStyle( color: Color(0xffD93A30), fontSize: 50, fontWeight: FontWeight.bold ),),
            ),
 
            
          ],
        )
      ],
    );
  }
}
 
class _ListaTareas extends StatelessWidget {
 
 final items = const [
   _ListItem( color: Color(0xffF08F66), titulo: 'Orange' ),
   _ListItem( color: Color(0xffF2A38A), titulo: 'Family',  ),
   _ListItem( color: Color(0xffF7CDD5), titulo: 'Subscriptions', ),
   _ListItem( color: Color(0xffFCEBAF), titulo: 'Books', ),
   _ListItem( color: Color(0xffF08F66), titulo: 'Orange',  ),
   _ListItem( color: Color(0xffF2A38A), titulo: 'Family',  ),
   _ListItem( color: Color(0xffF7CDD5), titulo: 'Subscriptions',  ),
   _ListItem( color: Color(0xffFCEBAF), titulo: 'Books',  ),
 ];
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index] );
  }
}
 
class _ListItem extends StatefulWidget {
 
  final String titulo;
  final Color color;
  const _ListItem({
    required this.color,
    required this.titulo,
  });
 
  @override
  State<_ListItem> createState() => _ListItemState();
}
 
class _ListItemState extends State<_ListItem> {
  @override
  Widget build(BuildContext context) {
 
    final appTheme = Provider.of<ThemeChanger>(context);
 
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      height: 130,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ( appTheme.darkTheme ) ? Colors.deepPurple.shade300 : widget.color,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Text(
        widget.titulo, 
        style: const TextStyle( 
          color: Colors.white,
          fontWeight: FontWeight.bold, 
          fontSize: 20 )
      ),
    );
  }
}