get '/' do
  erb :"static/index"
end

post '/urls' do
  ori_url = Url.new(long_url: params[:long_url])
  # ori_url.save

  if ori_url.save
    # redirect '/'
    {success: true, long_url: ori_url.long_url, short_url: ori_url.short_url}.to_json
  else
    @errors = ori_url.errors.messages
    # erb :"static/index"
    {success: false}.to_json
  end
end

get '/:short_url' do
  #should redirect to appropriate long url
  url = Url.find_by(short_url: params[("short_url")])
  url.click_counter += 1
  url.save
  redirect url.long_url
end
