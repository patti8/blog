require "application_system_test_case"

class Admin::ArticlesTest < ApplicationSystemTestCase
  setup do
    @admin_article = admin_articles(:one)
  end

  test "visiting the index" do
    visit admin_articles_url
    assert_selector "h1", text: "Articles"
  end

  test "should create article" do
    visit admin_articles_url
    click_on "New article"

    fill_in "Content", with: @admin_article.content
    fill_in "Lead", with: @admin_article.lead
    fill_in "Published at", with: @admin_article.published_at
    fill_in "Slug", with: @admin_article.slug
    fill_in "Title", with: @admin_article.title
    click_on "Create Article"

    assert_text "Article was successfully created"
    click_on "Back"
  end

  test "should update Article" do
    visit admin_article_url(@admin_article)
    click_on "Edit this article", match: :first

    fill_in "Content", with: @admin_article.content
    fill_in "Lead", with: @admin_article.lead
    fill_in "Published at", with: @admin_article.published_at.to_s
    fill_in "Slug", with: @admin_article.slug
    fill_in "Title", with: @admin_article.title
    click_on "Update Article"

    assert_text "Article was successfully updated"
    click_on "Back"
  end

  test "should destroy Article" do
    visit admin_article_url(@admin_article)
    click_on "Destroy this article", match: :first

    assert_text "Article was successfully destroyed"
  end
end
