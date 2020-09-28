class TokenPostGetter{
  final int code;
  final String message;
  final String data;

  TokenPostGetter({this.code, this.message, this.data});

  factory TokenPostGetter.fromJson(Map<String, dynamic> json) {
    return TokenPostGetter(
        code: json['code'],
        message: json['message'],
        data: json['data']);
  }
}