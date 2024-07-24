import 'package:accurate_test/core/domain/model/user_model.dart';
import 'package:injectable/injectable.dart';

enum Sorting {
  asc,
  desc,
  none,
}

@Injectable()
class UserSorter {
  List<UserModel> sort(List<UserModel> users, Sorting sorting) {
    if (sorting == Sorting.none) return users;
    if (sorting == Sorting.asc) {
      users.sort((a, b) => a.name.compareTo(b.name));
    } else if (sorting == Sorting.desc) {
      users.sort((a, b) => b.name.compareTo(a.name));
    }
    return users;
  }
}
