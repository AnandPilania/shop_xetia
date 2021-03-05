extension ToggleExtension on bool {
  bool toggle() => !this;

  bool isTrue() => this == true ? true : false;
}
