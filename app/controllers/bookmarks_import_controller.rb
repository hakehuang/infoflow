class BookmarksImportController < ApplicationController
  def index
    @catas = Cata.all
  end

  def upload
    file = params[:upload][:bookmark_file]

    if file.original_filename.empty?
      return nil
    else
      @filename = current_user.id.to_s + file.original_filename 
      @filename = Rails.root.to_s + "/public/bookmark_files/#{@filename}"
      File.open(@filename, "wb") { |f| f.write(file.read) }
      return @filename
    end
  end

  def import
    @catas = Cata.all

    readable_browser_types = ['IE', 'Firefox', 'Chrome', 'Opera']
    browser_type = params[:browsers]

    if ! readable_browser_types.include?(browser_type)
      flash[:notice] = "Please specify your browser in the selection."
      return
    end

    @mbm = Bookmark.new
    result = @mbm.parsers(browser_type, self.upload )
    if result
      flash[:notice] = "Your bookmarks have been successfully imported."
    else

      flash[:notice] = "Your bookmarks upload failed."
    end

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
