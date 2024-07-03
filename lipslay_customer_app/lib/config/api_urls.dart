class ApiUrls {
  static const String baseUrl = 'https://lipslay.com/';
  static const String appDataUrl = baseUrl + 'AppData.json';
  static String subCategoriesUrl(int categoryId) =>
      baseUrl + 'api/subCategories?id=$categoryId';
}