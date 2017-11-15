module DrawingsHelper

  def get_user_info(name)
    user_name = "#{name}"
  end

  # Method of generating html view for n*n number of square boxes- 5*8
  def generate_square_boxes(row, drawings)
    content_tag :div, :class => "drawing_section" do
      1.upto(row){|item| concat(generate_row(item, row,drawings))}
    end
  end

  # Method of generating row with given number square boxes
  def generate_row(row, count,drawings)
    start_column = row == 1 ? 1 : ((row-1) * count) + 1
    last_column = row == 1 ? count : (row * count)

    content_tag :div, :class => "flex-container" do
      start_column.upto(last_column) do |item|
        box_identifier = "square_box_#{item}"

        if drawings.has_key?(box_identifier)
          drawing = drawings[box_identifier].try(:first)
          html_attrs = {color: "background-color: #{drawing.color_code}",data: {content: generate_popover_template(drawing), placement: "bottom", toggle: "popover", trigger: "hover"}}
        else
          html_attrs = {color: "", data: {content: "Draw Color", placement: "bottom", toggle: "popover", trigger: "hover"}}
        end
        concat(content_tag(:div , content_tag(:p, ""), :class => "square_box", :id => box_identifier,:style => html_attrs[:color], :data => html_attrs[:data]))
      end
    end
  end

  def generate_popover_template(drawing)
    "<h5>User: <b>#{drawing.user_name[1..15]}..</b></h5><p>Draw at: <b>#{parse_time(drawing.updated_at)}</b></p><p>Color code: <b>#{drawing.color_code}</b</p>"
  end

  def parse_time(date)
    date.strftime(I18n.t('drawings.date_time_format'))
  end


end
