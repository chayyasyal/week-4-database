feature 'View links' do
  scenario 'To view existing links on the links page' do
    Link.create(url: 'http://www.donothingfor2minutes.com/', title: 'Do Nothing')

    visit '/links'

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Do Nothing')
    end
  end
end
