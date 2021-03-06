
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teamup/view/project/create_project.dart';
import 'package:teamup/view/project/project_details.dart';

class CardView extends StatefulWidget {
  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {

  List<Widget> containersProjects = [

    buildAllCategories(),
    buildMusica(),
    buildArte(),
    buildSport(),
    buildCinema(),
    buildBusiness(),

  ];

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: DefaultTabController(
        length: 6,
        child: new Scaffold(
            appBar: new AppBar(
              automaticallyImplyLeading: false,
              title: const Text('Home'),
              centerTitle: true,
                actions: <Widget>[
                  // action button
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateProject()),
                      );
                    },
                  ),
                ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(30.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.lightBlueAccent,
                        unselectedLabelColor: Colors.white70,
                        tabs: [
                      new Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: new Tab(text: 'TUTTE'),
                      ),
                      new Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: new Tab(text: 'MUSICA'),
                      ),
                      new Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: new Tab(text: 'ARTE')
                      ),
                      new Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: new Tab(text: 'SPORT')
                      ),
                      new Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: new Tab(text: 'CINEMA')
                      ),
                      new Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: new Tab(text: 'BUSINESS')
                      ),

                    ]),
                  ),
                ),
              ),
            ),
            /*body: new TabBarView(
                  children: [
                    new ListView(
                      children: list,
                    ),
                    new ListView(
                      children: list,
                    ),
                  ],
                ),*/
            body: TabBarView(
              children: containersProjects,
            )

        ),
      ),
    );
  }
}

//query per recuperare tutte le info da Firebase

@override
Widget buildAllCategories() {
  return Container(
    child: StreamBuilder(
        stream: Firestore.instance
            .collection('projects')
            .where("status", isEqualTo: "0").orderBy("sponsor", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Caricamento in corso', textAlign: TextAlign.center,),
          );
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                ProjectDetails(
                                  title: snapshot.data.documents[index]['name'],
                                  sponsor: snapshot.data.documents[index]['sponsor'],
                                  description:snapshot.data.documents[index]['description'],
                                  uid: snapshot.data.documents[index].documentID,
                                  maxTeammate: snapshot.data.documents[index]['maxTeammate'],
                                  qualities: snapshot.data.documents[index]['qualities'],
                                  owner: snapshot.data.documents[index]['ownerId'],
                                  name: snapshot.data.documents[index]['ownerName'],
                                  surname: snapshot.data.documents[index]['ownerSurname'],
                                  ownerImage: snapshot.data.documents[index]['ownerImage'],
                                  cv: snapshot.data.documents[index]['cv'],
                                  teammates: snapshot.data.documents[index]['teammate']
                                )
                        ));
                  },
                  child: _buildListItem(context, snapshot.data.documents[index]))
          );
        }
    ),
  );
}


@override
Widget buildArte() {
  return Container(
    child: StreamBuilder(
        stream: Firestore.instance
            .collection('projects')
            .where("status", isEqualTo: "0")
            .where("category", isEqualTo: "Arte").orderBy("sponsor", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Non ci sono progetti disponibili.', textAlign: TextAlign.center,),
          );
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                ProjectDetails(
                                  title: snapshot.data.documents[index]['name'],
                                  sponsor: snapshot.data.documents[index]['sponsor'],
                                  description:snapshot.data.documents[index]['description'],
                                  uid: snapshot.data.documents[index].documentID,
                                    maxTeammate: snapshot.data.documents[index]['maxTeammate'],
                                  qualities: snapshot.data.documents[index]['qualities'],
                                  owner: snapshot.data.documents[index]['ownerId'],
                                  name: snapshot.data.documents[index]['ownerName'],
                                  surname: snapshot.data.documents[index]['ownerSurname'],
                                  ownerImage: snapshot.data.documents[index]['ownerImage'],
                                  cv: snapshot.data.documents[index]['cv'],
                                    teammates: snapshot.data.documents[index]['teammate']
                                )
                        ));
                  },
                  child: _buildListItem(context, snapshot.data.documents[index]))
          );
        }
    ),
  );
}

@override
Widget buildMusica() {
  return Container(
    child: StreamBuilder(
        stream: Firestore.instance
            .collection('projects')
            .where("status", isEqualTo: "0")
            .where("category", isEqualTo: "Musica").orderBy("sponsor", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Non ci sono progetti disponibili.', textAlign: TextAlign.center,),
          );
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                ProjectDetails(
                                  title: snapshot.data.documents[index]['name'],
                                  sponsor: snapshot.data.documents[index]['sponsor'],
                                  description:snapshot.data.documents[index]['description'],
                                  uid: snapshot.data.documents[index].documentID,
                                    maxTeammate: snapshot.data.documents[index]['maxTeammate'],
                                  qualities: snapshot.data.documents[index]['qualities'],
                                  owner: snapshot.data.documents[index]['ownerId'],
                                  name: snapshot.data.documents[index]['ownerName'],
                                  surname: snapshot.data.documents[index]['ownerSurname'],
                                  ownerImage: snapshot.data.documents[index]['ownerImage'],
                                  cv: snapshot.data.documents[index]['cv'],
                                    teammates: snapshot.data.documents[index]['teammate']

                                )
                        ));
                  },
                  child: _buildListItem(context, snapshot.data.documents[index]))
          );
        }
    ),
  );
}

