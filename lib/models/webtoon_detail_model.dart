class WebtoonDetailmodel{
  final String title, about, genre, age, thumb;

  WebtoonDetailmodel.fromJson(Map<String, dynamic> json) :
      title = json['title'],
      about = json['about'],
      genre = json['genre'],
      age = json['age'],
      thumb = json['thumb'];
}