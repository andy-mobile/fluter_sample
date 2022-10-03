import 'package:deriv/core/base/mapper.dart';
import 'package:deriv/core/exception/index.dart';
import 'package:deriv/data/dto/forget/forget_response_dto.dart';
import 'package:deriv/domain/model/forget/forget_entity.dart';

class ForgetMapper implements Mapper<ForgetResponseDTO, ForgetEntity> {
  @override
  ForgetEntity map(ForgetResponseDTO value) {
    ForgetEntity model;

    try {
      model = ForgetEntity(value.forget!);
    } catch (exception) {
      throw MapperException(exception);
    }
    return model;
  }
}
