import 'dart:convert';
import '../../constants.dart';
import 'Api_repository/fetchClient.dart';
import 'Api_repository/fetchTransactions.dart';
import 'Api_repository/authenticateUser.dart';

class API_Manager {
  static final String HEADER_TENANT = "Fineract-Platform-TenantId";
  static final String DEFAULT = "default";

  static final String HEADER_CONTENT = "content-type";
  static final String CONTENT_TYPE = "application/json";

  static final String HEADER_AUTH = "Authorization";

  Map<String, String> apiHeaders = {
    HEADER_CONTENT: CONTENT_TYPE,
    HEADER_TENANT: DEFAULT,
    HEADER_AUTH: 'Basic ' + base64.encode(utf8.encode(CREDENTIALS))
  };

  Map<String, String> authApiHeaders = {
    HEADER_CONTENT: CONTENT_TYPE,
    HEADER_TENANT: DEFAULT
  };

  get auth => authUser();
  get get_transaction => fetchTransactions();
  get get_client => fetchClient();
}
