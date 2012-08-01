class KelloCommonService {

    boolean transactional = false

    def allProductCategories() {
        ProductCategory.list()
    }
}
