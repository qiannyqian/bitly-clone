get '/' do
  erb :"static/index"
end

get '/new' do
  erb :"static/new_page"
end

post '/urls' do
  ori_url = Url.new(long_url: params[:long_url])
  ori_url.save
  
  if ori_url.save
    redirect '/'
  end
end

get '/:short_url' do
  #should redirect to appropriate long url
end
