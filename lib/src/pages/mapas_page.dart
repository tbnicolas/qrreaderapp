import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/providers/db_provider.dart';

class MapasPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder <List<ScanModel>>(
      future: DBProvider.db.getTodosScans(),
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        //print(snapshot.data.length);
        if (!snapshot.hasData){
          return new Center(
            child: new CircularProgressIndicator(),
          );
        }
        final scans = snapshot.data;
        if(scans.length == 0){
          return  new Center(
            child: new Text('No hay informacion'),
          );
        }
        return ListView.builder(
          itemCount: scans.length, 
          itemBuilder: (context, i) => new Dismissible(
            key: UniqueKey(),
            direction:DismissDirection.endToStart ,
            background: new Container(
              color: Colors.red,
              padding: EdgeInsets.only(right: 15),
              alignment: Alignment.centerRight,
              child: new Icon(Icons.delete_forever, color: Colors.white,size:30 ,),
            ),
            onDismissed: (direction) => DBProvider.db.deleteScan(scans[i].id),
            child: new ListTile(
              leading: new Icon(Icons.cloud_queue, color: Theme.of(context).primaryColor ,),
              title: new Text(scans[i].valor),
              subtitle: new Text('ID: ${scans[i].id}'),
              trailing: new Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
            ),
          ),
        );
      },

    );
  }
}