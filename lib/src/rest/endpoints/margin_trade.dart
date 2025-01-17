import 'package:either_dart/either.dart';

import '../classes.dart';
import '../enums.dart';

import '../../binance_spot_api.dart';
import '../../common/enums.dart';

/// Account / Trade endpoints for Binance Spot API
extension MarginTradeEndpoints on BinanceSpot {
  // /// Send in a new order / Response type is RESULT
  // Future<Either<String, Order>> newMarginOrder({
  //   required String symbol,
  //   required Side side,
  //   required OrderType type,
  //   TimeInForce? timeInForce,
  //   String? quantity,
  //   String? quoteOrderQty,
  //   String? price,
  //   String? newClientOrderId,
  //   String? stopPrice,
  //   String? icebergQty,
  //   String? newOrderRespType,
  //   int? recvWindow,
  // }) {
  //   Map<String, String> params = {
  //     'symbol': symbol,
  //     'side': side.toStr(),
  //     'type': type.toStr(),
  //   };
  //   if (timeInForce != null) params['timeInForce'] = timeInForce.toStr();
  //   if (quantity != null) params['quantity'] = quantity;
  //   if (quoteOrderQty != null) params['quoteOrderQty'] = quoteOrderQty;
  //   if (price != null) params['price'] = price;
  //   if (newClientOrderId != null) params['newClientOrderId'] = newClientOrderId;
  //   if (stopPrice != null) params['stopPrice'] = stopPrice;
  //   if (icebergQty != null) params['icebergQty'] = icebergQty;
  //   if (newOrderRespType != null) params['newOrderRespType'] = newOrderRespType;
  //   if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
  //   return sendRequest(
  //     path: '/sapi/v1/margin/order',
  //     type: RequestType.POST,
  //     params: params,
  //     keyRequired: true,
  //     signatureRequired: true,
  //     timestampRequired: true,
  //   ).then((r) => r.isLeft ? Left(r.left) : Right(Order.fromMap(r.right)));
  // }
  //
  // /// Cancel an active order.
  // /// Either orderId or origClientOrderId must be sent.
  // Future<Either<String, CanceledOrder>> cancelMarginOrder({
  //   required String symbol,
  //   int? orderId,
  //   String? origClientOrderId,
  //   String? newClientOrderId,
  //   int? recvWindow,
  // }) {
  //   Map<String, String> params = {
  //     'symbol': symbol,
  //   };
  //   if (origClientOrderId != null)
  //     params['origClientOrderId'] = origClientOrderId;
  //   if (orderId != null) params['orderId'] = orderId.toString().toString();
  //   if (newClientOrderId != null) params['newClientOrderId'] = newClientOrderId;
  //   if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
  //   return sendRequest(
  //     path: 'api/v3/order',
  //     type: RequestType.DELETE,
  //     params: params,
  //     keyRequired: true,
  //     signatureRequired: true,
  //     timestampRequired: true,
  //   ).then(
  //       (r) => r.isLeft ? Left(r.left) : Right(CanceledOrder.fromMap(r.right)));
  // }
  //
  // /// Cancels all active orders on a symbol.
  // /// This includes OCO orders.
  // Future<Either<String, List<CanceledOrder>>> cancelallOpenMarginOrders({
  //   required String symbol,
  //   int? recvWindow,
  // }) {
  //   Map<String, String> params = {
  //     'symbol': symbol,
  //   };
  //   if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
  //   return sendRequest(
  //     path: 'api/v3/openOrders',
  //     type: RequestType.DELETE,
  //     params: params,
  //     keyRequired: true,
  //     signatureRequired: true,
  //     timestampRequired: true,
  //   ).then((r) => r.isLeft
  //       ? Left(r.left)
  //       : Right(List<CanceledOrder>.from(
  //           r.right.map((e) => CanceledOrder.fromMap(e)))));
  // }
  //
  // /// Check an order's status.
  // Future<Either<String, CurrentOrder>> queryMarginOrder({
  //   required String symbol,
  //   int? orderId,
  //   String? origClientOrderId,
  //   int? recvWindow,
  // }) {
  //   Map<String, String> params = {
  //     'symbol': symbol,
  //   };
  //   if (orderId != null) params['orderId'] = orderId.toString();
  //   if (origClientOrderId != null)
  //     params['origClientOrderId'] = origClientOrderId;
  //   if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
  //   return sendRequest(
  //     path: 'api/v3/order',
  //     type: RequestType.GET,
  //     params: params,
  //     keyRequired: true,
  //     signatureRequired: true,
  //     timestampRequired: true,
  //   ).then(
  //       (r) => r.isLeft ? Left(r.left) : Right(CurrentOrder.fromMap(r.right)));
  // }
  //
  // /// Get all open orders on a symbol.
  // /// Careful when accessing this with no symbol.
  // Future<Either<String, List<CurrentOrder>>> currentOpenMarginOrders({
  //   String? symbol,
  //   int? recvWindow,
  // }) {
  //   Map<String, String> params = {};
  //   if (symbol != null) params['symbol'] = symbol;
  //   if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
  //   return sendRequest(
  //     path: 'api/v3/openOrders',
  //     type: RequestType.GET,
  //     params: params,
  //     keyRequired: true,
  //     signatureRequired: true,
  //     timestampRequired: true,
  //   ).then((r) => r.isLeft
  //       ? Left(r.left)
  //       : Right(List<CurrentOrder>.from(
  //           r.right.map((e) => CurrentOrder.fromMap(e)))));
  // }
  //
  // /// Get all account orders; active, canceled, or filled.
  // Future<Either<String, List<CurrentOrder>>> allMarginOrders({
  //   required String symbol,
  //   int? orderId,
  //   int? startTime,
  //   int? endTime,
  //   int? limit,
  //   int? recvWindow,
  // }) {
  //   Map<String, String> params = {
  //     'symbol': symbol,
  //   };
  //   if (orderId != null) params['orderId'] = orderId.toString();
  //   if (startTime != null) params['startTime'] = startTime.toString();
  //   if (endTime != null) params['endTime'] = endTime.toString();
  //   if (limit != null) params['limit'] = limit.toString();
  //   if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
  //   return sendRequest(
  //     path: 'api/v3/allOrders',
  //     type: RequestType.GET,
  //     params: params,
  //     keyRequired: true,
  //     signatureRequired: true,
  //     timestampRequired: true,
  //   ).then((r) => r.isLeft
  //       ? Left(r.left)
  //       : Right(List<CurrentOrder>.from(
  //           r.right.map((e) => CurrentOrder.fromMap(e)))));
  // }

