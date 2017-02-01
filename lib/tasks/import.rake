namespace :import do
  desc 'import gifts from csv'
  task gifts: :environment do
    counter = 0
    total = 0
    tempsuccess = true

    # iter through all files in directory data
    Dir.glob('/Users/krawallmietze/code/Ruby/workspace/geschenkeliste/geschenkeliste/app/assets/data/*.csv') do |csv_file|
      puts csv_file
      # iter thru row in csv file
      CSV.foreach(csv_file, encoding: 'bom|utf-8') do |row|
        row.to_s.tr!('"', "'")
        name, office, date, value, fate, abr, success = row
        # success to bool
        if success == 'success'
          tempsuccess
        else
          !tempsuccess
        end
        # create new gift from row values
        gift = Gift.create(name: name, office: office, date: date, value: value, fate: fate, abr: abr, success: tempsuccess)
        counter += 1 if gift.persisted?
      end
      puts "imported #{counter} gifts from #{csv_file}"
      total += counter
    end
    puts "imported #{total} gifts in total"
  end
end
