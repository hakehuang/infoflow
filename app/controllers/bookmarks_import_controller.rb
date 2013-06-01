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


    # If the file parsing succeeds, the bookmarks shall have been saved in DB,
    # Then display success message;
    # Else display error information and remove the file.
    
    @mbm.bm_hash.each do |key, value|
      @site = Site.new()
      @site.name = key
      @site.desc = key
      @site.link = value[0]
      @site.save
      value[1].each do |tg|
        @tag = @site.tags.create()
        @tag.publish = false
        @tag.user_id = current_user.id
        @tag.name = tg
        @tag.save 
      end
    end 

    # ...
    flash[:notice] = "Your bookmarks have been successfully imported."

  end
end
