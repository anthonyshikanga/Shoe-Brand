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
   erb(:brands)
 end

 get('/stores/new') do
   erb(:store_form)
 end




 #used bundler to require all of our gems for us rather than listing them individually in each file
 #used Dir class as a file loading shortcut to navigate to the directories with files that need to be required
 #__FILE__ refers to current file and File.dirname(__FILE__) will give current directory
