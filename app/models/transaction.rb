require 'csv'

class Transaction < ActiveRecord::Base

  def self.import(file)
    csv_text = File.read(file.path)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      transaction = find_by_id(row["id"]) || new

      lowered_column_names_hash = {}
      row.to_hash.each_pair do |k,v|
        new_key = k.downcase.gsub(' ', '_').sub('type', 'trans_type')
        if (new_key.end_with?('date'))
          lowered_column_names_hash[new_key] = swapMonthAndDay(v)
        else
          lowered_column_names_hash[new_key] = v
        end
      end

      transaction.attributes = lowered_column_names_hash
      transaction.save!
    end
  end

  def self.swapMonthAndDay(csv_date)
    parts = csv_date.split('/')
    parts[1] + '/' + parts[0] + '/' + parts[2]
  end

end
