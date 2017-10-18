feature 'Create a link' do
  scenario 'I can create a new link' do
    visit '/links/new'
    fill_in :url, with: 'http://www.donothingfor2minutes.com/'
    fill_in :title, with: 'This is my calming down website'
    click_button 'Create link'
    # the link now needs to take us back to the main links page
    expect(current_path).to eq '/links'

    within 'ul#links' do
      # this method only looks at the list of links in the website
      expect(page).to have_content('This is my calming down website')
    end
  end
end
