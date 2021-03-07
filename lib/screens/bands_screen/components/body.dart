import 'package:chat_app_firebase/screens/bands_screen/components/band_detail_info/band_detail_info.dart';
import 'package:chat_app_firebase/screens/bands_screen/models/band_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Query query = FirebaseFirestore.instance.collection('bandnames');
    return StreamBuilder<QuerySnapshot>(
      // access firebase with collection
      stream: query.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> stream) {
        if (stream.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (stream.hasError) {
          return Center(child: Text(stream.hasError.toString()));
        }
        print(stream.hasData);
        QuerySnapshot querySnapShot = stream.data;
        return Container(
            child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return BandDetailInfo(documentSnapshot: querySnapShot.docs[index]);
          },
          itemCount: querySnapShot.docs.length,
        ));
      },
    );
  }
}
