require_relative '../spec_helper'

feature 'set' do

  before 'visit set' do
    visit '/set'
  end

  it 'renders a form to submit the key and value' do
    expect(page).to have_field('key')
    expect(page).to have_field('value')
  end

  it 'submits the value' do
    fill_in 'key', with: 'randomKey'
    fill_in 'value', with: 'randomValue'
    click_button 'SubmitHash'
    click_button 'Get'
    fill_in 'key', with: 'randomKey'
    click_button 'FindHash'
    expect(page).to have_content 'randomValue'
  end

end
