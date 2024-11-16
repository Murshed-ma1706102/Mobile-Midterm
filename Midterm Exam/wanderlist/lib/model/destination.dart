
class Destination {
  final String id;
  final String location; 
  final String description;
  final String country;
  final DateTime visitDate;
  final String status;
  final String image;

  Destination({
    required this.id,
    required this.location,
    required this.description,
    required this.country,
    required this.visitDate,
    required this.status,
    required this.image
  });

  factory Destination.fromJson(Map<String, dynamic> map){
    return Destination(
    id: map['id'], 
    location: map['location'],
    description: map['description'], 
    country: map['country'], 
    visitDate: DateTime.parse(map['visitDate']), 
    status: map['status'], 
    image: map['image']);
  }


}

