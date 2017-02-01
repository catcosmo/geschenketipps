require 'csv'

import_dir = "#{Rails.root}/db/import"
files = {}
parsed_files = {}
statuses = {}

Dir.foreach(import_dir) do |item|
  next if (item == '.') || (item == '..') || !(item =~ /.csv$/)
  files[item] = File.read("#{import_dir}/#{item}")
end

files.each do |file_name, file_body|
  statuses[file_name] = {}
  begin
    parsed_files[file_name] = CSV.parse(file_body.delete("\r"), {quote_char: "|"})
  rescue Exception => e
    statuses[file_name][:parse] = false
    puts "Could not parse #{file_name} #{e.message}"
  else
    statuses[file_name][:parse] = true
    puts "Successfuly parsed #{file_name}"
  end
end

puts ''
puts 'starting importing'
puts ''

parsed_files.each do |file_name, parsed_rows|
  data_source = DataSource.find_or_create_by(csv_file_name: file_name)
  parsed_rows.each do |row|
    row.map! { |col| col.strip unless col.nil? }
    gift = data_source.gifts.create(name: row[0], year: row[1], month: row[2], day: row[3], value: row[4], value_under_25_euro: row[5], value_over_25_euro: row[6], fate: row[7], success: row[8], abr: row[9])
  end
  statuses[file_name][:gifts_created] = true
  puts "#{data_source.gifts.count} Gifts created! from #{file_name}"

  ministry_abr = data_source.gifts.pluck(:abr).uniq
  if ministry_abr.count == 1
    data_source.ministry = Ministry.find_or_create_by(abbreviation: ministry_abr[0])
    data_source.save
    puts "Saved Ministry #{ministry_abr[0]}"
    statuses[file_name][:ministry_created] = true
  else
    puts "ERROR in #{file_name}: ABR in DATA Source should all be the same! but we got: #{ministry_abr.inspect}"

    statuses[file_name][:ministry_created] = false
  end
end

puts 'statuses'
statuses.each do |file, status|
  status_line = []
  failed = false
  status.each do |name, success|
    if success
      status_line << "#{name}: success"
    else
      status_line << "#{name}: failed"
      failed = true
    end
  end
  if failed
    puts "#{file}: failed! #{status_line.join(', ')}"
  else
    puts "#{file}: success"
  end
end

