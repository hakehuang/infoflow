class BookmarksImportController < ApplicationController
  def index
    @catas = Cata.all
  end

  def upload
    file = params[:upload][:bookmark_file]

    if file.original_filename.empty?
      # nothing
    else
      @filename = file.original_filename
      File.open(Rails.root.to_s + "/public/bookmark_files/#{@filename}", "wb") { |f| f.write(file.read) }
    end
  end

  def import
    @catas = Cata.all

    readable_browser_types = ['IE', 'Firefox', 'Chrome', 'Opera']
    browser_type = params[:browsers]

    if readable_browser_types.include?(browser_type)
      # nothing but go on
    else
      flash[:notice] = "Please specify your browser in the selection."
      return
    end

    self.upload

    # TODO: call the relevant parser to parse the uploaded file
    # ...

    # If the file parsing succeeds, the bookmarks shall have been saved in DB,
    # Then display success message;
    # Else display error information and remove the file.
    # ...

    # ...
    flash[:notice] = "Your bookmarks have been successfully imported."

  end
end
