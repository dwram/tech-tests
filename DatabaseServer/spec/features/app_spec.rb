require_relative '../spec_helper'

feature App do

  it 'starts at localhost 4000' do
    visit '/'
    expect(page).to have_content('Welcome to set and get!')
    expect(Capybara.server_port).to eq(4000)
  end

end
