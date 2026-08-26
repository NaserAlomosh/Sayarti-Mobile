import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/domain/base/entity/paginated_entity.dart';

class PageModel<M extends BaseTransformResponseModel<E>, E>
    extends BaseTransformResponseModel<PaginatedEntity<E>> {
  const PageModel({
    required this.content,
    required this.page,
    required this.size,
    required this.totalElements,
    required this.totalPages,
    required this.first,
    required this.last,
  });
  final List<M> content;
  final int page;
  final int size;
  final int totalElements;
  final int totalPages;
  final bool first;
  final bool last;

  factory PageModel.fromJson(
    Map<String, dynamic> json,
    M Function(Map<String, dynamic>) fromJsonM,
  ) => PageModel(
    content: (json['content'] as List<dynamic>)
        .map((item) => fromJsonM(item as Map<String, dynamic>))
        .toList(growable: false),
    page: json['page'] as int,
    size: json['size'] as int,
    totalElements: json['totalElements'] as int,
    totalPages: json['totalPages'] as int,
    first: json['first'] as bool,
    last: json['last'] as bool,
  );

  @override
  PaginatedEntity<E> toEntity() => PaginatedEntity(
    content: content.map((model) => model.toEntity()).toList(growable: false),
    page: page,
    size: size,
    totalElements: totalElements,
    totalPages: totalPages,
    first: first,
    last: last,
  );
}
