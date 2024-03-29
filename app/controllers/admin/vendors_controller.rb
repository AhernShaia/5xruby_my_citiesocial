class Admin::VendorsController < Admin::BaseController
    before_action :find_vendor,only: [:edit, :update, :show, :destroy]

    def index
        @vendors = Vendor.all
    end

    def new
        @vendor = Vendor.new
    end

    def create
        @vendor = Vendor.new(vendor_params)
        if @vendor.save
            redirect_to admin_vendors_path, notice: '新增成功'
        else
            render :new
        end
    end

    def edit

    end

    def update
        if @vendor.update(vendor_params)
            redirect_to edit_admin_vendor_path(@vendor), notice: '修改成功'
        else
            render :edit
        end
    end

    def destroy
        # @vendor.updated( order: :desc)
        if @vendor.destroy
            redirect_to  admin_vendors_path, notice: "#{@vendor.title}已刪除"
        else
        
        end
    end

    private
    def find_vendor
        @vendor = Vendor.find(params[:id])
    end

    def vendor_params
        params.require(:vendor).permit(:title, :description, :online)
    end

end
