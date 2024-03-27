class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @title = "自動料金表示プログラム"
    @description = "タブを選択すると非同期処理で自動的に料金が表示されます"
    @contents = Service.where(category_id: 1)
  end

  def show
    @orders = Order.all
  end

  private

  def get_services_content
    item_services_details = []
    @orders.each do |order|
      order.items.each do |item|
        item.services.each do |service|
          item_service_detail = { name: service.name, price: service.price }
          item_services_details.push(item_service_detail)
        end
      end
    end
    item_services_details
  end
end

def get_contents
  {
    outer_links: [
      {
        name: "Qiitaページ",
        text: "Qiita",
        url: "https://qiita.com/t0yohei/items/cd11b15642fbb26f71e2",
      },
      {
        name: "ソースコード",
        text: "GitHub",
        url: "https://github.com/t0yohei/rails-vue3-app",
      },
    ],
  }
end