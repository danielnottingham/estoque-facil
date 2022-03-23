require 'rails_helper'

RSpec.describe "BusinessUnits", type: :request do
  describe "POST #create" do
    context "with valid params" do
      it "creates a new BusinessUnit" do
        params = { business_unit: { name: "Test", phone: "1234567890", email: "unit@test.com", address: "Rua teste, 48" } }
        expect { post business_units_path, params: params }.to change(BusinessUnit, :count).by(1)
      end

      it 'returns a success response' do
        business_unit = create(:business_unit)
        get business_unit_path(business_unit)
        expect(response).to be_successful
      end
    end

    context "with invalid params" do
      it 'does not create a new BusinessUnit' do
        params = { business_unit: { name: "Test", phone: "1234567890", email: '', address: '' } }
        expect { post business_units_path, params: params }.to change(BusinessUnit, :count).by(0)
      end
    end
  end

  describe 'GET #show' do
    context 'with valid params' do
      it 'returns a success response' do
        business_unit = create(:business_unit)
        get business_unit_path(business_unit)
        expect(response).to be_successful
      end
    end
  end

  describe 'GET #index' do
    context 'listing all business units' do
      it 'returns a success response' do
        get business_units_path
        expect(response).to be_successful
      end

      it 'returns a list of business units' do
        business_unit = create_list(:business_unit, 5)
        get business_units_path
        expect(BusinessUnit.count).to eq(5)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested business unit' do
        business_unit = create(:business_unit)
        params = { business_unit: { name: "Test", phone: "1234567890", email: "novoemail@test.com", address: "Rua teste, 48" } }

        put business_unit_path(business_unit), params: params
        expect { business_unit.reload }.to change(business_unit, :email).to("novoemail@test.com")
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'destroying a business unit' do
      it 'destroys the requested business unit' do
        business_unit = create(:business_unit)
        delete business_unit_path(business_unit)
        expect { BusinessUnit.count }.to change(BusinessUnit, :count).by(0)
      end
    end
  end
end
