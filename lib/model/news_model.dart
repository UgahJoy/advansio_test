class AllNewsModel {
  final String? articleId;
  final String? title;
  final String? link;
  final List<String>? keywords;
  final List<String>? creator;
  final String? description;
  final String? content;
  final DateTime? pubDate;
  final String? pubDateTz;
  final String? imageUrl;
  final dynamic videoUrl;
  final String? sourceId;
  final String? sourceName;
  final int? sourcePriority;
  final String? sourceUrl;
  final String? sourceIcon;
  final String? language;
  final List<String>? country;
  final List<String>? category;
  final String? sentiment;
  final String? sentimentStats;
  final String? aiTag;
  final String? aiRegion;
  final String? aiOrg;
  final String? aiSummary;
  final String? aiContent;
  final bool? duplicate;

  AllNewsModel({
    this.articleId,
    this.title,
    this.link,
    this.keywords,
    this.creator,
    this.description,
    this.content,
    this.pubDate,
    this.pubDateTz,
    this.imageUrl,
    this.videoUrl,
    this.sourceId,
    this.sourceName,
    this.sourcePriority,
    this.sourceUrl,
    this.sourceIcon,
    this.language,
    this.country,
    this.category,
    this.sentiment,
    this.sentimentStats,
    this.aiTag,
    this.aiRegion,
    this.aiOrg,
    this.aiSummary,
    this.aiContent,
    this.duplicate,
  });

  factory AllNewsModel.fromJson(Map<String, dynamic> json) => AllNewsModel(
    articleId: json["article_id"],
    title: json["title"],
    link: json["link"],
    keywords: json["keywords"] == null
        ? []
        : List<String>.from(json["keywords"]!.map((x) => x)),
    creator: json["creator"] == null
        ? []
        : List<String>.from(json["creator"]!.map((x) => x)),
    description: json["description"],
    content: "content",
    pubDate: json["pubDate"] == null ? null : DateTime.parse(json["pubDate"]),
    pubDateTz: "pubDateTZ",
    imageUrl: json["image_url"],
    videoUrl: json["video_url"],
    sourceId: json["source_id"],
    sourceName: json["source_name"],
    sourcePriority: json["source_priority"],
    sourceUrl: json["source_url"],
    sourceIcon: json["source_icon"],
    language: json["language"],
    country: json["country"] == null
        ? []
        : List<String>.from(json["country"]!.map((x) => x)),
    category: json["category"] == null
        ? []
        : List<String>.from(json["category"]!.map((x) => x)),
    sentiment: "sentiment",
    sentimentStats: "sentiment_stats",
    aiTag: "ai_tag",
    aiRegion: "ai_region",
    aiOrg: "ai_org",
    aiSummary: "ai_summary",
    aiContent: "ai_content",
    duplicate: json["duplicate"],
  );

  Map<String, dynamic> toJson() => {
    "article_id": articleId,
    "title": title,
    "link": link,
    "keywords": keywords == null
        ? []
        : List<dynamic>.from(keywords!.map((x) => x)),
    "creator": creator == null
        ? []
        : List<dynamic>.from(creator!.map((x) => x)),
    "description": description,
    "content": content,
    "pubDate": pubDate?.toIso8601String(),
    "pubDateTZ": pubDateTz,
    "image_url": imageUrl,
    "video_url": videoUrl,
    "source_id": sourceId,
    "source_name": sourceName,
    "source_priority": sourcePriority,
    "source_url": sourceUrl,
    "source_icon": sourceIcon,
    "language": language,
    "country": country == null
        ? []
        : List<dynamic>.from(country!.map((x) => x)),
    "category": category == null
        ? []
        : List<dynamic>.from(category!.map((x) => x)),
    "sentiment": sentiment,
    "sentiment_stats": sentimentStats,
    "ai_tag": aiTag,
    "ai_region": aiRegion,
    "ai_org": aiOrg,
    "ai_summary": aiSummary,
    "ai_content": aiContent,
    "duplicate": duplicate,
  };
}
