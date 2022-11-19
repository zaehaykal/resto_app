// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:mockito/mockito.dart' as _mokito;
import 'dart:async' as _async;
import 'dart:convert' as _convert;
import 'dart:typed_data' as _i5;
import 'package:http/http.dart' as http;

class _FakeResponse0 extends _mokito.SmartFake implements http.Response {
  _FakeResponse0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse1 extends _mokito.SmartFake
    implements http.StreamedResponse {
  _FakeStreamedResponse1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class MockClient extends _mokito.Mock implements http.Client {
  MockClient() {
    _mokito.throwOnMissingStub(this);
  }

  @override
  _async.Future<http.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _async.Future<http.Response>.value(_FakeResponse0(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _async.Future<http.Response>);
  @override
  _async.Future<http.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _async.Future<http.Response>.value(_FakeResponse0(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _async.Future<http.Response>);
  @override
  _async.Future<http.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _convert.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _async.Future<http.Response>.value(_FakeResponse0(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _async.Future<http.Response>);
  @override
  _async.Future<http.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _convert.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _async.Future<http.Response>.value(_FakeResponse0(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _async.Future<http.Response>);
  @override
  _async.Future<http.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _convert.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _async.Future<http.Response>.value(_FakeResponse0(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _async.Future<http.Response>);

  @override
  _async.Future<http.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _convert.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _async.Future<http.Response>.value(_FakeResponse0(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _async.Future<http.Response>);

  @override
  _async.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _async.Future<String>.value(''),
      ) as _async.Future<String>);
  @override
  _async.Future<_i5.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _async.Future<_i5.Uint8List>.value(_i5.Uint8List(0)),
      ) as _async.Future<_i5.Uint8List>);
  @override
  _async.Future<http.StreamedResponse> send(http.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _async.Future<http.StreamedResponse>.value(_FakeStreamedResponse1(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _async.Future<http.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
