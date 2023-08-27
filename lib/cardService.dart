

import 'package:flutter/material.dart';
import 'package:prueba/carObra.dart';
import 'package:prueba/main.dart';
import 'package:prueba/miperfil.dart';
import 'package:prueba/servicio.dart';



class cardService extends StatelessWidget{
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        leading: IconButton(
          icon: Icon(Icons.menu,
          color: Colors.black
          ),
          onPressed: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.closeDrawer();
            }else{
              scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
      ),
      drawer: Drawer(
        child: ListView (

          padding: EdgeInsets.zero,
          children: <Widget> [
          DrawerHeader(
              child:Container(
                height: 110,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://i.imgur.com/knxT0t0.png", ),
                    
                    fit: BoxFit.contain, 
                  )
                ),
              ),
              
            ),
            ListTile(
              leading: Icon(Icons.person_2_outlined),
              title: Text('Mi perfil'),
              
              onTap: () {
                Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MiPerfil(title: "Mi perfil",)));
              }
            ),
            ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text('Citas'),
              onTap: () {
                Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) =>
                                   cardService()));
              },
            ),
            ListTile(
              leading: Icon(Icons.build),
              title: Text('Obras y tiempos'),
              onTap: () {
                Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  cardObra()));
              },
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text('Cerrar sesión'),
              onTap: (){
                (Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const HomePageApp(title: "Pagina de inicio",))));
              },
            )
            
          ],
        ),
      ),
      
      body: Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget> [
            const ListTile(
              leading: Icon(Icons.album, color: Colors.green,),
              title: Text("Ronald Ortiz Arango"),
              subtitle: Text("16/01/2024\n Estucado y pintado"),
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget> [
                TextButton.icon( icon: Icon(Icons.calendar_month), label: Text.rich(TextSpan(children: <InlineSpan>[WidgetSpan(child: Text("Editar"))])), onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    const ServicioPage(title: "Servicio Page"))); },),
                TextButton.icon( icon: Icon(Icons.cancel), label: Text.rich(TextSpan(children: <InlineSpan>[WidgetSpan(child: Text("Eliminar"))])), onPressed: () {  },),
              ]
          ),
          ]
        )
      ),
      ),floatingActionButton: bottom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, 
      );
  }
}

class bottom extends StatelessWidget{
  const bottom({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(width: 16),

                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    const ServicioPage(title: "Servicio Page")));
                  },
                  label: const Text('Agendar'),
                  icon: const Icon(Icons.add),
                ),
              ],
            );
  }
}