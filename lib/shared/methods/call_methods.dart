import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ui_api/models/call/call_model.dart';

class CallMethods {
  final CollectionReference callCollection =
      FirebaseFirestore.instance.collection('call');

  Stream<DocumentSnapshot> callStream({required String uid}) =>
      callCollection.doc(uid).snapshots();

  Future<bool> makeCall({required CallModel call}) async {
    try {
      call.hasDialled = true;
      final hasDialledMap = call.toJson();

      call.hasDialled = false;
      final hasNotDialledMap = call.toJson();

      await callCollection.doc(call.callerId.toString()).set(hasDialledMap);
      await callCollection
          .doc(call.receiverId.toString())
          .set(hasNotDialledMap);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> endCall({required CallModel call}) async {
    try {
      await callCollection.doc(call.callerId.toString()).delete();
      await callCollection.doc(call.receiverId.toString()).delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
