module BracketReadable
  def [](attr)
    return nil unless defined_instance_variable_reader?(attr)

    public_send(attr)
  end

  private def defined_instance_variable_reader?(attr)
    instance_attr = "@#{attr}".to_sym

    instance_variables.include?(instance_attr) && public_methods(false).include?(attr.to_sym)
  end
end
