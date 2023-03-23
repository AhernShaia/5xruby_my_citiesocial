class Admin::ProductsController < Admin::BaseController
    before_action :find_product_params, only:[:edit, :update, :destroy]
    

    def index
        @products = Product.all.includes(:vendor)
        @pagy, @products = pagy(Product.all)
    end

    def suggest
        @suggest = Product.recommended_type(params[:id], params[:type])
        @pagy, @suggest = pagy(Product.recommended_type(params[:id], 
               params[:type]), page: params[:page], items: params[:size])
      end

    def new
        @product = Product.new
        @product.skus.build
    end

    def create
        @product = Product.new(product_params)
        if @product.save
             redirect_to admin_products_path, notice: '新增成功'
        else
            render :new
        end
    end

    def edit
    end

    def update
    if @product.update(product_params)
      redirect_to edit_admin_product_path(@product), notice: '商品已更新'
    else
      render :edit
    end
  end

    def destroy
        @product.destroy
        redirect_to admin_products_path, notice: "#{@product.name}已刪除"
    end

    private

    def find_product_params
        @product = Product.friendly.find(params[:id])
    end

    def product_params
        params.require(:product).permit(:name, 
                                        :list_price, 
                                        :sell_price, 
                                        :on_sell, 
                                        :vendor_id,
                                        :description,
                                        skus_attributes: [ :id, :spec, :quantity, :_destroy, :NEW_RECORD]    
                                    )
        
    end
end

