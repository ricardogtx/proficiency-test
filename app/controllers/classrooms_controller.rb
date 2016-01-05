class ClassroomsController < ApplicationController

     before_action :set_classroom, only: [:show, :edit, :update, :destroy]


    def index
      @classrooms = Classroom.all
    end

    def new
      @classroom = Classroom.new
    end

    def create
     @classroom = Classroom.new(classroom_params)
      respond_to do |format|
        if @classroom.save
          format.html { redirect_to @classroom, notice: 'Curso criado com sucesso.' }
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
          if @classroom.update(classroom_params)
            format.html { redirect_to @classroom, notice: 'Curso atualizado.' }
          else
            format.html { render :edit }
          end
        end
    end

    def destroy
      @classroom.destroy
        respond_to do |format|
        format.html { redirect_to classrooms_url, notice: 'Curso excluído com sucesso.' }
        end
    end


    private

      def set_classroom
        @classroom= Classroom.find(params[:id])
      end

      def classroom_params
        _params=params.require(:classroom).permit(:student , :course)
        student = Student.find_by_id(_params[:student])
        course = Course.find_by_id(_params[:course])
        {student: student, course: course}
      end
end
