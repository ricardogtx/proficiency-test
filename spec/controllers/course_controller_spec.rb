require 'rails_helper'

RSpec.describe CourseController, :type => :controller do
  let(:valid_attributes) {
      {:name => "courseteste", :description => "123412341234",:status => "5"}
    }

    let(:invalid_attributes) {
    }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # coursesController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe "GET index" do
      it "assigns all courses as @courses" do
        course = course.create! valid_attributes
        get "index", {}, valid_session
        expect(assigns(:courses)).to eq(course.all)
      end
    end

    describe "GET show" do
      it "assigns the requested course as @course" do
        course = course.create! valid_attributes
        get :show, {:id => course.to_param}, valid_session
        expect(assigns(:course)).to eq(course)
      end
    end

    describe "GET new" do
      it "assigns a new course as @course" do
        get :new, {}, valid_session
        expect(assigns(:course)).to be_a_new(course)
      end
    end

    describe "GET edit" do
      it "assigns the requested course as @course" do
        course = course.create! valid_attributes
        get :edit, {:id => course.to_param}, valid_session
        expect(assigns(:course)).to eq(course)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new course" do
          expect {
            post :create, {:course => valid_attributes}, valid_session
          }.to change(course, :count).by(0)
        end

        it "assigns a newly created course as @course" do
          post :create, {:course => valid_attributes}
          expect(assigns(:course)).to be_a course
          expect(assigns(:course)).to be_a_new(course)
        end

        it "redirects to the created course" do
          post :create, {:course => valid_attributes}, valid_session
          expect(response.status).to be(200)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved course as @course" do
          post :create, {:course => valid_attributes}, valid_session
          expect(assigns(:course)).to be_a_new(course)
        end

        it "re-renders the 'new' template" do
          post :create, {:course => valid_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "updates the requested course" do
          course = course.create! valid_attributes
          put :update, {:id => course.to_param, :course => new_attributes}, valid_session
          course.reload
          skip("Add assertions for updated state")
        end

        it "assigns the requested course as @course" do
          course = course.create! valid_attributes
          put :update, {:id => course.to_param, :course => valid_attributes}, valid_session
          expect(assigns(:course)).to eq(course)
        end

        it "redirects to the course" do
          course = course.create! valid_attributes
          put :update, {:id => course.to_param, :course => valid_attributes}, valid_session
          expect(response).to redirect_to(courses_url)
        end
      end

      describe "with invalid params" do
        it "assigns the course as @course" do
          course = course.create! valid_attributes
          put :update, {:id => course.to_param, :course =>  valid_attributes}, valid_session
          expect(assigns(:course)).to eq(course)
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested course" do
        course = course.create! valid_attributes
        expect {
          delete :destroy, {:id => course.to_param}, valid_session
        }.to change(course, :count).by(-1)
      end

      it "redirects to the courses list" do
        course = course.create! valid_attributes
        delete :destroy, {:id => course.to_param}, valid_session
        expect(response).to redirect_to(courses_url)
      end
end
