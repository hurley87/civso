module OrgsHelper
  def join_tags(org)
    org.tags.map { |t| t.name }.join(", ")
  end
end
