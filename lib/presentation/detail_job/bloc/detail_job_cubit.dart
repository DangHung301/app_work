import 'package:recruit_app/config/base/base_cubit.dart';
import 'package:recruit_app/domain/model/detail_job/detail_job_model.dart';
import 'package:recruit_app/presentation/detail_job/bloc/detail_job_state.dart';

class DetailJobCubit extends BaseCubit<DetailJobState> {
  DetailJobCubit() : super(DetailJobStateIntial());

  final DetailJobModel fakeModel = DetailJobModel(
    rangeSalary: 'Thoả thuận',
    nameJob: 'Lập trình Mobile',
    numberRecuit: 3,
    gender: 'Nam',
    rangeAge: '18 tuổi',
    levelEnglish: 'Không có',
    experience: 'Junior',
    misc: 'Không có',
    numberPhone: '0123456789',
    employer: 'Công ty ABC',
    addressCompany: 'Đường Chiến Thắng - Tân Triều - Thanh Trì - Hà nội',
    startDate: '30/01/2022',
    endDate: '30/02/2022',
    logoCompany:
        'https://c8.alamy.com/comp/PXPBDW/building-logo-design-real-estate-company-logo-design-abstract-construction-logo-design-building-logo-design-PXPBDW.jpg',
    nameCompany: 'Công ty Cổ phần Chứng khoán Thành phố Hồ Chí Minh (HSC)',
    companyModel: CompanyModel(
        nameCompany: 'Công ty Cổ phần Chứng khoán Thành phố Hồ Chí Minh (HSC)',
        summary:
            'Tự hào là một trong những tập đoàn hàng đầu hoạt động trong lĩnh vực du lịch. Với mong muốn mang đến cho du khách những trải nghiệm du lịch thời thượng, chúng tôi đã xây dựng thành công mô hình du lịch thông minh (All-In-One) với các dịch vụ lữ hành, visa, vé máy bay, vận tải chất lượng cao, lưu trú, ăn uống và vui chơi giải trí…'),
  );
}
