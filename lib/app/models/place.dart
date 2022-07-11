class Place {
  final String name;
  final String location;
  final String x_coordinate;
  final String y_coordinate;
  final String image;
  final DetailPlace detail;

  Place(this.name, this.location, this.x_coordinate, this.y_coordinate,
      this.image, this.detail);
}

class DetailPlace {
  final String days;
  final String hours;
  final String info;
  final List<String> images;

  DetailPlace(this.days, this.hours, this.info, this.images);
}
