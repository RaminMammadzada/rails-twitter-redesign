require 'application_system_test_case'

class OpinionsTest < ApplicationSystemTestCase
  setup do
    @opinion = opinions(:one)
  end

  test 'visiting the index' do
    visit opinions_url
    assert_selector 'h1', text: 'Opinions'
  end

  test 'creating a Opinion' do
    visit opinions_url
    click_on 'New Opinion'

    fill_in 'Authorid', with: @opinion.authorId
    fill_in 'Text', with: @opinion.text
    click_on 'Create Opinion'

    assert_text 'Opinion was successfully created'
    click_on 'Back'
  end

  test 'updating a Opinion' do
    visit opinions_url
    click_on 'Edit', match: :first

    fill_in 'Authorid', with: @opinion.authorId
    fill_in 'Text', with: @opinion.text
    click_on 'Update Opinion'

    assert_text 'Opinion was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Opinion' do
    visit opinions_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Opinion was successfully destroyed'
  end
end
