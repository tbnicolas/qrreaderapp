import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:qrreaderapp/src/model/scan_model.dart';
import 'package:qrreaderapp/src/pages/direcciones_page.dart';
import 'package:qrreaderapp/src/pages/mapas_page.dart';
import 'package:qrreaderapp/src/providers/db_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('QR Scanner'),
        centerTitle: true,
        actions: [
          new IconButton(
            icon: new Icon(Icons.delete_forever),
            onPressed: () {},
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.filter_center_focus), onPressed: _scanQR),
    );
  }

  _scanQR() async {
    //https://www.youtube.com/c/LaResistenciaCero
    // geo:40.7804103679727,-73.97298231562503
   // dynamic futureString = '';
    dynamic futureString = 'https://www.youtube.com/c/LaResistenciaCero';
    
   /*  try {
      futureString = await BarcodeScanner.scan();
    } catch (e) {
      futureString = e.toString();
    }

    print('Future String: ${futureString.rawContent}'); */

    if(futureString != null){
      print('Entro!');
      final scan = ScanModel(valor: futureString);
      DBProvider.db.nuevoScan(scan);
    }
  }

  Widget _crearBottomNavigationBar() {
    return new BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        new BottomNavigationBarItem(
            icon: new Icon(Icons.map), title: new Text('Mapas')),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.brightness_5), title: new Text('Direcciones')),
      ],
    );
  }

  Widget _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return new MapasPage();
      case 1:
        return new DireccionesPage();

        break;
      default:
        return MapasPage();
    }
  }
}
