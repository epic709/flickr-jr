enable :sessions

get '/' do
  @photos = Photo.all
  erb :index
end


get '/upload' do
  haml :upload
end

post '/upload' do
byebug
  if params[:new_album_title] == nil
    cur_album = User.find(session[:u_id]).albums.create(title: params[:new_album_title])
  else
    cur_album = Album.find(params[:album])
  end

  params['myfiles'].map do |f|
    p = cur_album.photos.new
    p.avatar = f
    p.save!
  end

  redirect to "/user/#{session[:u_id]}/album/#{cur_album.id}"
end

post '/login' do
  user = User.where(username: params[:username], password: params[:password]).first
  if user.nil?
    redirect to '/'
  else
    session[:u_id] = user.id
    redirect to "/user/#{user.id}/album/#{user.albums.first.id}"
  end
end

post '/signup' do
 user = User.create(username: params[:username], password: params[:password])
 user.albums.create(title: "Default album")

 redirect to "/user/#{user.id}/album/#{user.albums.first.id}"
end

get '/user/:u_id/album/:a_id' do
  @user = User.find(params[:u_id])
  @albums = @user.albums.all
  @photos = Album.find(params[:a_id]).photos.all
  erb :album
end

post '/logout' do
  session.clear
  redirect to '/'
end