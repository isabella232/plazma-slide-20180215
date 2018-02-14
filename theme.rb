include_theme("clear-code")

match(TitleSlide, Title) do |titles|
  prop_set("weight", "bold")
  prop_set("size", @large_font_size)
  titles.horizontal_centering = true
end

match(TitleSlide, Author) do |author|
  prop_set("size", @small_font_size)
end

match(TitleSlide, Institution) do |author|
  prop_set("size", @x_small_font_size)
end

match(TitleSlide, Date) do |date|
  prop_set("size", @xx_small_font_size)
end
