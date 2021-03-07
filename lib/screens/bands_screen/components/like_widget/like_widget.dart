import 'package:chat_app_firebase/provider/like_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LikesWidget extends StatefulWidget {
  // the document reference relating to the counter.
  final DocumentReference reference;

  // the number of current likes to reset if

  const LikesWidget({Key key, this.reference}) : super(key: key);

  @override
  _LikesWidgetState createState() => _LikesWidgetState();
}

class _LikesWidgetState extends State<LikesWidget> {
  Future<void> _onLikePressed() async {
    int current = context.read<LikeProvider>().likes;
    context.read<LikeProvider>().updateLikes(current + 1);
    try {
      int newLikes = await FirebaseFirestore.instance
          .runTransaction<int>((transaction) async {
        // this transaction is obtained from
        // get the snap transaction reference
        // this one will obtain the latest one
        DocumentSnapshot snapShot = await transaction.get(widget.reference);
        if (!snapShot.exists) {
          throw Exception('Document does not exist');
        }

        int updatedLikes = (snapShot.data()['votes'] ?? 0) + 1;
        transaction.update(widget.reference, {'votes': updatedLikes});
        return updatedLikes;
      });
    } catch (error) {
      print('Failed to update likes for documents $error');
      context.read<LikeProvider>().updateLikes(current);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        child: IconButton(
          onPressed: _onLikePressed,
          icon: Icon(Icons.favorite),
        ));
  }
}
