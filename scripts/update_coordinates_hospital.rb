Hospital.all.each_with_index do |h, index|
  next unless h.location.present?
  puts index
  location = h.location.split(',')
  h.coordinates = [location[1].to_f, location[0].to_f]
  h.save
end
