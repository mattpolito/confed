require 'spec_helper'

describe Admin::PresentationsController do
  let(:user) { mock_model(User) } 
  let(:speaker) { Factory.build(:speaker) }

  before do
    User.stub(:find).and_return(user)
    user.stub(:has_role?).with(:admin).and_return(true)
    sign_in user
  end

  def mock_presentation(stubs={})
    @mock_presentation ||= mock_model(Presentation, stubs).as_null_object
  end

  describe "GET index" do
    it "succeeds" do
      get :index
      response.should be_success
    end

    it "assigns all presentations as @presentations" do
      Presentation.stub(:paginate) { [mock_presentation] }
      get :index
      assigns(:presentations).should eq([mock_presentation])
    end

    it "renders index template" do
      get :index
      response.should render_template(:index)
    end
  end
 
# describe "GET show" do
#   it "assigns the requested presentation as @presentation" do
#     Presentation.stub(:find).with("37") { mock_presentation }
#     get :show, :id => "37"
#     assigns(:presentation).should be(mock_presentation)
#   end
# end

  describe "GET new" do
    it "is successful" do
      get :new
      response.should be_success
    end

    it "assigns a new presentation for the view" do
      Presentation.stub(:new) { mock_presentation }
      get :new
      assigns[:presentation].should be(mock_presentation)
    end

    it "assigns speakers for the view" do
      Speaker.stub(:all).and_return([speaker])
      get :new
      assigns[:speakers].should == [speaker]
    end

    it "renders new template" do
      get :new
      response.should render_template(:new)
    end

    it 'assigns the previously used event from a cookie' do
      pending("need to remember how to set cookies in a request")
      cookies[:event_id] = 2
      get :new
      response
    end
  end

# describe "GET edit" do
#   it "assigns the requested presentation as @presentation" do
#     Presentation.stub(:find).with("37") { mock_presentation }
#     get :edit, :id => "37"
#     assigns(:presentation).should be(mock_presentation)
#   end
# end

  describe "POST create" do
    let(:external_embed_params) do
      {'external_embed' => {'video' => '', 'slideshow' => ''}}
    end

    def do_post(args={'foo' => 'bar'})

      post :create, :presentation => args.merge(external_embed_params)  
    end
 
    describe "with valid params" do
      before do
        Presentation.stub(:new) { mock_presentation(:save => true, :event_id => 1) }
        do_post
      end

      it "assigns a newly created presentation as @presentation" do
        assigns(:presentation).should be(mock_presentation)
      end

      it "sets flash message to be displayed" do
        flash[:success].should == "Presentation created!"
      end
 
      it "redirects to the presentation index" do
        response.should redirect_to(admin_presentations_url)
      end

      it 'assigns the event in a cookie' do
        Presentation.stub(:new) { mock_presentation(:save => true) }
        do_post
        cookies['last_event_id'].should == '1'
      end
    end
 
    describe "with invalid params" do
      it "assigns a newly created but unsaved presentation as @presentation" do
        Presentation.stub(:new) { mock_presentation(:save => false) }
        do_post
        assigns(:presentation).should be(mock_presentation)
      end
 
      it "re-renders the 'new' template" do
        Presentation.stub(:new) { mock_presentation(:save => false) }
        do_post
        response.should render_template("new")
      end
    end
 
  end
 
# describe "PUT update" do
#
#   describe "with valid params" do
#     it "updates the requested presentation" do
#       Presentation.should_receive(:find).with("37") { mock_presentation }
#       mock_presentation.should_receive(:update_attributes).with({'these' => 'params'})
#       put :update, :id => "37", :presentation => {'these' => 'params'}
#     end
#
#     it "assigns the requested presentation as @presentation" do
#       Presentation.stub(:find) { mock_presentation(:update_attributes => true) }
#       put :update, :id => "1"
#       assigns(:presentation).should be(mock_presentation)
#     end
#
#     it "redirects to the presentation" do
#       Presentation.stub(:find) { mock_presentation(:update_attributes => true) }
#       put :update, :id => "1"
#       response.should redirect_to(admin_presentation_url(mock_presentation))
#     end
#   end
#
#   describe "with invalid params" do
#     it "assigns the presentation as @presentation" do
#       Presentation.stub(:find) { mock_presentation(:update_attributes => false) }
#       put :update, :id => "1"
#       assigns(:presentation).should be(mock_presentation)
#     end
#
#     it "re-renders the 'edit' template" do
#       Presentation.stub(:find) { mock_presentation(:update_attributes => false) }
#       put :update, :id => "1"
#       response.should render_template("edit")
#     end
#   end
#
# end
#
# describe "DELETE destroy" do
#   it "destroys the requested presentation" do
#     Presentation.should_receive(:find).with("37") { mock_presentation }
#     mock_presentation.should_receive(:destroy)
#     delete :destroy, :id => "37"
#   end
#
#   it "redirects to the presentations list" do
#     Presentation.stub(:find) { mock_presentation }
#     delete :destroy, :id => "1"
#     response.should redirect_to(admin_presentations_url)
#   end
# end

  describe "unauthenticated users get redirected when" do
    before do
      sign_out user
    end
    it "GET index" do
      get :index
      response.should be_redirect
    end

    it "GET new" do
      get :new
      response.should be_redirect
    end

    it "POST create" do
      post :create
      response.should be_redirect
    end
  end

end
