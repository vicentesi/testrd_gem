require 'salesforce_bulk'
require 'pg'

module TestrdGem
  class Lead

    @@conn = PGconn.open(:dbname => 'testrd', :user => 'dev')
    @@index = 0

    def initialize(name, last_name, email, company, job_title, phone, website)
      res = @@conn.exec("INSERT INTO leads VALUES (" + @@index.to_s + ",'" + name + "','" + last_name + "','" + email + "','" + company + "','" + job_title + "','" + phone + "','" + website + "')")

      @@index += 1
    end

    def self.count
      res = @@conn.exec('SELECT count(*) FROM leads')
      res.getvalue(0,0).to_i
    end

    def self.all
      res = @@conn.exec('SELECT * FROM leads')
      result = []
      res.each do |row|
        result.push(row)
      end
      result
    end

    def self.show(id)
      res = @@conn.exec("SELECT * FROM leads WHERE id = '" + id.to_s + "'")
      res[0]
    end

    def self.delete(id)
      lead_d = self.show(id)
      res = @@conn.exec("DELETE FROM leads WHERE id = '" + id.to_s + "'")
      lead_d
    end

    def self.integrate(username, password, token)
      puts "Salesforce Integration"
      #salesforce = SalesforceBulk::Api.new("YOUR_SALESFORCE_USERNAME", "YOUR_SALESFORCE_PASSWORD+YOUR_SALESFORCE_TOKEN")
      salesforce = SalesforceBulk::Api.new(username, password + token)
    end

  end
end
