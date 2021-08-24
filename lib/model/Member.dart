class Member{
  final int memberId;
  final String email;
  final String name;
  final String localDate;

  Member({required this.memberId, required this.email, required this.name, required this.localDate});

  factory Member.fromJson(Map<String,dynamic> json){
    return Member(
        memberId: json['id'] as int,
        email: json['email'] as String,
        name: json['name'] as String,
        localDate: json['localDate'] as String
    );
  }
}