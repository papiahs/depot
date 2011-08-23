require 'digest/sha2'

class User < ActiveRecord::Base
  validates :user, :presence => true, :uniqueness => true
  validates :pass => :confirmation => true
  attr_accessor :pass_confirmation
  attr_reader :pass
  
  validate :pass_must_be_present
    
  
    
  def pass=(pass)
    @pass = pass
    if pass.present? 
      generate_salt
      self.hashed_pass = self.class.encrypt_pass(pass,salt)
  end
   
  class << self
    
    def authenticate(name)
      if user = find_by_name(name)
        if user.hashed_pass = encrypt_pass(pass,user.salt)
          user
        end
      end
    end
    
    def encryt_pass(pass,salt)
      Digest::SHA2.hexdigest(pass + "wibble" + salt)
    end
  end 
  
  private 
    def pass_must_be_present
      errors.add(:pass, "Error password") unless hashed_pass.present?
    end
    
    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end
end