  /// Send in a new OCO
  /// symbol	STRING	YES
  /// isIsolated	STRING	NO	for isolated margin or not, "TRUE", "FALSE"，default "FALSE"
  /// listClientOrderId	STRING	NO	A unique Id for the entire orderList
  /// side	ENUM	YES
  /// quantity	DECIMAL	YES
  /// limitClientOrderId	STRING	NO	A unique Id for the limit order
  /// price	DECIMAL	YES
  /// limitIcebergQty	DECIMAL	NO
  /// stopClientOrderId	STRING	NO	A unique Id for the stop loss/stop loss limit leg
  /// stopPrice	DECIMAL	YES
  /// stopLimitPrice	DECIMAL	NO	If provided, stopLimitTimeInForce is required.
  /// stopIcebergQty	DECIMAL	NO
  /// stopLimitTimeInForce	ENUM	NO	Valid values are GTC/FOK/IOC
  /// newOrderRespType	ENUM	NO	Set the response JSON.
  /// sideEffectType	ENUM	NO	NO_SIDE_EFFECT, MARGIN_BUY, AUTO_REPAY; default NO_SIDE_EFFECT.
  /// recvWindow	LONG	NO	The value cannot be greater than 60000
  /// timestamp	LONG	YES
  Future<Either<String, MarginOcoOrder>> newMarginOCO({
    required String symbol,
    String? listClientOrderId,
    required Side side,
    required String quantity,
    int? limitClientOrderId,
    required String price,
    String? limitIcebergQty,
    String? stopClientOrderId,
    required String stopPrice,
    String? stopLimitPrice,
    String? stopIcebergQty,
    TimeInForce stopLimitTimeInForce = TimeInForce.GTC,
    String? newOrderRespType,
    int? recvWindow,
    MarginSideEffectType sideEffectType = MarginSideEffectType.NO_SIDE_EFFECT,
    String isIsolated = 'TRUE',
  }) {
    Map<String, String> params = {
      'symbol': symbol,
      'side': side.toStr(),
      'quantity': quantity,
      'price': price,
      'stopPrice': stopPrice,
      'isIsolated': isIsolated,
      'sideEffectType': sideEffectType.toStr(),
      'stopLimitTimeInForce': stopLimitTimeInForce.toStr(),
    };
    if (listClientOrderId != null) {
      params['listClientOrderId'] = listClientOrderId;
    }
    if (limitClientOrderId != null) {
      params['limitClientOrderId'] = limitClientOrderId.toString();
    }
    if (limitIcebergQty != null) params['limitIcebergQty'] = limitIcebergQty;
    if (stopClientOrderId != null) {
      params['stopClientOrderId'] = stopClientOrderId;
    }
    if (stopLimitPrice != null) params['stopLimitPrice'] = stopLimitPrice;
    if (stopIcebergQty != null) params['stopIcebergQty'] = stopIcebergQty;
    // if (stopLimitTimeInForce != null)
    //   params['stopLimitTimeInForce'] = stopLimitTimeInForce.toStr();
    if (newOrderRespType != null) params['newOrderRespType'] = newOrderRespType;
    if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
    return sendRequest(
      // path: 'api/v3/order/oco',
      path: 'sapi/v1/margin/order/oco',
      type: RequestType.POST,
      params: params,
      keyRequired: true,
      signatureRequired: true,
      timestampRequired: true,
    ).then((r) => r.isLeft ? Left(r.left) : Right(MarginOcoOrder.fromMap(r.right)));
  }

