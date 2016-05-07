class BillsController < ApplicationController
	
	def index

		if params[:shop_id]
			@bills = Shop.find(params[:shop_id]).bills
		else
			@bills = Bill.all
		end

	end

	def show
		@bill = Bill.find(params[:id])
	end

	def new
		@bill = Bill.new
		@shops = Shop.all
	end

	def edit
		@bill = Bill.find(params[:id])
		@shops = Shop.all
	end

	def update
		@bill = Bill.find(params[:id])

		if @bill.update(bill_params)
			redirect_to bills_url
		else
			render 'edit'
		end
	end

	def create
		
		@bill = Bill.new(bill_params)
		
		if @bill.save
			redirect_to @bill
		else
			render 'new'
		end
	end

	def destroy
		@bill = Bill.find(params[:id])
		@bill.destroy

		redirect_to bills_path
	end

	private
		def bill_params
			params.require(:bill).permit(:name, :buy_date, :shop_id)
	end
end
