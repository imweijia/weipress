# New post
get '/post/new' do
  # @post = Post.find(params[:id])
  erb :newpost
end

post '/post/new' do
  @post = Post.new(params[:post])
  # puts params[:tag][:name]
  params[:tag][:name].split(", ").each do |tag_name|
    tag = Tag.find_or_create_by_name(tag_name)
    @post.tags << tag
  end
  if @post.save
    redirect to("/post/#{@post.id}")
  end
end

# View post
get '/post/:id' do
  @post = Post.find(params[:id])
  @tags = @post.tags
  erb :show_newpost
end


# Edit post
get '/post/:id/edit' do
  @post = Post.find(params[:id])
  @tag_names = ""
  @post.tags.each do |t|
    @tag_names += t.name + ", "
  end

  erb :edit_post
end

put '/post/:id' do
  @post = Post.find(params[:id])
  @post.update_attributes(params[:post])
  @post.tags.clear
  params[:tag][:name].delete(" ").split(",").each do |tag_name|
    tag = Tag.find_or_create_by_name(tag_name)
    @post.tags << tag
  end
  redirect to("/post/#{@post.id}")
end


# Delete post
get '/delete/:id' do
  Post.find(params[:id]).destroy
  redirect to("/")
end
