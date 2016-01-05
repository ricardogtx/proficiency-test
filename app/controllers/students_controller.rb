class StudentsController < ApplicationController

 before_action :set_student, only: [:show, :edit, :update, :destroy]


def index
  @students = Student.all
end

def new
  @student = Student.new
end

def create
 @student = Student.new(student_params)
  respond_to do |format|
    if @student.save
      format.html { redirect_to @student, notice: 'Estudante criado com sucesso.' }
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
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Estudante atualizado.' }
      else
        format.html { render :edit }
      end
    end
end

def destroy
  @student.destroy
    respond_to do |format|
    format.html { redirect_to students_url, notice: 'Estudante excluído com sucesso.' }
    end
end

private

  def set_student
    @student= Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :register_number, :status )
  end



end
