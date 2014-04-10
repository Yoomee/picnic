class ContentFilterWordsController < ContentFlagsBaseController

  admin_only :index, :create, :destroy

  def create
    if request.xhr?
      unless params[:content_filter_words].nil? && params[:content_filter_word].nil?      
        render :update do |page|
          if !(words = params[:content_filter_words]).blank?
            words.collect(&:downcase).each do |word|
              ContentFilterWord.create(:word => word) unless word.in?(TramlinesContentFilter::content_filter_words)
            end
            page[params[:content_flag_form_id]].replace_html(render("content_filter_words/multiple_words_form", :uid => params[:content_flag_form_id]))
            page << "HighlightText.clearHighlighting('#{params[:content_flag_form_id]}'); $('##{params[:content_flag_form_id]}').hide();"
          else
            @content_filter_word = ContentFilterWord.new(params[:content_filter_word])
            if @content_filter_word.save
              page["content_filter_word_list"].append(render("content_filter_words/word", :content_filter_word => @content_filter_word))
              @content_filter_word = ContentFilterWord.new(:whitelist => @content_filter_word.whitelist)
              page << "$('#new_content_filter_word_form').hide();"
            end
            page["new_content_filter_word_form"].replace_html(render("content_filter_words/form", :content_filter_word => @content_filter_word))
          end
        end
      end
    end
  end

  def destroy
    @content_filter_word = ContentFilterWord.find(params[:id])
    render :update do |page|
      if @content_filter_word.destroy
        page << "$('#content_filter_word_#{@content_filter_word.id}').fadeOut('slow', function() {$(this).remove();});"
      end
    end
  end

  def index
    @whitelist = params[:whitelist]
    black_or_white = @whitelist ? "whitelist" : "blacklist"
    @content_filter_words = ContentFilterWord.send(black_or_white)
    if params[:id] == '#'
      @content_filter_words = @content_filter_words.find(:all, :conditions => "word BETWEEN '0%' AND '9%'", :order=>'word').paginate :page => params[:page], :per_page => 50
    else
      params[:id] ||= 'A'
      @content_filter_words = @content_filter_words.word_begins_with(params[:id]).ascend_by_word.paginate :page => params[:page], :per_page => 50
    end    
    if request.xhr?
      replace_moderation_content('content_filter_words/content_filter_words', :content_filter_words => @content_filter_words, :whitelist => @whitelist, :wrapper_class => "wordlist", :active_li => black_or_white)
    else
      set_up_sidebar
      render :template => 'moderation/index'
    end
  end
  
  def update
    @content_filter_word = ContentFilterWord.find(params[:id])
    render :update do |page|
      if @content_filter_word.update_attributes(params[:content_filter_word])
        page["content_filter_word_#{@content_filter_word.id}"].replace(render("content_filter_words/word", :content_filter_word => @content_filter_word))
      else
        page["edit_content_filter_word_#{@content_filter_word.id}"].replace(render("content_filter_words/form", :content_filter_word => @content_filter_word))
      end
    end    
  end

end