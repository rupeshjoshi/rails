class HomeController < ApplicationController
	def index
      @user = User.order(name: :asc)


	end

	def show
      @user = User.find(params[:id])
      @a = User.find([1,5])
      #@takeuser=User.take(2)
      @takeuser = User.take
      @firstuser = User.first(3)
      @lastuser = User.last
      #@lastuser = User.last(3)
      @find_byuser = User.find_by name:'Saurav'
	end
end

