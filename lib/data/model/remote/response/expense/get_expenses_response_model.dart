import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/base/page_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/expense/expense_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/expense/expense_entity.dart';

class GetExpensesResponseModel extends BaseResponseModel<
    PageModel<ExpenseModel, ExpenseEntity>> {
  const GetExpensesResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });

  factory GetExpensesResponseModel.fromJson(Map<String, dynamic> json) =>
      GetExpensesResponseModel(
        success: json['success'] as bool,
        data: json['data'] == null
            ? null
            : PageModel.fromJson(
                json['data'] as Map<String, dynamic>,
                ExpenseModel.fromJson,
              ),
        message: json['message'] as String?,
        error: json['error'] == null
            ? null
            : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>),
      );
}
