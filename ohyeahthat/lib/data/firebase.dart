import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirestoreFirstDemoState pageState;

class FirestoreFirstDemo extends StatefulWidget {
  const FirestoreFirstDemo({Key? key}) : super(key: key);

  @override
  FirestoreFirstDemoState createState() {
    pageState = FirestoreFirstDemoState();
    return pageState;
  }
}

class FirestoreFirstDemoState extends State<FirestoreFirstDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // 컬렉션명
  final String colName = "general";

  // 필드명
  final String fnName = "title";
  final String fnDescription = "content";
  final String fnDatetime = "";
  FirebaseFirestore _Firestore = FirebaseFirestore.instance;

  get id => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text("firebase")),
      body: ListView(
        children: <Widget>[
          Container(
            height: 500,
            child: StreamBuilder<QuerySnapshot>(
              stream: _Firestore
                  .collection('general')
                  // .orderBy(fnDatetime, descending: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) return Text("Error: ${snapshot.error}");
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Text("Loading...");
                  default:
                    return ListView(
                      children: snapshot.data!.docs
                          .map((DocumentSnapshot document) {
                        Timestamp ts = document[fnDatetime];
                        String dt = timestampToStrDateTime(ts);
                        return Card(
                          elevation: 2,
                          child: InkWell(
                            // Read Document
                            onTap: () {
                              showDocument(document.id);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: <Widget>[                                  Row(                                    mainAxisAlignment:                                        MainAxisAlignment.spaceBetween,                                    children: <Widget>[                                      Text(                                        document[fnName],
                                        style: const TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        dt.toString(),
                                        style:
                                            TextStyle(color: Colors.grey[600]),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      document[fnDescription],
                                      style: const TextStyle(color: Colors.black54),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  // Firestore CRUD Logic

  // 문서 조회 (Read)
  void showDocument(String documentID) {
    _Firestore
        .collection(colName)
        .doc(id)
        .get()
        .then((doc) {
      showReadDocSnackBar(doc);
    });
  }

  void showReadDocSnackBar(DocumentSnapshot doc) {
    _scaffoldKey.currentState!
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: Colors.deepOrangeAccent,
          duration: const Duration(seconds: 5),
          content: Text(
              "$fnName: ${doc[fnName]}\n$fnDescription: ${doc[fnDescription]}"
              "\n$fnDatetime: ${timestampToStrDateTime(doc[fnDatetime])}"),
          action: SnackBarAction(
            label: "Done",
            textColor: Colors.white,
            onPressed: () {},
          ),
        ),
      );
  }

  String timestampToStrDateTime(Timestamp ts) {
    return DateTime.fromMicrosecondsSinceEpoch(ts.microsecondsSinceEpoch)
        .toString();
  }
}
