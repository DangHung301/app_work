import 'package:recruit_app/config/base/base_cubit.dart';
import 'package:recruit_app/domain/model/cv/detail_cv_model.dart';
import 'package:recruit_app/presentation/create_cv/bloc/create_cv_state.dart';
import 'package:rxdart/rxdart.dart';

class CreateCVCubit extends BaseCubit<CreateCVState> {
  CreateCVCubit() : super(CreateCVStateIntial());

  BehaviorSubject<DetailCVModel> cvSubject = BehaviorSubject();

  void init() {
    cvSubject.add(fakeDetailCV);
  }

  DetailCVModel fakeDetailCV = DetailCVModel(
      tieuDeCv: 'Tim viec Mobile',
      tenNguoiDung: 'Nguyen Van A',
      namSinh: '30/01/2001',
      gioiTinh: 'Nam',
      chieuCao: '1m81',
      canNang: '72kg',
      kinhNghiem: '1 năm',
      tenTruongTrungHocPhoThong: 'ABC',
      soHoKhau: '19213123',
      cmnd: '21413214123',
      soThichh: 'Đá bóng, nghe nhạc, ....',
      tinhCach: 'Vui vẻ, hoà đồng',
      queQuan: 'ABC',
      trinhDoVanHoa: 'Đại học',
      nguyenVong: 'ABC',
      nghanhNghe: 'Mobile',
      dieuKienDacBiet: 'ABC',
      mucLuong: '100tr',
      vung: 'ABC',
      tinh: 'ABC',
      currentInfmationJob: CurrentInfmationJob(
          diaChi: 'Ha Noi',
          congty: 'ABC',
          nghanhNghe: 'Mobile',
          anhChungChi:
              'https://lambanguytin.com/wp-content/uploads/2020/08/H%C3%ACnh-%E1%BA%A3nh-c%E1%BB%A7a-ch%E1%BB%A9ng-ch%E1%BB%89-tin-h%E1%BB%8Dc-c%C6%A1-b%E1%BA%A3n.png'));

}
