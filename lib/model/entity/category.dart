class Category {
  final int categoryId;
  final String title;
  final String imageUrl;
  final int hasSubcategories;
  final String fullName;
  final String? categoryDescription;

  Category(
      {required this.categoryId,
      required this.title,
      required this.imageUrl,
      required this.hasSubcategories,
      required this.fullName,
      this.categoryDescription});
}
