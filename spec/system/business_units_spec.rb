require 'rails_helper'

RSpec.describe "BusinessUnits", type: :system do
  describe '#index' do
    it 'displays a list of business units' do
      business_units = create_list(:business_unit, 3)
      visit business_units_path

      expect(business_units.count).to eq(3)
      business_units.each do |business_unit|
        expect(page).to have_content(business_unit.name)
      end
    end
  end

  describe '#show' do
    it 'displays a business unit' do
      business_unit = create(:business_unit)
      visit business_unit_path(business_unit)

      expect(page).to have_content(business_unit.name)
    end
  end

  describe '#new' do
    it 'displays a form to create a new business unit' do
      visit new_business_unit_path

      expect(page).to have_field('Name')
      expect(page).to have_field('Phone')
      expect(page).to have_field('Email')
      expect(page).to have_field('Address')
    end
  end

  describe '#create' do
    context 'when params are not valid' do
      it 'displays an error message' do
        visit new_business_unit_path

        fill_in 'business_unit_name', with: ''
        fill_in 'business_unit_phone', with: ''
        fill_in 'business_unit_email', with: ''
        fill_in 'business_unit_address', with: ''
        click_on 'Create Business unit'

        expect(page).to have_content('Name can\'t be blank')
        expect(page).to have_content('Phone can\'t be blank')
        expect(page).to have_content('Email can\'t be blank')
        expect(page).to have_content('Address can\'t be blank')
      end
    end

    context 'when params are valid' do
      it 'creates a business unit' do
        visit new_business_unit_path

        fill_in 'business_unit_name', with: 'Test'
        fill_in 'business_unit_phone', with: '1234567890'
        fill_in 'business_unit_email', with: 'test@test.com'
        fill_in 'business_unit_address', with: 'Rua R, 123'
        click_on 'Create Business unit'

        expect(page).to have_content('Business unit was successfully created.')
        expect(page).to have_content('Test')
        expect(page).to have_content('1234567890')
        expect(page).to have_content('test@test.com')
        expect(page).to have_content('Rua R, 123')
        expect(current_path).to eq(business_unit_path(BusinessUnit.last))
      end
    end
  end

  describe '#edit' do
    it 'displays an edit form' do
      business_unit = create(:business_unit)
      visit edit_business_unit_path(business_unit)

      expect(page).to have_content('Edit Business unit')
      expect(page).to have_field('business_unit_name', with: business_unit.name)
      expect(page).to have_field('business_unit_phone', with: business_unit.phone)
      expect(page).to have_field('business_unit_email', with: business_unit.email)
      expect(page).to have_field('business_unit_address', with: business_unit.address)
    end
  end

  describe '#update' do
    it 'updates a business unit' do
      business_unit = create(:business_unit)
      visit edit_business_unit_path(business_unit)

      fill_in 'business_unit_name', with: 'Updated Business Unit'
      click_on 'Update Business unit'

      expect(page).to have_content('Updated Business Unit')
      expect(page).to have_content('Business unit was successfully updated.')
      expect(current_path).to eq(business_unit_path(business_unit))
    end

    it 'displays an error message' do
      business_unit = create(:business_unit)
      visit edit_business_unit_path(business_unit)

      fill_in 'business_unit_name', with: ''
      click_on 'Update Business unit'

      expect(page).to have_content('Name can\'t be blank')
    end
  end

  describe '#destroy' do
    it 'deletes a business unit' do
      business_unit = create(:business_unit)
      visit business_units_path

      expect(page).to have_content(business_unit.name)
      expect(page).to have_content(business_unit.phone)
      expect(page).to have_content(business_unit.email)
      expect(page).to have_content(business_unit.address)
      page.accept_confirm "Confirma?" do
        click_link('Delete')
      end
      expect(page).to have_content('Business unit was successfully destroyed.')
      expect(page).to_not have_content(business_unit.name)
    end
  end
end
