import 'option.dart';

enum OptionGroupType { RADIO, CHECKBOX }

class OptionGroup {
  int id;
  String title;
  List<Option> options;
  OptionGroupType type;

  OptionGroup(
      {required this.id,
      required this.title,
      required this.options,
      this.type = OptionGroupType.CHECKBOX});
}
