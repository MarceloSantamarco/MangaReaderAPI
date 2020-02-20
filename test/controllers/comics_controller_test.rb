require 'test_helper'

class ComicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comic = comics(:one)
  end

  test "should get index" do
    get comics_url, as: :json
    assert_response :success
  end

  test "should create comic" do
    assert_difference('Comic.count') do
      post comics_url, params: { comic: { author_id: @comic.author_id, category_id: @comic.category_id, comic_content_type: @comic.comic_content_type, comic_file_name: @comic.comic_file_name, comic_file_size: @comic.comic_file_size, comic_path: @comic.comic_path, cover: @comic.cover, description: @comic.description, genre_id: @comic.genre_id, parental_rate: @comic.parental_rate, published_at: @comic.published_at, rate: @comic.rate, title: @comic.title } }, as: :json
    end

    assert_response 201
  end

  test "should show comic" do
    get comic_url(@comic), as: :json
    assert_response :success
  end

  test "should update comic" do
    patch comic_url(@comic), params: { comic: { author_id: @comic.author_id, category_id: @comic.category_id, comic_content_type: @comic.comic_content_type, comic_file_name: @comic.comic_file_name, comic_file_size: @comic.comic_file_size, comic_path: @comic.comic_path, cover: @comic.cover, description: @comic.description, genre_id: @comic.genre_id, parental_rate: @comic.parental_rate, published_at: @comic.published_at, rate: @comic.rate, title: @comic.title } }, as: :json
    assert_response 200
  end

  test "should destroy comic" do
    assert_difference('Comic.count', -1) do
      delete comic_url(@comic), as: :json
    end

    assert_response 204
  end
end
