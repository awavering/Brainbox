module ApplicationHelper
  def format_date_for_form date
    return '' if date.nil?
    date.strftime "%m/%d/%Y %I:%M:%S %p"
  end

  def render_tabs active_tab = nil, tab_content = {}
    render_tab_header(active_tab, tab_content) + render_tab_content(active_tab, tab_content)
  end

  def render_tab_header active_tab = nil, tab_content = {}
    render :partial => "application/tabs", :locals => { :active_tab => active_tab, :tab_content => tab_content }
  end

  def render_tab_content active_tab = nil, tab_content = {}
    render :partial => "application/tab_content", :locals => { :active_tab => active_tab, :tab_content => tab_content }
  end

  def render_datetime_picker obj, attribute
    model = params[:controller].singularize
    render :partial => "application/datetime_picker", :locals => { :obj => obj, :attribute => attribute }
  end

  def title page_title
    content_for :title, (page_title.to_s + " | Brainbox")
  end
end

class Hash
  def strptime_params! keys
    self.each do |key, val|
      self[key] = DateTime.strptime(val, "%m/%d/%Y %I:%M:%S %p") if keys.include? key
    end
  end
end

class String
  def plurality n
    n == 1 ? self : self+'s'
  end
end