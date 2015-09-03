module TestrdGem
  class LeadStorage

    @@index = 0
    @@leads = []

    def initialize(name, last_name, email, company, job_title, phone, website)
      lead            = {}
      lead[:id]        = @@index
      lead[:name]      = name
      lead[:last_name] = last_name
      lead[:email]     = email
      lead[:company]   = company
      lead[:job_title] = job_title
      lead[:phone]     = phone
      lead[:website]   = website

      @@index     += 1
      @@leads.push(lead)
    end

    def self.count
      @@leads.count
    end

    def self.all
      @@leads
    end

    def self.show(id)
      for lead in @@leads
        if lead[:id] == id
          return lead
        end
      end
      return nil
    end

    def self.delete(id)
      idx_del = nil
      size = @@leads.count
      for i in 0..size-1
        if @@leads[i][:id] == id
          idx_del = i
        end
      end

      if idx_del
        @@leads.delete_at(idx_del)
      end
    end

    def self.integrate(username, password, token, lead_params)
      client = Databasedotcom::Client.new :client_id => "3MVG9KI2HHAq33Rx7XIyfKc5aKIGHGMyvxp9bZHTRZNs1wZs_QI613iMloL9d2waIFXna4oWqvTuJmyMaFJtY", :client_secret => "6763675580231888688"

      client.authenticate :username => username, :password => password + token

      lead_class = client.materialize("Lead")

      client.create(lead_class, lead_params)
    end

  end
end
