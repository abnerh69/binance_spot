import 'package:either_dart/either.dart';

import '../enums.dart';

import '../../binance_spot_api.dart';

extension IsolatedMarginUserdataStreamEndpoints on BinanceSpot {
  /// Start a new user data stream end returns listenKey.
  ///
  /// The stream will close after 60 minutes unless a keepalive is sent.
  /// If the account has an active listenKey, that listenKey will be returned and its validity will be extended for 60 minutes.
  Future<Either<String, String>> createIsolatedMarginListenKey({
    required String symbol,
  }) {
    Map<String, String> params = {'symbol': symbol};
    return sendRequest(
      path: 'sapi/v1/userDataStream/isolated',
      type: RequestType.POST,
      params: params,
      keyRequired: true,
    ).then((r) => r.isRight ? Right(r.right['listenKey']) : Left(r.left));
  }

  /// Keepalive a user data stream to prevent a time out.
  ///
  /// User data streams will close after 60 minutes.
  /// It's recommended to send a ping about every 30 minutes.
  Future<Either<String, bool>> pingIsolatedMarginListenKey({
    required String listenKey,
  }) {
    Map<String, String> params = {'listenKey': listenKey};
    return sendRequest(
      path: 'api/v3/userDataStream/isolated',
      type: RequestType.PUT,
      keyRequired: true,
      params: params,
    ).then((r) => r.isLeft ? Left(r.left) : const Right(true));
  }

  /// Close out a user data stream.
  Future<Either<String, bool>> deleteIsolatedMarginListenKey({
    required String listenKey,
  }) {
    Map<String, String> params = {'listenKey': listenKey};
    return sendRequest(
      path: 'sapi/v1/userDataStream/isolated',
      type: RequestType.DELETE,
      keyRequired: true,
      params: params,
    ).then((r) => r.isLeft ? Left(r.left) : const Right(true));
  }
}
