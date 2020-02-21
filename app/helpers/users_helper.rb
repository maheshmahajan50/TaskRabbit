module UsersHelper
  def valid_email?(str)
    reg = /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/
    !!(str =~ reg)
  end
end
