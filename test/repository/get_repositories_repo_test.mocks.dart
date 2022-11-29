// Mocks generated by Mockito 5.3.2 from annotations
// in git_hub/test/repository/get_repositories_repo_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:git_hub/core/http/http_service.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeObject_0 extends _i1.SmartFake implements Object {
  _FakeObject_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HttpService].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpService extends _i1.Mock implements _i2.HttpService {
  MockHttpService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<Object> getResponse(Uri? uri) => (super.noSuchMethod(
        Invocation.method(
          #getResponse,
          [uri],
        ),
        returnValue: _i3.Future<Object>.value(_FakeObject_0(
          this,
          Invocation.method(
            #getResponse,
            [uri],
          ),
        )),
      ) as _i3.Future<Object>);
}
