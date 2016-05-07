module Frontend
  class DrugsController < FrontendController
    def index
      query = {}

      if params[:drug_names_disease_id].present?
        drug_names_disease_id = params[:drug_names_disease_id]
        # drug_names_disease_id = '56fcdceee8f111237421cd83'
        disease = Disease.find(drug_names_disease_id)
        drug_names = disease.drug_names
        query[:name.in] = drug_names
      end

      @drugs = Drug.where(query)

      if params[:sort_type].present?
        case params[:sort_type]
        when 'star'
          # 评价最好
          @drugs = @drugs.desc(:star)
        when 'click_count'
          # 人气最高
          @drugs = @drugs.desc(:click_count)
        else
          # 最近发布
          @drugs = @drugs.desc(:created_at)
        end
      end

        @drugs = @drugs.page(params[:page]).per(params[:per])
    end

    def show
      @drug = Drug.find(params[:id])

      @drug.visit!

      @comment = @drug.comments.desc(:created_at).first
    end
  end
end
