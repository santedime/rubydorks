class BaseEngine
  def search(query)
    raise NotImplementedError, "Each search engine must implement its own search method"
  end
end