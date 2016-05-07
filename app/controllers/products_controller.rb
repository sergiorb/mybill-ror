class ProductsController < ApplicationController
	
	def index

		if params[:bill_id]
			@products = Bill.find(params[:bill_id]).products
		else
			@products = Product.all
		end

	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
		@bills = Bill.all
	end

	def edit
		@product = Product.find(params[:id])
		@bills = Bill.all
	end

	def update
		@product = Product.find(params[:id])

		if @product.update(product_params)
			redirect_to products_url
		else
			render 'edit'
		end
	end

	def create
		
		@product = Product.new(product_params)
		
		if @product.save
			redirect_to @product
		else
			render 'new'
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy

		redirect_to products_path
	end

	private
		def product_params
			params.require(:product).permit(:name, :quantity, :quantity_type, :price, :bill_id)
	end
end
