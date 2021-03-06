module ElasticsearchConfig
  module ConfinementCenter
    extend ActiveSupport::Concern

    included do
      include Elasticsearchable

      index_name    "yiliao-confinement_centers-#{Rails.env}"
      document_type 'confinement_centers'

      settings index: { number_of_shards: 5 } do
        mappings do
          indexes :telephone, type: 'string', index: :not_analyzed, analyzer: :keyword
          indexes :name, type: 'string'
          indexes :location, type: 'geo_point'
        end
      end
    end

    def as_indexed_json(option = {})
      {
        id: id.to_s,
        name: name,
        telephone: telephone,
        location: location
      }.as_json(option)
    end
  end
end
