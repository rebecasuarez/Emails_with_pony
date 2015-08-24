require 'pony'

file = open("correo.txt")

Pony.mail({
  :to => 'matthew@tourismtiger.com',
  :body => file.read,
  :attachments => {"archivoadjunto" => File.read("correo.txt"), "archivoadjunto2.txt" => File.read("correo.txt")},
  :subject => 'Correo de Rebe',
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