resource "azurerm_app_service_plan" "test" {
  name                = "app-service-plan"-"${var.qa}"
  location            = "${var.resource}"
  resource_group_name = "${var.resource_group}"

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "test" {
  name                = "app-service"-"${var.qa}"
  location            = "${var.resource}"
  resource_group_name = "${var.resource_group}"
  app_service_plan_id = azurerm_app_service_plan.test.id

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = 0
  }
  tags = "${var.tags}"
}