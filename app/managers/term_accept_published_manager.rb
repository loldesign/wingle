class TermAcceptPublishedManager
  def initialize(options={})
    @resource = options[:resource]
  end

  def process
    return false if TermCheckAcceptedManager.new(resource: @resource).process

    accepted!
  end

  private

  def published_term
    Term
      .with_for(@resource.class.name.underscore.to_sym)
      .published
      .order(created_at: :desc)
      .first
  end

  def accepted!
    TermAccept.create(
      acceptable: @resource,
      term: published_term()
    )
  end
end

# ---
# How to use?
# ---
# TermAcceptPublishedManager.new(resource: Candidate.first).process
