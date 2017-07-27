require("bundler/setup")
 Bundler.require(:default)
 Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
 also_reload("lib/**/*.rb")

 get('/') do
   erb(:index)
 end

 post('/stores') do
   name = params.fetch("name")
   store = Store.new(:name =>name)
   store.save()
   @stores = Store.all()
   redirect to ('/')
 end

 get('/stores') do
   @stores = Store.all()
   erb(:stores)
 end

 get("/stores/:id") do
  @store = Store.find(params.fetch("id").to_i())
  erb(:store)
end

 get('/brands') do
  @brands = Shoe.all()
   erb(:brands)
 end

 post('/brands') do
  name = params.fetch("name")
  @brand = Shoe.new(:name =>name)
  @brand.save()
  @shoes = Shoe.all()
  redirect '/brands'
 end

 get ('/store/new') do
  erb(:store_form)
end

get('/brand/new') do
  erb(:brand_form)
end

get '/stores/:id/edit' do
@store = Store.find(params.fetch("id").to_i)
erb(:edit)
end

patch '/stores/:id' do
  @store = Store.find(params.fetch("id").to_i)
  @store_name = params.fetch('name')
  @store.name = @store_name
  @store.update(name: @store_name)
  redirect '/'
end

delete('/stores/:id/delete') do
  @stores = Store.all
  @store = Store.find(params.fetch("id").to_i)
  @store.destroy
  erb(:stores)
end

get '/brands/:id' do
  @brand = Shoe.find(params.fetch("id").to_i())
  erb(:brand)
end

get '/brands/:id/edit' do
@brand = Shoe.find(params.fetch("id").to_i)
erb(:edit_brand)
end

patch '/brands/:id' do
  @brand = Shoe.find(params.fetch("id").to_i)
  @brand_name = params.fetch('name')
  @brand.name = @brand_name
  @brand.update(name: @brand_name)
  redirect '/'
end

delete('/brands/:id/delete') do
  @brands = Shoe.all
  @brand = Shoe.find(params.fetch("id").to_i)
  @brand.destroy
  erb(:brands)
end

 #used bundler to require all of our gems for us rather than listing them individually in each file
 #used Dir class as a file loading shortcut to navigate to the directories with files that need to be required
 #__FILE__ refers to current file and File.dirname(__FILE__) will give current directory
