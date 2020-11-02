require "application_system_test_case"

class FollowingsTest < ApplicationSystemTestCase
  setup do
    @following = followings(:one)
  end

  test "visiting the index" do
    visit followings_url
    assert_selector "h1", text: "Followings"
  end

  test "creating a Following" do
    visit followings_url
    click_on "New Following"

    fill_in "Followerid", with: @following.followerId
    fill_in "Followingid", with: @following.followingId
    click_on "Create Following"

    assert_text "Following was successfully created"
    click_on "Back"
  end

  test "updating a Following" do
    visit followings_url
    click_on "Edit", match: :first

    fill_in "Followerid", with: @following.followerId
    fill_in "Followingid", with: @following.followingId
    click_on "Update Following"

    assert_text "Following was successfully updated"
    click_on "Back"
  end

  test "destroying a Following" do
    visit followings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Following was successfully destroyed"
  end
end
