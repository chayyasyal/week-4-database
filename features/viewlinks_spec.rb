

feature 'View links' do
  scenario 'To see see existing links on the links page' do
    Link.create(url: 'http://www.example.com', title: 'Example')

    visit '/links'

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Example')
    end
  end
end
