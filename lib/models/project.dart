import 'package:cloud_firestore/cloud_firestore.dart';

class Project {

  final String id;

  Project ({ this.id });

}

class ProjectData {

  String id;
  String name;
  String description;
  String ownerId;
  int maxTeammate;
  String category;
  List<String> teammate = [];
  String status;
  List<String> qualities = [];
  String ownerImage;
  String ownerName;
  String ownerSurname;
  bool sponsor;

  ProjectData({String ownerId, String id, String name, String description, int maxTeammate, String category, List<String> teammate, List<String> qualities, String status, String ownerImage, String ownerName, String ownerSurname, bool sponsor}) {
    this.ownerId = ownerId;
    this.id = id;
    this.name = name;
    this.description = description;
    this.maxTeammate = maxTeammate;
    this.category = category;
    this.ownerImage = ownerImage;
    this.ownerName = ownerName;
    this.ownerSurname = ownerSurname;
    this.sponsor = sponsor;
    if(teammate == null){
      this.teammate = [];
    }else{
      this.teammate = teammate;
    }
    if(qualities == null){
      this.qualities = [];
    }else {
      this.qualities = qualities;
    }
    this.status = status;
  }

  ProjectData.fromFirestoreDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    //status = documentSnapshot.data['status'];
    status = documentSnapshot.data['Status'];
    id = documentSnapshot.documentID;
    name = documentSnapshot.data['name'];
    description = documentSnapshot.data['description'];
    maxTeammate = documentSnapshot.data['maxTeammate'];
    category = documentSnapshot.data['category'];
    ownerId = documentSnapshot.data['ownerId'];
    ownerName = documentSnapshot.data['ownerName'];
    ownerSurname = documentSnapshot.data['ownerSurname'];
    ownerImage = documentSnapshot.data['ownerImage'];
    sponsor = documentSnapshot.data['sponsor'];
    teammate = [];
    if(documentSnapshot.data['teammate'] != null) {
      documentSnapshot.data['teammate'].forEach((element){
        teammate.add(element);
      });
    }
    qualities = [];
    if(documentSnapshot.data['qualities'] != null){
      documentSnapshot.data['qualities'].forEach((element){
        qualities.add(element);
      });
    }
  }

  Map<String, dynamic> toMap(){
    var data = {
      "ownerId" : ownerId,
      "name" : name,
      "status" : status,
      "description" : description,
      "maxTeammate" : maxTeammate,
      "category" : category,
      "teammate" : teammate,
      "qualities" : qualities,
      "ownerImage" : ownerImage,
      "ownerName" : ownerName,
      "ownerSurname" : ownerSurname,
      "sponsor" : sponsor,
    };
    return data;
  }


  Future<ProjectData> getProjectData(String uid) async {
    DocumentSnapshot documentSnapshot = await Firestore.instance
        .collection("projects")
        .document(uid)
        .get();

    return ProjectData.fromFirestoreDocumentSnapshot(documentSnapshot);
  }

  ProjectData _projectDataFromSnapshot(DocumentSnapshot snapshot) {
    return ProjectData(
      id : id,
      name : snapshot.data['name'],
      description : snapshot.data['description'],
      maxTeammate : snapshot.data['maxTeammate'],
      category : snapshot.data['category'],
    );
  }

  //get user stream
  Stream<QuerySnapshot> get projects {
    return Firestore.instance.collection('projects').snapshots();
  }

  // get user doc stream
  Stream<ProjectData> get projectData {

    return Firestore.instance.collection('projects').document(id).snapshots()
        .map(_projectDataFromSnapshot);
  }

  Future fullProject(String uid) async {
    await Firestore.instance
        .collection("projects")
        .document(uid)
        .updateData({
      'status': '1',
    }
    );
  }

  Future noFullProject(String uid) async {
    await Firestore.instance
        .collection("projects")
        .document(uid)
        .updateData({
      'status': '0',
    }
    );
  }




}
