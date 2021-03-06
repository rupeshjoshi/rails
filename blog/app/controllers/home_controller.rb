class HomeController < ApplicationController
	def index
      @user = User.order(name: :asc)


	end

	def show
      @user = User.find(params[:id])
      @a = User.find([1,2])
      @takeuser = User.take(2)
      #@takeuser = User.take
      @firstuser = User.first(3)
      #@lastuser = User.last
      @lastuser = User.last(3)
      @find_byuser = User.find_by name:'Saurav'
      @batch = User.all
      @for_each = User.find_each
      @batch_user = User.find_each(batch_size: 2)
      @startbatch_user = User.find_each(start: 2, batch_size: 3)
      #@fib_user = User.find_in_batches 
      #@user_count = User.where("name= ?", params[:name])
      #@user_where = User.where("created_at >= :start_date AND created_at <= :end_date",
      #			            {start_date: params[:start_date], end_date: params[:end_date]})
      @where_user = User.where(id: 2)
      #user_created = User.where(created_at: (Time.now.midnight - 5.day)..Time.now.midnight)
      @subset_user = User.where(id: [1,3,5])
      @not_user = User.where.not(id: 5)
      @order_user = User.order( "name asc")
      @select_user = User.select("name, city")
      @distinct_user = User.select(:name).distinct
      @limit_user = User.limit(4)
      @group_user = User.select("date(created_at) as ordered_date, city as address").group("date(created_at)")
      @grouptotal_user = User.group(:city).count
      @having_user = User.select("date(created_at) as ordered_date, count(city) as total").
                          group("date(created_at)").having("count(city) > ?", 2)

      @unscope_user = User.where('id < 10').limit(2).order('id asc').unscope(:order)
      @only_user = User.where('id < 10').limit(4).order('id desc').only(:order, :where)
      @reverse_user = User.where("id < 10").order(:name).reverse_order
      @join_user = User.joins('RIGHT OUTER JOIN articals ON articals.user_id = users.id')
      @inner_join = User.joins(:articals)
      @multiplejoin = Artical.joins(:user, :comments)
      @nested_join = User.joins(articals: :comments)
      @joins_user = User.joins(:articals)
      @ncity_user = User.includes(:articals).limit(3)
      @massociation = Artical.includes(:user, :comments)
      @association = Artical.includes(:comments).where(comments: { id: 2 })
      @findcreate_user = User.find_or_create_by(name: 'Shyam')
      @selectall= User.connection.select_all("SELECT name, created_at FROM users WHERE id = '1'")
      @pluck = User.distinct.pluck(:city)
      @pluck1 = User.pluck(:id, :name)
      #@exist = User.exists?(id: [1,2,3])

      # User.where(name: 'Jon').count
      #User.where(city: 'Mumbai').count

      #User.sum("id")

      #User.average("id")

	end


  def file
  end
 
  def search 
        @new_user = User.create(:name => params[:name],:city=> params[:city] ,:gender=> params[:gender])  
  end 

  def update_user

  end

  def update
    @user = User.find(params[:id])
  end
      
  def update_perform
    @user = User.find(params[:id])
    @user.update(:id => params[:id], :name => params[:name],:city=> params[:city] ,:gender=> params[:gender])
  end

  def create
    @new_user = User.create(:name => params[:user][:name],:city=> params[:user][:city] ,:gender=> params[:user][:gender]) 
  end
      
  def create_user
    @new_user=User.new
  end


  def delete_user
  end

  def delete_perform
    @delete_user= User.find(params[:id])
  end

  def z
            
    unless  params[:direction].blank? || params[:sort].blank? || params[:name].blank? 
      @user = User.find_by(name: params[:name]).order(params[:sort] + ' ' + params[:direction])
         
    else
      params[:direction].blank? ? "asc" : params[:direction]  and params[:sort].blank? ? "name" : params[:sort] and params[:name].blank? ? "1" :params[:name]
      @user = User.order(params[:sort] + ' ' + params[:direction])
    end 
  end 

  def texteditor
    
  end
        
  def find
    redirect_to "/all_users?name=#{params[:name]}" 
  end  
  
  def all_users 
    if params[:direction].present? and params[:sort].present? and params[:name].present?  
      @user = User.where(name: params[:name]).order(params[:sort] + ' ' + params[:direction])
    elsif 
      params[:direction].blank? and params[:sort].blank? and params[:name].present? 
      params[:direction] = "asc"
      params[:sort] = "name" 
      @user = User.where(name: params[:name]).order(params[:sort] + ' ' + params[:direction])
    elsif params[:direction].present? and params[:sort].present? and params[:name].blank?  
      params[:name] = "1"
      @user = User.order(params[:sort] + ' ' + params[:direction])
    elsif params[:direction].blank? and params[:sort].blank? and params[:name].blank? 
      params[:direction] = "asc"
      params[:sort] = "name" 
      params[:name] = "1"
      @user = User.order(params[:sort] + ' ' + params[:direction])
    end
  end 
 
  def whatever
  end
  
  #require 'rubygems'
  #require 'pdfcrowd'

  
  def convert
    begin
    # create an API client instance
    client = Pdfcrowd::Client.new("username", "apikey")

    # convert a web page and store the generated PDF to a variable
      pdf = client.convertHtml("<head></head><body>My HTML Layout</body>")

    # send the generated PDF
    send_data(pdf, 
              :filename => "google_com.pdf",
              :type => "application/pdf",
              :disposition => "attachment")
    rescue Pdfcrowd::Error => why
      render :text => why
    end
  end
  
  def editor
    @post = User.new;
  end

  def pdf
    @data = params[:editor1]
   # @data = "<html>"+ @data + "</html>"
    kit = PDFKit.new(@data, :page_size => 'A4')

    #kit.stylesheets  =  ["#{Rails.root}/app/assets/stylesheets/info.css"]

    
    # Get an inline PDF
    pdf = kit.to_pdf

    # Save the PDF to a file
    file = kit.to_file("#{Rails.root}/pdf/file.pdf") 
    #file=("/home/berylsystems/Desktop/file.pdf")
    # PDFKit.new can optionally accept a URL or a File.
    # Stylesheets can not be added when source is provided as a URL of File.
   #kit = PDFKit.new('http://google.com')
    #kit = PDFKit.new(File.new('/Desktop'))
  end  

  def generatepdf
    @data = params[:editor1]
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
      end
    end

  end


end







