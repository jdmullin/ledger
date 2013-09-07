require 'csv'

# Helpful queries I haven't put in code yet:
#
# select tag.name, sum(t.amount) as amount from transactions t join tags tag on (tag.id = t.tag_id) group by tag.name order by amount;
#
# select sum(t.amount) from transactions;
#
# select description, amount from transactions t join tags tag on (tag.id = t.tag_id) where tag.name = 'Household' order by amount;

class Transaction < ActiveRecord::Base
  belongs_to :tag

  def self.import(file)
    csv_text = File.read(file.path)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      transaction = find_by_id(row["id"]) || new

      # loop to lowercase column names, doctor up reserved column names and weird values as necessary
      lowered_column_names_hash = {}
      row.to_hash.each_pair do |k,v|
        new_key = k.downcase.gsub(' ', '_').sub('type', 'trans_type')
        if (new_key.end_with?('date'))
          lowered_column_names_hash[new_key] = doctor_the_date(v)
        else
          lowered_column_names_hash[new_key] = v
        end
      end

      # create a signature used to detect duplicates
      signature = Digest::MD5.hexdigest(lowered_column_names_hash.values.join)

      if (Transaction.find_by(signature: signature) == nil)
        transaction.attributes = lowered_column_names_hash
        transaction.signature = signature
        transaction.save!
      end
    end
  end

  def self.doctor_the_date(csv_date)
    parts = csv_date.split('/')
    # ActiveRecord expects date before month
    # If input didn't have 4 digit year, make it one now
    parts[1] + '/' + parts[0] + '/' + (parts[2].length == 2 ? "20#{parts[2]}" : parts[2])
  end

end
