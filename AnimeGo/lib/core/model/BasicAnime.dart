/// The parent of some models in order to share info
class BasicAnime {
  String name;
  String link;

  BasicAnime.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    this.name = json['name'];
    this.link = json['link'];
  }
}