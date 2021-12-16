class BaseURL {
  static final String PROTOCOL_HTTPS = "https://";

  static final String API_ENDPOINT = "nashfin.ngrok.io";
  static final String API_PATH = "/fineract-provider/api/v1/";

  //self service url
  static final String API_ENDPOINT_SELF = "nashfin.ngrok.io";
  static final String API_PATH_SELF = "/fineract-provider/api/v1/self/";

  static String getUrl() {
    return PROTOCOL_HTTPS + API_ENDPOINT + API_PATH;
  }

  static String getSelfServiceUrl() {
    return PROTOCOL_HTTPS + API_ENDPOINT_SELF + API_PATH_SELF;
  }

  //MPESA
  static final String MPESA_ENDPOINT = "nashcash.ngrok.io";
  String getMpesaUrl() {
    return PROTOCOL_HTTPS + MPESA_ENDPOINT;
  }
}
