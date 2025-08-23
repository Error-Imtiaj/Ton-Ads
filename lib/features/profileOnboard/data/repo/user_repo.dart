import 'package:earn_watching_ads/features/profileOnboard/data/dataProvider/user_data_provider.dart';
import 'package:earn_watching_ads/features/profileOnboard/data/model/user_model.dart';

class UserRepo {
  final UserDataProvider userDataProvider;

  UserRepo({required this.userDataProvider});

  Future<UserModel?> getUserData() async {
    final docSnap = await userDataProvider.getPerson();

    if (docSnap != null && docSnap.exists) {
      final data = docSnap.data() as Map<String, dynamic>;
      return UserModel.fromMap(data);
    }

    return null; // no data found
  }
}
