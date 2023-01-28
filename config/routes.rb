Rails.application.routes.draw do
  
  get("/forex", { :controller => "currencies", :action => "first_currency"})

  get("/forex/:origin", { :controller => "currencies", :action => "select_destination"})

  get("/forex/:origin/:destination", { :controller => "currencies", :action => "convert"})
  
end
