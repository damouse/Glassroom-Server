require 'spec_helper'

describe SubjectsController do

  let(:valid_attributes) { { name: "Math", description: 'School subject' } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all subjects as @subjects" do
      subject = Subject.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:subjects)).to eq([subject])
    end
  end

  # describe "GET show" do
  #   it "assigns @lectures as the list of lectures that belongs to @subject" do
  #     subject = Subject.create! valid_attributes
  #     get :lecture, {}, valid_session
  #     expect(assigns(:lectures)).to eq(subject.lectures)
  #   end
  # end

  describe "GET new" do
    it "assigns a new subject as @subject" do
      get :new, {}, valid_session
      expect(assigns(:subject)).to be_a_new(Subject)
    end
  end

  describe "GET edit" do
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new subject" do
        expect {
          post :create, {:subject => valid_attributes}, valid_session
        }.to change(Subject, :count).by(1)
      end

      it "assigns a newly created subject as @subject" do
        post :create, {:subject => valid_attributes}, valid_session
        expect(assigns(:subject)).to be_a(Subject)
        expect(assigns(:subject)).to be_persisted
      end

      it "redirects to the created subject" do
        post :create, {:subject => valid_attributes}, valid_session
        expect(response).to redirect_to(Subject.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved subject as @subject" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Subject).to receive(:save).and_return(false)
        post :create, {:subject => { "name" => "invalid value" }}, valid_session
        expect(assigns(:subject)).to be_a_new(Subject)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Subject).to receive(:save).and_return(false)
        post :create, {:subject => { "name" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested subject" do
        subject = Subject.create! valid_attributes
        # Assuming there are no other authors in the database, this
        # specifies that the Subject created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Subject).to receive(:update).with({ "name" => "MyString" })
        put :update, {:id => subject.to_param, :subject => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested subject as @subject" do
        subject = Subject.create! valid_attributes
        put :update, {:id => subject.to_param, :subject => valid_attributes}, valid_session
        expect(assigns(:subject)).to eq(subject)
      end

      it "redirects to the subject" do
        subject = Subject.create! valid_attributes
        put :update, {:id => subject.to_param, :subject => valid_attributes}, valid_session
        expect(response).to redirect_to(subject)
      end
    end

    describe "with invalid params" do
      it "assigns the subject as @subject" do
        subject = Subject.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Subject).to receive(:save).and_return(false)
        put :update, {:id => subject.to_param, :subject => { "name" => "invalid value" }}, valid_session
        expect(assigns(:subject)).to eq(subject)
      end

      it "re-renders the 'edit' template" do
        subject = Subject.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Subject).to receive(:save).and_return(false)
        put :update, {:id => subject.to_param, :subject => { "name" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested subject" do
      subject = Subject.create! valid_attributes
      expect {
        delete :destroy, {:id => subject.to_param}, valid_session
      }.to change(Subject, :count).by(-1)
    end

    it "redirects to the subject list" do
      subject = Subject.create! valid_attributes
      delete :destroy, {:id => subject.to_param}, valid_session
      expect(response).to redirect_to(subjects_url)
    end
  end

end
