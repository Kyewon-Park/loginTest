class Member{
  final int memberId;
  final String email;
  final String name;

  Member(this.memberId, this.email, this.name);

  factory Member.fromJson(Map<String,dynamic> json){
    return Member(json['memberId'], json['email'], json['name']);
  }
}