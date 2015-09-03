require 'active_support'
require 'databasedotcom'
require 'pg'

module TestrdGem
  class Lead

    @@conn = PGconn.open(:host => 'ec2-54-235-147-211.compute-1.amazonaws.com', :dbname => 'da0t8bv4p5butg', :user => 'sowqqzffnclwat', :password => 'wJxPixjzZYuASiDjq53lqvyC_e')
    #@@conn = PGconn.open(:dbname => 'testrd', :user => 'dev')
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

    def self.integrate(username, password, token, lead_params)
      client = Databasedotcom::Client.new :client_id => "3MVG9KI2HHAq33Rx7XIyfKc5aKIGHGMyvxp9bZHTRZNs1wZs_QI613iMloL9d2waIFXna4oWqvTuJmyMaFJtY", :client_secret => "6763675580231888688"

      client.authenticate :username => username, :password => password + token

      lead_class = client.materialize("Lead")

      client.create(lead_class, lead_params)
    end

  end
end
