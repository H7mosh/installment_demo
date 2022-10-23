import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:installment_demo/module/customerModel.dart';


class custServices {
FirebaseFirestore _customersFirestoreInstance=FirebaseFirestore.instance;



  Stream<List<Customers>> getCustomers()
  {
    return _customersFirestoreInstance.collection("customers").snapshots().
    map((snapshot) => snapshot.docs.map((document){
     Map map=document.data();
     map['hamoshid']=document.id;
      return Customers.fromFirestore(map);
    }).toList());
  }


  Future<void>saveCustomeService(Customers custModel)async
  {
    _customersFirestoreInstance.collection('customers').add(custModel.toMap()).then((value) => print('edited success'));
  }

Future<void>editCustomer(selectedDoc , Customers custModel)async
{
  //var storageImage=FirebaseStorage.instance.ref().child(imagePicker_Provider().GetImage.path);
  //var uploadImageToFirestore=storageImage.putFile(imagePicker_Provider().GetImage);
  //imageUrl = await(await uploadImageToFirestore.snapshot.storage.ref().getDownloadURL());
  _customersFirestoreInstance.collection('customers').doc(selectedDoc).update(custModel.toMap());
}

Future<void>deleteCustomer(selectedDoc )async
{
  //var storageImage=FirebaseStorage.instance.ref().child(imagePicker_Provider().GetImage.path);
  //var uploadImageToFirestore=storageImage.putFile(imagePicker_Provider().GetImage);
  //imageUrl = await(await uploadImageToFirestore.snapshot.storage.ref().getDownloadURL());
  _customersFirestoreInstance.collection('customers').doc(selectedDoc).delete();
}

}

