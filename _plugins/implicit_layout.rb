module ImplicitLayout
  def read_yaml(*args)
    super
    self.data['layout'] ||= 'post'
    if self.data['layout'] == 'post'
      self.data['comments'] ||= 'true'
    end
  end
end

Jekyll::Post.send(:include, ImplicitLayout)