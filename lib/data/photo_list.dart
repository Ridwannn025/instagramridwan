class Photo {
  String? id;
  bool? likedByUser;
  String? description;
  User? user;
  Urls? urls;
  String? error;

  factory Photo.error({
    required String errorMessage,
  }) =>
      Photo(
        error: errorMessage,
      );

  Photo({
    this.id,
    this.likedByUser,
    this.description,
    this.user,
    this.urls,
    this.error,
  });

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    likedByUser = json['liked_by_user'];
    description = json['description'];
    user = json['user'];
    urls = json['urls'];
    error = json['error'];
  }
}

class User {
  String? username;
  String? name;

  User(this.username, this.name);

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'usename': username,
        'name': name,
      };
}

class Urls {
  String? regular;
  String? small;

  Urls(this.regular, this.small);

  Urls.fromJson(Map<String, dynamic> json)
      : regular = json['regular'],
        small = json['small'];

  Map<String, dynamic> toJson() => {
        'regular': regular,
        'small': small,
      };
}
