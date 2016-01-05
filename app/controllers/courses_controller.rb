class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]


def index
 @courses = Course.all
end

def new
 @course = Course.new
end

def create
@course = Course.new(course_params)
 respond_to do |format|
   if @course.save
     format.html { redirect_to @course, notice: 'Curso criado com sucesso.' }
   else
     format.html { render :new }
   end
 end
end

def show

end

def edit

end

def update
 respond_to do |format|
     if @course.update(course_params)
       format.html { redirect_to @course, notice: 'Curso atualizado.' }
     else
       format.html { render :edit }
     end
   end
end

def destroy
 @course.destroy
   respond_to do |format|
   format.html { redirect_to courses_url, notice: 'Curso excluído com sucesso.' }
   end
end


private

 def set_course
   @course= Course.find(params[:id])
 end

 def course_params
   params.require(:course).permit(:name, :description, :status)
 end

end
