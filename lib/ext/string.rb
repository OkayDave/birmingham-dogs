class String

  def is_numeric?
    !!Kernel.Float(self)

  rescue
    false
  end

end
