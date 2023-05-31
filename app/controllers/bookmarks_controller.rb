class BookmarksController < ApplicationController
  def index
    # matching_bookmarks = Bookmark.where(user_id: session[:user_id])
    # load_current_user

    matching_bookmarks = @current_user.bookmarks

    @list_of_bookmarks = matching_bookmarks.order({ :created_at => :desc })

    render({ :template => "bookmarks/index" })
  end

  def show
    # load_current_user

    the_id = session[:user_id]

    matching_bookmarks = Bookmark.where({ :id => the_id })

    @the_bookmark = matching_bookmarks.at(0)

    render({ :template => "bookmarks/show" })
  end

  # def user_index
  #   the_id = session[:user_id]

  #   @matching_bookmarks = Bookmark.where({ :user_id => the_id })

  #   @the_user =
  #   # @the_bookmark = matching_bookmarks.at(0)

  #   render({ :template => "bookmarks/show" })
  # end

  # def add_user_bookmark
  #   the_bookmark = Bookmark.new
  #   the_bookmark.user_id = session[:user_id]
  #   the_bookmark.movie_id = params.fetch("query_movie_id")

  #   if the_bookmark.valid?
  #     the_bookmark.save
  #     redirect_to("/bookmarks", { :notice => "Bookmark created successfully." })
  #   else
  #     redirect_to("/bookmarks", { :alert => the_bookmark.errors.full_messages.to_sentence })
  #   end
  # end

  def create
    # load_current_user

    the_bookmark = Bookmark.new
    the_bookmark.user_id = session[:user_id]
    the_bookmark.movie_id = params.fetch("query_movie_id")

    if the_bookmark.valid?
      the_bookmark.save
      redirect_to("/movies/" + params.fetch("query_movie_id").to_s, { :notice => "Bookmark created successfully." })
    else
      redirect_to("/movies/" + params.fetch("query_movie_id").to_s, { :alert => the_bookmark.errors.full_messages.to_sentence })
    end
  end

  def update
    # load_current_user

    the_id = params.fetch("path_id")
    the_bookmark = Bookmark.where({ :id => the_id }).at(0)

    the_bookmark.user_id = params.fetch("query_user_id")
    the_bookmark.movie_id = params.fetch("query_movie_id")

    if the_bookmark.valid?
      the_bookmark.save
      redirect_to("/bookmarks/#{the_bookmark.id}", { :notice => "Bookmark updated successfully." })
    else
      redirect_to("/bookmarks/#{the_bookmark.id}", { :alert => the_bookmark.errors.full_messages.to_sentence })
    end
  end

  def destroy
    # load_current_user

    the_id = params.fetch("path_id")
    the_bookmark = Bookmark.where({ :id => the_id }).at(0)

    the_bookmark.destroy

    redirect_to("/movies/" + the_bookmark.movie_id.to_s, { :notice => "Bookmark deleted successfully." })
  end
end
