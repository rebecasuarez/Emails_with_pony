require 'sinatra'
require 'pony'

get '/' do
	send_file File.join(settings.public_folder, 'index.html')
end

post '/contact' do

	Pony.mail({
	  :to => 'rebecavsuarez@gmail.com',
	  :from => params[:from],
	  :body => params[:message],
	  :subject => params[:name],
	  :via => :smtp,
	  :via_options => {
	    :address              => 'smtp.gmail.com',
	    :port                 => '587',
	    :enable_starttls_auto => true,
	    :user_name            => 'rebecavsuarez@gmail.com',
	    :password             => 'Citation2013',
	    :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
	    :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
	  }
	})

file = open("correo.txt","w")
file.write(params[:from] +"," + params[:message] + "," + params[:name])
file.close
   #send_file File.join(settings.public_folder, 'index.html')
   redirect to("/")
end