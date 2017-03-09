
get '/' do
  erb :"static/index"
end

post '/urls' do
	#create a new url
	
	url = params[:long_url]
	new_url = Url.new(long_url: url)

	if new_url.valid?
		new_url.shorten
		new_url.save
	end

	redirect '/'
end


# i.e. /q6bda
get '/:short_url' do
	# redirect to appropriate 'long' url
	url = Url.find_by(short_url: params[:short_url])
	temp = url.long_url.gsub(/(https?:\/\/|www.)/, '')
	add_count = url.click_count + 1
	url.update(click_count: add_count)
	redirect "http://www.#{temp}"
end	

