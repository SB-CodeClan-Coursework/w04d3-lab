require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

get '/students/?' do
  @students = Student.all
  erb(:index)
end

get '/students/new/?' do
  @houses = House.all
  erb(:new)
end

get '/students/:id' do
  @student = Student.find(params[:id])
  erb(:show)
end

# create

post '/students' do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end

# edit

get '/students/:id/edit' do
  @student = Student.find(params[:id])
  @houses = House.all
  erb(:edit)
end

# update

post '/students/:id' do
  Student.new(params).update
  redirect to '/students'
end

# destroy

# get '/students/delete' do
#   erb(:delete)
# end

post '/students/:id/delete' do
  @student = Student.find(params[:id])
  @student.delete()
  redirect to '/students'
end
