import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_folowers_numbers.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/brazilian_cases_repository.dart';

abstract class GetFolowersNumbers {
  Future<Either<FailureGetBrazilianCases, ResultFolowers>> call();
}

class GetFolowersNumbersImpl implements GetFolowersNumbers {
  final BrazilianCasesRepository repository;
  GetFolowersNumbersImpl(this.repository);

  @override
  Future<Either<FailureGetBrazilianCases, ResultFolowers>> call() async {
    return await repository.getFolowers();
  }
}
