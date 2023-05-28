from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")
        self.selCol = BuiltIn().get_library_instance("Collections")

    @keyword
    def hello_world(self):
        print("hello")

    @keyword
    def add_items_to_cart_and_checkout(self, productsList):
        # Get WebElements
        i = 1
        productsTitles = self.selLib.get_webelements(" css:.card-title")
        for productsTitle in productsTitles:
            if productsTitle.text in productsList:
                self.selLib.click_button("xpath:(//*[@class='card-footer'])["+str(i)+"]/button")

            i = i + 1

        self.selLib.click_link("css:li.active a")
    @keyword
    def Verify_product_added_in_checkout_list_and_proceed(self, productsList,Prdaddedtocart):

             PrdaddedCheckout = self.selLib.get_webelements("css:.media-heading a")
             print(PrdaddedCheckout)
             for PrdaddedCheckout_1 in PrdaddedCheckout:
                  if PrdaddedCheckout_1.text in productsList:
                        self.selCol.append_to_list(Prdaddedtocart, PrdaddedCheckout_1.text)
             self.selCol.lists_should_be_equal(productsList, Prdaddedtocart)
             self.selLib.click_element("css:.btn-success")








