class Admin::JudgesController <  Admin::BaseController
    
    def index
        @judges = Judge.all
    end
    
end