  /// Cancel an entire Order List.
  Future<Either<String, MarginOcoOrder>> cancelMarginOCO({
    required String symbol,
    int? orderListId,
    String? listClientOrderId,
    String? newClientOrderId,
    int? recvWindow,
    String isIsolated = 'TRUE',
  }) {
    Map<String, String> params = {
      'symbol': symbol,
    };
    if (orderListId != null) params['orderListId'] = orderListId.toString();
    if (listClientOrderId != null) {
      params['listClientOrderId'] = listClientOrderId;
    }
    if (newClientOrderId != null) params['newClientOrderId'] = newClientOrderId;
    if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
    return sendRequest(
      path: 'api/v3/orderList',
      type: RequestType.DELETE,
      params: params,
      keyRequired: true,
      signatureRequired: true,
      timestampRequired: true,
    ).then((r) => r.isLeft ? Left(r.left) : Right(MarginOcoOrder.fromMap(r.right)));
  }

  // /// Retrieves a specific OCO based on provided optional parameters
  // Future<Either<String, OcoOrder>> queryMarginOCO({
  //   int? orderListId,
  //   String? origClientOrderId,
  //   int? recvWindow,
  // }) {
  //   Map<String, String> params = {};
  //   if (orderListId != null) params['orderListId'] = orderListId.toString();
  //   if (origClientOrderId != null)
  //     params['origClientOrderId'] = origClientOrderId;
  //   if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
  //   return sendRequest(
  //     path: 'api/v3/orderList',
  //     type: RequestType.GET,
  //     params: params,
  //     keyRequired: true,
  //     signatureRequired: true,
  //     timestampRequired: true,
  //   ).then((r) => r.isLeft ? Left(r.left) : Right(OcoOrder.fromMap(r.right)));
  // }
  //
  // /// Retrieves all OCO based on provided optional parameters
  // Future<Either<String, List<OcoOrder>>> queryallMarginOCO({
  //   int? fromId,
  //   int? startTime,
  //   int? endTime,
  //   int? limit,
  //   int? recvWindow,
  // }) {
  //   Map<String, String> params = {};
  //   if (fromId != null) params['fromId'] = fromId.toString();
  //   if (startTime != null) params['startTime'] = startTime.toString();
  //   if (endTime != null) params['endTime'] = endTime.toString();
  //   if (limit != null) params['limit'] = limit.toString();
  //   if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
  //   return sendRequest(
  //     path: 'api/v3/allOrderList',
  //     type: RequestType.GET,
  //     params: params,
  //     keyRequired: true,
  //     signatureRequired: true,
  //     timestampRequired: true,
  //   ).then((r) => r.isLeft
  //       ? Left(r.left)
  //       : Right(List<OcoOrder>.from(r.right.map((e) => OcoOrder.fromMap(e)))));
  // }
  //
  // /// Query all currently open OCO orders.
  // Future<Either<String, List<OcoOrder>>> queryOpenMarginOCO({
  //   int? recvWindow,
  // }) {
  //   Map<String, String> params = {};
  //   if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
  //   return sendRequest(
  //     path: 'api/v3/openOrderList',
  //     type: RequestType.GET,
  //     keyRequired: true,
  //     signatureRequired: true,
  //     timestampRequired: true,
  //     params: params,
  //   ).then((r) => r.isLeft
  //       ? Left(r.left)
  //       : Right(List<OcoOrder>.from(r.right.map((e) => OcoOrder.fromMap(e)))));
  // }
  //
  // /// Get current account information.
  // Future<Either<String, AccountInfo>> accountMarginInformation({
  //   int? recvWindow,
  // }) {
  //   Map<String, String> params = {};
  //   if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
  //   return sendRequest(
  //     path: 'api/v3/account',
  //     type: RequestType.GET,
  //     keyRequired: true,
  //     signatureRequired: true,
  //     timestampRequired: true,
  //     params: params,
  //   ).then(
  //       (r) => r.isLeft ? Left(r.left) : Right(AccountInfo.fromMap(r.right)));
  // }
  //
  // /// Get trades for a specific account and symbol.
  // Future<Either<String, List<AccountTrade>>> accountMarginTradeList({
  //   required String symbol,
  //   int? orderId,
  //   int? startTime,
  //   int? endTime,
  //   int? fromId,
  //   int? limit,
  //   int? recvWindow,
  // }) {
  //   Map<String, String> params = {
  //     'symbol': symbol,
  //   };
  //   if (orderId != null) params['orderId'] = orderId.toString();
  //   if (startTime != null) params['startTime'] = startTime.toString();
  //   if (endTime != null) params['endTime'] = endTime.toString();
  //   if (fromId != null) params['fromId'] = fromId.toString();
  //   if (limit != null) params['limit'] = limit.toString();
  //   if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
  //   return sendRequest(
  //     path: 'api/v3/myTrades',
  //     type: RequestType.GET,
  //     params: params,
  //     keyRequired: true,
  //     signatureRequired: true,
  //     timestampRequired: true,
  //   ).then((r) => r.isLeft
  //       ? Left(r.left)
  //       : Right(List<AccountTrade>.from(
  //           r.right.map((e) => AccountTrade.fromMap(e)))));
  // }
}
