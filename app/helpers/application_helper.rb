module ApplicationHelper
  def flash_class(level)
    case level
      when "notice" then "alert alert-info"
      when "success" then "alert alert-success"
      when "error" then "alert alert-danger"
      when "alert" then "alert alert-danger"
    end
  end

  def design_color(design)
    case design.title
      when "Natsuki" then "blue-item"
      when "Ryu" then "red-item"
      when "Aika" then "yellow-item"
      when "Mizuki" then "purple-item"
      when "Miu" then "pink-item"
    end
  end
end
