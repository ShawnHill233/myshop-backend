module Spree::Admin
  class BannersController < ResourceController
    before_action only: [:edit, :update]
    def index
      @banners = Spree::Banner.all
    end

    def new
      @banner = Spree::Banner.new
      @banner.image = Spree::Image.new
    end

    def create
      @banner = Spree::Banner.new(banner_params)
      @banner.image = Spree::Image.new({attachment: params[:attachment]})
      if @banner.save
        redirect_to admin_banners_url
      end
    end

    def edit
    end

    def update
      @banner.update(banner_params)
      @banner.image.update({attachment: params[:attachment]})
      redirect_to admin_banners_url
    end

    private
    def set_banner
      @banner = Spree::Banner.find(params[:id])
    end

    def banner_params
      params[:banner].permit!
    end

  end
end

