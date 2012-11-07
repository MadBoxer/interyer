module ApplicationHelper
  def getCategoryMenu(cat = nil, str = '')
    if not cat
      Category.where('parent_id=0').where('active=1').where('trash=0').each do |c|
        yield c
      end
    end
  end
end
