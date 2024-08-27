/// code : 200
/// success : true
/// timestamp : 1724780277429
/// message : "Paginated Response"
/// items : [{"_id":"66cdc049d31d1b8904359a85","title":"string","description":"string","is_completed":false,"created_at":"2024-08-27T12:02:17.052Z","updated_at":"2024-08-27T12:02:17.052Z"},{"_id":"66cdc198d31d1b8904359a8b","title":"Titilte","description":"adfddgdg","is_completed":false,"created_at":"2024-08-27T12:07:52.145Z","updated_at":"2024-08-27T12:07:52.145Z"},{"_id":"66cdc2b6d31d1b8904359a8d","title":"Titilte","description":"adfddgdg","is_completed":false,"created_at":"2024-08-27T12:12:38.490Z","updated_at":"2024-08-27T12:12:38.490Z"},{"_id":"66cdf9cb98db0688369c8762","title":"Donw with the notes app ","description":"Doing it very tight ","is_completed":false,"created_at":"2024-08-27T16:07:39.219Z","updated_at":"2024-08-27T16:07:39.219Z"},{"_id":"66cdf9cd98db0688369c8764","title":"Donw with the notes app ","description":"Doing it very tight ","is_completed":false,"created_at":"2024-08-27T16:07:41.274Z","updated_at":"2024-08-27T16:07:41.274Z"},{"_id":"66cdf9d798db0688369c8766","title":"Donw with the notes app ","description":"Doing it very tight ","is_completed":false,"created_at":"2024-08-27T16:07:51.009Z","updated_at":"2024-08-27T16:07:51.009Z"},{"_id":"66cdfbb598db0688369c8768","title":"gfdgdfg","description":"dgdfgdf","is_completed":false,"created_at":"2024-08-27T16:15:49.230Z","updated_at":"2024-08-27T16:15:49.230Z"},{"_id":"66cdfbc998db0688369c876a","title":"vcv","description":"cvcvcv","is_completed":false,"created_at":"2024-08-27T16:16:09.011Z","updated_at":"2024-08-27T16:16:09.011Z"},{"_id":"66cdfbd598db0688369c876c","title":"cvcvcv","description":"cvcv","is_completed":false,"created_at":"2024-08-27T16:16:21.233Z","updated_at":"2024-08-27T16:16:21.233Z"},{"_id":"66ce00bb98db0688369c8772","title":"xcxc","description":"xzCc","is_completed":false,"created_at":"2024-08-27T16:37:15.216Z","updated_at":"2024-08-27T16:37:15.216Z"}]
/// meta : {"total_items":10,"total_pages":1,"per_page_item":10,"current_page":1,"page_size":10,"has_more_page":false}

class TodoResponseModel {
  TodoResponseModel({
    required this.code,
    required this.success,
    required this.timestamp,
    required this.message,
    required this.items,
    required this.meta,
  });

  factory TodoResponseModel.fromJson(Map<String, dynamic> json) {
    return TodoResponseModel(
      code: json['code'],
      success: json['success'],
      timestamp: json['timestamp'],
      message: json['message'],
      items: List<Items>.from(json['items'].map((x) => Items.fromJson(x))),
      meta: Meta.fromJson(json['meta']),
    );
  }

  final num code;
  final bool success;
  final num timestamp;
  final String message;
  final List<Items> items;
  final Meta meta;

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'success': success,
      'timestamp': timestamp,
      'message': message,
      'items': List<dynamic>.from(items.map((x) => x.toJson())),
      'meta': meta.toJson(),
    };
  }

  TodoResponseModel copyWith({
    num? code,
    bool? success,
    num? timestamp,
    String? message,
    List<Items>? items,
    Meta? meta,
  }) {
    return TodoResponseModel(
      code: code ?? this.code,
      success: success ?? this.success,
      timestamp: timestamp ?? this.timestamp,
      message: message ?? this.message,
      items: items ?? this.items,
      meta: meta ?? this.meta,
    );
  }
}

/// total_items : 10
/// total_pages : 1
/// per_page_item : 10
/// current_page : 1
/// page_size : 10
/// has_more_page : false
class Meta {
  Meta({
    required this.totalItems,
    required this.totalPages,
    required this.perPageItem,
    required this.currentPage,
    required this.pageSize,
    required this.hasMorePage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      totalItems: json['total_items'],
      totalPages: json['total_pages'],
      perPageItem: json['per_page_item'],
      currentPage: json['current_page'],
      pageSize: json['page_size'],
      hasMorePage: json['has_more_page'],
    );
  }

  final num totalItems;
  final num totalPages;
  final num perPageItem;
  final num currentPage;
  final num pageSize;
  final bool hasMorePage;

  Map<String, dynamic> toJson() {
    return {
      'total_items': totalItems,
      'total_pages': totalPages,
      'per_page_item': perPageItem,
      'current_page': currentPage,
      'page_size': pageSize,
      'has_more_page': hasMorePage,
    };
  }

  Meta copyWith({
    num? totalItems,
    num? totalPages,
    num? perPageItem,
    num? currentPage,
    num? pageSize,
    bool? hasMorePage,
  }) {
    return Meta(
      totalItems: totalItems ?? this.totalItems,
      totalPages: totalPages ?? this.totalPages,
      perPageItem: perPageItem ?? this.perPageItem,
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      hasMorePage: hasMorePage ?? this.hasMorePage,
    );
  }
}

/// _id : "66cdc049d31d1b8904359a85"
/// title : "string"
/// description : "string"
/// is_completed : false
/// created_at : "2024-08-27T12:02:17.052Z"
/// updated_at : "2024-08-27T12:02:17.052Z"
class Items {
  Items({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['is_completed'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final String createdAt;
  final String updatedAt;

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'is_completed': isCompleted,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  Items copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    String? createdAt,
    String? updatedAt,
  }) {
    return Items(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
