class Users{
  int id;
  String userName;
  String completeName;
  String profilePicture;
  String bloodType;
  int positionRank;
  int pointsRank;

  Users({this.id, this.userName, this.completeName, this.profilePicture, this.bloodType, this.positionRank, this.pointsRank});


  Users.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userName = json['userName'];
    completeName = json['completeName'];
    profilePicture = json['profilePicture'];
    bloodType = json['bloodType'];
    positionRank = json['positionRank'];
    pointsRank = json['pointsRank'];
  }
}