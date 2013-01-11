module PagesHelper
  def rating_stars(rating)
    output = '<span class="rating">'
    number = round_to_half(rating)
    integer = number.floor

    integer.times do
      output << '<span class="star"></span>'
    end

    output << '<span class="half-star"></span>' unless number == integer

    (5-integer).times do
      output << '<span class="empty-star"></span>'
    end


    output << '</span>'
    output.html_safe
  end


  private

  # http://www.cowboycoded.com/2011/04/27/round-to-half-intervals-5-in-ruby
  def round_to_half(number)
    return 0 if number <= 0
    multiplier = 1.0/0.5
    (multiplier*number).round/multiplier
  end
end
