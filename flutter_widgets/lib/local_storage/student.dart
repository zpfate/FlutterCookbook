
class Student {

  late String id;
  late String name;
  late num score;

  Student({required this.id, required this.name, required this.score});

  Student.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    score = json["score"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name" : name,
      "score" : score,
    };
  }

  @override
  String toString() {
    return "id = $id, name = $name, score = $score";
  }





}
