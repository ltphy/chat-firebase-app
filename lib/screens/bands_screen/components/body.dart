import 'package:chat_app_firebase/screens/bands_screen/models/band_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instanc,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          List<BandInfo> bandInfos =
              BandInfo.getBandInfos(snapshot.data.documents);
          return Container(
              child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 4,
                child: ListTile(
                  title: Text(bandInfos[index].name,
                      style: Theme.of(context).textTheme.headline5),
                  trailing: Container(
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(bandInfos[index].votes.toString(),
                            style: Theme.of(context).textTheme.bodyText1),
                      )),
                ),
              );
            },
            itemCount: bandInfos.length,
          ));
        }
        return CircularProgressIndicator();
      },
    );
  }
}
