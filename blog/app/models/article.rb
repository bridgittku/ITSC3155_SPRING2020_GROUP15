class Article < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5 }
    validates :text, presence: true, length: { minimum: 10 }
    
    def self.search(search)
        if search
            searched_article = Article.find_by(title: search)
                if searched_article
                    self.where(id: searched_article)
                else
                    @articles = Article.all
                end
        else
            @articles = Article.all
        end
    end
end
