require File.dirname(__FILE__) + '/acceptance_helper'

feature 'normal way', js: true, focused: true do
  let(:vault)      { create :vault, subdomain: 'me'}
  let(:me)         { create :user, vault: vault }
  let!(:goldbrick) { create :goldbrick, name: 'My Goldbrick', vault: me.vault }

  before { sign_in me }
  # background { sign_in me }

  scenario 'should render list of goldbricks' do
    visit goldbricks_url(subdomain: me.vault.subdomain)
    page.should have_link goldbrick.name
  end

  scenario 'should render show goldbrick information' do
    visit goldbrick_url(subdomain: me.vault.subdomain, id: goldbrick)
    # save_and_open_page
    # page.should have_text goldbrick.name
    expect(page).to have_content goldbrick.name
    page.should have_link I18n.t('helpers.links.edit')
  end

  scenario 'should ...' do
    visit edit_goldbrick_url(subdomain: me.vault.subdomain, id: goldbrick)
    expect(page).to have_content 'New Goldbrick'
    current_url.should == edit_goldbrick_url(subdomain: me.vault.subdomain, id: goldbrick)
    # save_and_open_page
    attributes_for(:goldbrick).each do |key, value|
      fill_in "goldbrick[#{key}]", with: value
    end
    click_button 'Update'
save_and_open_page
  end

end