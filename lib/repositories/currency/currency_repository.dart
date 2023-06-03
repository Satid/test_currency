

import '../../models/currency_model.dart';

abstract class CurrencyRepository {
  Future<CurrencyModel> getAllCurrency();
}
