class GalleryModel {
  final String ? id;
  final String? name;
  final String? globalGalleryCategoryId;
  final int? docType;
  final int? uid;
  final int? type;
  final String? url;
  final String? createdUserId;
  final int? createdAt;
  final int? updatedAt;
  final int? status;
  final int? v;

  GalleryModel({
    this.id,
    this.name,
    this.globalGalleryCategoryId,
    this.docType,
    this.uid,
    this.type,
     this.url,
    this.createdUserId,
    this.createdAt,
     this.updatedAt,
     this.status,
    this.v,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) {
    return GalleryModel(
      id: json['_id'] ?? '',
      name: json['_name'] ?? '',
      globalGalleryCategoryId: json['_globalGalleryCategoryId'] ?? '',
      docType: json['_docType'] ?? 0,
      uid: json['_uid'] ?? 0,
      type: json['_type'] ?? 0,
      url: json['_url'] ?? '',
      createdUserId: json['_createdUserId'] ?? '',
      createdAt: json['_createdAt'] ?? 0,
      updatedAt: json['_updatedAt'] ?? 0,
      status: json['_status'] ?? 0,
      v: json['__v'] ?? 0,
    );
  }
}
