require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe PlacesController, type: :controller do
  before :each do
    @user = FactoryGirl.create(:user)
    allow(@user).to receive(:has_role?).and_return(true)
    @abilities = Ability.new(@user)
    allow(Ability).to receive(:new).and_return(@abilities)

    @country = FactoryGirl.create(:country, :norway)
  end
  # This should return the minimal set of attributes required to create a valid
  # Place. As you add validations to Place, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      name: 'Gridset',
      country_id: @country.id,
      latitude: 10,
      longitude: -100,
      msl: 0
    }
  end

  let(:invalid_attributes) do
    { name: nil, country_id: nil }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PlacesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all places as @places' do
      place = Place.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:places).include?(place)).to be_truthy
    end
  end

  describe 'GET #show' do
    it 'assigns the requested place as @place' do
      place = Place.create! valid_attributes
      get :show, { id: place.to_param }, valid_session
      expect(assigns(:place)).to eq(place)
    end
  end

  describe 'GET #new' do
    it 'assigns a new place as @place' do
      get :new, {}, valid_session
      expect(assigns(:place)).to be_a_new(Place)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested place as @place' do
      place = Place.create! valid_attributes
      get :edit, { id: place.to_param }, valid_session
      expect(assigns(:place)).to eq(place)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Place' do
        expect do
          post :create, { place: valid_attributes }, valid_session
        end.to change(Place, :count).by(1)
      end

      it 'assigns a newly created place as @place' do
        post :create, { place: valid_attributes }, valid_session
        expect(assigns(:place)).to be_a(Place)
        expect(assigns(:place)).to be_persisted
      end

      it 'redirects to the places list' do
        post :create, { place: valid_attributes }, valid_session
        expect(response).to redirect_to(places_path)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved place as @place' do
        post :create, { place: invalid_attributes }, valid_session
        expect(assigns(:place)).to be_a_new(Place)
      end

      it "re-renders the 'new' template" do
        post :create, { place: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { name: 'Gridsetkolten' }
      end

      it 'updates the requested place' do
        place = Place.create! valid_attributes
        put :update, { id: place.to_param, place: new_attributes }, valid_session
        place.reload
        expect(place.name).to eq(new_attributes[:name])
      end

      it 'assigns the requested place as @place' do
        place = Place.create! valid_attributes
        put :update, { id: place.to_param, place: valid_attributes }, valid_session
        expect(assigns(:place)).to eq(place)
      end

      it 'redirects to the places lisy' do
        place = Place.create! valid_attributes
        put :update, { id: place.to_param, place: valid_attributes }, valid_session
        expect(response).to redirect_to(places_path)
      end
    end

    context 'with invalid params' do
      it 'assigns the place as @place' do
        place = Place.create! valid_attributes
        put :update, { id: place.to_param, place: invalid_attributes }, valid_session
        expect(assigns(:place)).to eq(place)
      end

      it "re-renders the 'edit' template" do
        place = Place.create! valid_attributes
        put :update, { id: place.to_param, place: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested place' do
      place = Place.create! valid_attributes
      expect do
        delete :destroy, { id: place.to_param }, valid_session
      end.to change(Place, :count).by(-1)
    end

    it 'redirects to the places list' do
      place = Place.create! valid_attributes
      delete :destroy, { id: place.to_param }, valid_session
      expect(response).to redirect_to(places_url)
    end
  end
end