@override
Widget buildSport() {
  return Container(
    child: StreamBuilder(
        stream: Firestore.instance
            .collection('projects')
            .where("status", isEqualTo: "0")
            .where("category", isEqualTo: "Sport").orderBy("sponsor", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Non ci sono progetti disponibili.', textAlign: TextAlign.center,),
          );
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                ProjectDetails(
                                  title: snapshot.data.documents[index]['name'],
                                  sponsor: snapshot.data.documents[index]['sponsor'],
                                  description:snapshot.data.documents[index]['description'],
                                  uid: snapshot.data.documents[index].documentID,
                                    maxTeammate: snapshot.data.documents[index]['maxTeammate'],
                                  qualities: snapshot.data.documents[index]['qualities'],
                                  owner: snapshot.data.documents[index]['ownerId'],
                                  name: snapshot.data.documents[index]['ownerName'],
                                  surname: snapshot.data.documents[index]['ownerSurname'],
                                  ownerImage: snapshot.data.documents[index]['ownerImage'],
                                  cv: snapshot.data.documents[index]['cv'],
                                    teammates: snapshot.data.documents[index]['teammate']

                                )
                        ));
                  },
                  child: _buildListItem(context, snapshot.data.documents[index]))
          );
        }
    ),
  );
}

@override
Widget buildCinema() {
  return Container(
    child: StreamBuilder(
        stream: Firestore.instance
            .collection('projects')
            .where("status", isEqualTo: "0")
            .where("category", isEqualTo: "Cinema").orderBy("sponsor", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Non ci sono progetti disponibili.', textAlign: TextAlign.center,),
          );
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                ProjectDetails(
                                  title: snapshot.data.documents[index]['name'],
                                  sponsor: snapshot.data.documents[index]['sponsor'],
                                  description:snapshot.data.documents[index]['description'],
                                  uid: snapshot.data.documents[index].documentID,
                                    maxTeammate: snapshot.data.documents[index]['maxTeammate'],
                                  qualities: snapshot.data.documents[index]['qualities'],
                                  owner: snapshot.data.documents[index]['ownerId'],
                                  name: snapshot.data.documents[index]['ownerName'],
                                  surname: snapshot.data.documents[index]['ownerSurname'],
                                  ownerImage: snapshot.data.documents[index]['ownerImage'],
                                  cv: snapshot.data.documents[index]['cv'],
                                    teammates: snapshot.data.documents[index]['teammate']

                                )
                        ));
                  },
                  child: _buildListItem(context, snapshot.data.documents[index]))
          );
        }
    ),
  );
}

@override
Widget buildBusiness() {
  return Container(
    child: StreamBuilder(
        stream: Firestore.instance
            .collection('projects')
            .where("status", isEqualTo: "0")
            .where("category", isEqualTo: "Business").orderBy("sponsor", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Non ci sono progetti disponibili.', textAlign: TextAlign.center,),
          );
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                ProjectDetails(
                                  title: snapshot.data.documents[index]['name'],
                                  maxTeammate: snapshot.data.documents[index]['maxTeammate'],
                                  sponsor: snapshot.data.documents[index]['sponsor'],
                                  description:snapshot.data.documents[index]['description'],
                                  uid: snapshot.data.documents[index].documentID,
                                  qualities: snapshot.data.documents[index]['qualities'],
                                  owner: snapshot.data.documents[index]['ownerId'],
                                  name: snapshot.data.documents[index]['ownerName'],
                                  surname: snapshot.data.documents[index]['ownerSurname'],
                                  ownerImage: snapshot.data.documents[index]['ownerImage'],
                                  cv: snapshot.data.documents[index]['cv'],
                                    teammates: snapshot.data.documents[index]['teammate']
                                    )
                        ));
                  },
                  child: _buildListItem(context, snapshot.data.documents[index]))
          );
        }
    ),
  );
}

Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150.0,
        //margin: new EdgeInsets.only(right: 46.0),
        decoration: new BoxDecoration(
          //color: Colors.blueGrey.shade200,
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(30.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.black12,
              blurRadius: 8.0,
              offset: new Offset(0.0, 0.0),
            ),
          ],
        ),

        //Circle Avatar
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        document['ownerImage']),
                  ),

                  SizedBox(width: 20),
                  //titolo e material button
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(bottom:30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(document['name'],
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700)),
                             document['sponsor'] ? Text('Sponsorizzato', style: TextStyle(color: Colors.grey.shade500, fontSize: 12),) : Text(''),
                        ],),
                    ),
                  )
                ],
              ),

              SizedBox(height: 5),

              SizedBox(
                width: double.infinity,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8.0),
                    child: Row(
                      children: [
                        Text(
                          document['ownerName'] + " " + document['ownerSurname'],
                          textAlign: TextAlign.left, style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Num. Posti disponibili", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                      if(document['maxTeammate'] != null && document['maxTeammate'] != document['teammate'].length)
                           Text((document['maxTeammate'] - document['teammate'].length).toString(),
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700)),
                      if(document['maxTeammate'] == null)
                        Text("Illimitati",
                            style: TextStyle(
                                //fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700)),
                      if(document['maxTeammate'] == document['teammate'].length)
                        Text("Completo",style: TextStyle(
                          //fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );



}

