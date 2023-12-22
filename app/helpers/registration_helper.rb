module RegistrationHelper

  @errors_map = Hash.new

  def self.errors_map
    @errors_map
  end

  def self.add_error(error_type, error_text)
    @errors_map[error_type] = error_text
  end

end
