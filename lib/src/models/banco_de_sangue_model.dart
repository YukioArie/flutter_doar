import 'package:cloud_firestore/cloud_firestore.dart';

class BancoDeSangueModel{
  String hemocentros;
  String id;
  String type;
  String status;
  int quantity;

  BancoDeSangueModel.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    type = snapshot.data['type'];
    status = snapshot.data['status'];
    quantity = snapshot.data['quantity'];
  }
}