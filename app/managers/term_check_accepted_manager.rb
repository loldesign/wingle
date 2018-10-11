class TermCheckAcceptedManager
  def initialize(options={})
    @resource = options[:resource]
  end

  def process
    accepted?
  end

  private

  def published_term
    Term
      .with_for(@resource.class.name.underscore.to_sym)
      .published
      .order(created_at: :desc)
      .first
  end

  def accepted?
    TermAccept.where(
      acceptable_type: @resource.class.name,
      acceptable_id: @resource.id,
      term: published_term()
    ).present?
  end
end

# ---
# How to use?
# ---
# TermCheckAcceptedManager.new(resource: Candidate.first).process
