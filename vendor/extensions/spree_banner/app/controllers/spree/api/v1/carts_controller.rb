module Spree
  module Api
    module V1
      class CartsController < Spree::Api::BaseController
        include Spree::Core::ControllerHelpers::Order

        def index
          @order = current_order || Order.incomplete.
              includes(line_items: [variant: [:images, :option_values, :product]]).
              find_or_initialize_by(guest_token: cookies.signed[:guest_token])
        end

        #添加商品到购物车
        def populate
          @order    = current_order(create_order_if_necessary: true)
          variant  = Spree::Variant.find(params[:variant_id])
          quantity = params[:quantity].to_i
          options  = params[:options] || {}

          # 2,147,483,647 is crazy. See issue #2695.
          if quantity.between?(1, 2_147_483_647)
            begin
              @order.contents.add(variant, quantity, options)
              @order.update_line_item_prices!
              @order.create_tax_charge!
              @order.update_with_updater!
            rescue ActiveRecord::RecordInvalid => e
              @error = e.record.errors.full_messages.join(', ')
            end
          else
            @error = Spree.t(:please_enter_reasonable_quantity)
          end
        end

        def update
          @variant = Spree::Variant.find(params[:variant_id]) if params[:variant_id]
          if @order.contents.update_cart(order_params)
            respond_with(@order) do |format|
              format.html do
                if params.key?(:checkout)
                  @order.next if @order.cart?
                  redirect_to checkout_state_path(@order.checkout_steps.first)
                else
                  redirect_to cart_path
                end
              end
            end
          else
            respond_with(@order)
          end
        end

        def delete
          @variant = Spree::Variant.find(params[:variant_id]) if params[:variant_id]
          if @order.contents.update_cart(order_params)
            respond_with(@order) do |format|
              format.html do
                if params.key?(:checkout)
                  @order.next if @order.cart?
                  redirect_to checkout_state_path(@order.checkout_steps.first)
                else
                  redirect_to cart_path
                end
              end
            end
          else
            respond_with(@order)
          end
        end

      end
    end
  end
end
