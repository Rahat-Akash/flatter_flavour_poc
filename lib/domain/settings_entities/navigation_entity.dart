class NavigationEntity {
  final String? id;
  final String? title;
  final String? uri;
  final String? icon;
  final List<NavigationItems>? items;

  NavigationEntity({
    this.id,
    this.title,
    this.uri,
    this.icon,
    this.items,
  });
}

class NavigationItems{
  final dynamic items;
  NavigationItems({this.items});
}