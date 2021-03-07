import 'package:chat_app_firebase/provider/like_provider.dart';
import 'package:chat_app_firebase/screens/bands_screen/components/like_widget/like_widget.dart';
import 'package:chat_app_firebase/screens/bands_screen/models/band_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BandDetailInfo extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  const BandDetailInfo({Key key, this.documentSnapshot}) : super(key: key);

  BandInfo get bandInfo {
    return BandInfo.fromJson(documentSnapshot.data());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) {
              return LikeProvider(likes: bandInfo.votes);
            },
          )
        ],
        child: Card(
          elevation: 4,
          child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(bandInfo.name,
                      style: Theme.of(context).textTheme.headline5),
                  LikeValueWidget(),
                  LikesWidget(reference: this.documentSnapshot.reference),
                ],
              )),
        ));
  }
}

class LikeValueWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(context.watch<LikeProvider>().likes.toString(),
            style: Theme.of(context).textTheme.bodyText1));
  }
}
