module TestrdGem
  class Lead

    attr_accessor :name, :last_name, :email, :company, :job_title, :phone, :website

    def initialize(name, last_name, email, company, job_title, phone, website)
      @name       = name
      @last_name  = last_name
      @email      = email
      @company    = company
      @job_title  = job_title
      @phone      = phone
      @website    = website
    end

  end
end
