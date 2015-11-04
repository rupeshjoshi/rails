class HomeController < ApplicationController
	def index
      @user = User.order(name: :asc)


	end

	def show
      @user = User.find(params[:id])
      @a = User.find([1,5])
      @takeuser=User.take(2)
      #@takeuser = User.take
      @firstuser = User.first(3)
      #@lastuser = User.last
      @lastuser = User.last(3)
      @find_byuser = User.find_by name:'Saurav'
      @batch = User.all
      @for_each = User.find_each
      @batch_user = User.find_each(batch_size: 2)
      @startbatch_user= User.find_each(start: 2, batch_size: 3)
      #@fib_user = User.find_in_batches 
      #@user_count = User.where("name= ?", params[:name])
      #@user_where = User.where("created_at >= :start_date AND created_at <= :end_date",
      #			            {start_date: params[:start_date], end_date: params[:end_date]})
      @where_user = User.where(id: 2)
      #user_created = User.where(created_at: (Time.now.midnight - 5.day)..Time.now.midnight)
      @subset_user = User.where(id: [1,3,5])
      @not_user = User.where.not(id: 5)
      @order_user = User.order( "name asc")
      @select_user= User.select("name, city")
	end
end

