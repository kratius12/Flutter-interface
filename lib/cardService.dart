

import 'package:flutter/material.dart';
import 'package:prueba/carObra.dart';
import 'package:prueba/databasehelper.dart';
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
        backgroundColor: Theme.of(context).shadowColor,
        title: Text("Citas agendadas"),
        leading: IconButton(
          icon: Icon(Icons.menu,
          color: Colors.white
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
      
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder(
          future: DatabaseHelper.getServices(),
          builder: (context, snapshot){
            if(snapshot.connectionState != ConnectionState.done){
              return CircularProgressIndicator();
            }
            List<Servicios>? servicio = snapshot.data as List<Servicios>?;
            Widget list;
            if(servicio==null || servicio.isEmpty){
              list= Text("No Hay ninguna cita agendada");
            }else{
              list= ListView.builder(
                  itemCount: servicio.length,
                  itemBuilder: (context, index){
                    var s = servicio[index]; 
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              
                                child: Icon(Icons.album, color: Colors.green,),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(s.nombre+" "+s.apellido),
                                Text(s.fecha),
                                Text(s.tipoServ),
                              ],
                            ),Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton.icon(icon: Icon(Icons.calendar_month), label: Text.rich(TextSpan(children: <InlineSpan>[WidgetSpan(child: Text("Editar"))])), onPressed:(){;
                                } ,),
                                TextButton.icon(icon: Icon(Icons.cancel), label: Text.rich(TextSpan(children: <InlineSpan>[WidgetSpan(child: Text("Eliminar"))])), onPressed:(){
                                } ,)
                              ],
                            )
                          ]),
                      ),
                    );
                  },
                );
            }
            return Center(
              child: SizedBox(
                width: 350,
                child: list
            ));
          },
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