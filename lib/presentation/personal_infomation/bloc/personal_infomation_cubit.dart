import 'package:recruit_app/config/base/base_cubit.dart';
import 'package:recruit_app/domain/model/personal_infomation/personal_infomation_model.dart';
import 'package:recruit_app/presentation/personal_infomation/bloc/personal_infomation_state.dart';
import 'package:rxdart/rxdart.dart';

class PersonalInfomationCubit extends BaseCubit<PersonalInfomationState> {
  PersonalInfomationCubit() : super(PersonalInfomationInitial());

  BehaviorSubject<PersonalInfomationModel> personalInfotionSubject =
      BehaviorSubject();
  BehaviorSubject<DateTime> birthDaySubject = BehaviorSubject();

  PersonalInfomationModel fakeData = PersonalInfomationModel(
      name: 'Nguyen Van A', age: 19, date: '11/2/1999', gender: 'Nam');

  void init() {
    personalInfotionSubject.add(fakeData);
  }
}
